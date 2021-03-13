package com.bms.controller;

import com.bms.dao.BookDao;
import com.bms.pojo.Book;
import com.bms.pojo.Borrow;
import com.bms.pojo.Reader;
import com.bms.service.BookService;
import com.bms.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class ReaderBookController {

    @Autowired
    BookService bookService;

    @Autowired
    BorrowService borrowService;

    @GetMapping("/getAllBook.do")
    public String getAllBook(HttpServletRequest request) {
        Book tempBook = new Book();
        tempBook.setbState(0);
        ArrayList<Book> books = bookService.getAllBooks(tempBook);
        request.setAttribute("books", books);
        return "PageReader/showAllBook";
    }

    @GetMapping("/{bookId}/getBookDetail.do")
    public String getBookDetail(@PathVariable("bookId") Integer id, HttpServletRequest request) {
        Book tempBook = new Book();
        tempBook.setId(id);
        Book book = bookService.getBook(tempBook);
        request.setAttribute("book", book);
        return "PageReader/bookInfo";
    }

    @GetMapping("/{bookId}/borrowBook.do")
    public String borrowBook(@PathVariable("bookId") Integer bookId, HttpSession session,HttpServletRequest request) {

        Reader reader = (Reader) session.getAttribute("reader");
        Book tempBook = new Book();
        tempBook.setId(bookId);
        Borrow tempBorrow = new Borrow();
        tempBorrow.setReader(reader);
        tempBorrow.setBook(tempBook);
        tempBorrow.setState(0);
        ArrayList<Borrow> borrows = borrowService.getBorrows(tempBorrow);
        if(borrows==null || borrows.isEmpty()){
            Book book = bookService.getBook(tempBook);
            Date date = new Date();
            Timestamp startTime = new Timestamp(date.getTime());//30L * 24L * 60L * 60L * 1000L = 30天
            Long timeTap = 30L * 24L * 60L * 60L * 1000L;
            if(reader.getrPrivilege()==1){
                timeTap*=3;
            }
            Timestamp endTime = new Timestamp(date.getTime() + timeTap );
            Borrow borrow = new Borrow(null, startTime, endTime, book, reader, null, null);
            book.setbLendNum(book.getbLendNum() + 1);
            bookService.updateBook(book);
            borrowService.addBorrow(borrow);
            return "redirect:/" + bookId + "/getBookDetail.do";
        }else{
            request.setAttribute("borrowInfo", "不可重复借阅");
            return "forward:/" + bookId + "/getBookDetail.do";
        }
    }


    @GetMapping("/getBorrows.do")
    public String getBorrows(HttpSession session, HttpServletRequest request) {
        Reader reader = (Reader) session.getAttribute("reader");
        Borrow borrow = new Borrow();
        borrow.setReader(reader);
        ArrayList<Borrow> borrows = borrowService.getBorrows(borrow);
        request.setAttribute("borrows", borrows);
        return "PageReader/borrowRecord";
    }

    @GetMapping("/getBorrowsOnReturn.do")
    public String getBorrowsOnReturn(HttpSession session, HttpServletRequest request) {
        Reader reader = (Reader) session.getAttribute("reader");
        Borrow borrow = new Borrow();
        borrow.setReader(reader);
        borrow.setState(1);
        ArrayList<Borrow> borrows = borrowService.getBorrows(borrow);
        request.setAttribute("borrows", borrows);
        return "PageReader/borrowRecord";
    }

    @GetMapping("/getBorrowsOnNoReturn.do")
    public String getBorrowsOnNoReturn(HttpSession session, HttpServletRequest request) {
        Reader reader = (Reader) session.getAttribute("reader");
        Borrow borrow = new Borrow();
        borrow.setReader(reader);
        borrow.setState(0);
        ArrayList<Borrow> borrows = borrowService.getBorrows(borrow);
        request.setAttribute("borrows", borrows);
        return "PageReader/borrowRecord";
    }

    @GetMapping("/getOverdueBorrows.do")
    public String getOverdueBorrows(@RequestParam(required = false) Integer state, HttpSession session, HttpServletRequest request) {

        Reader reader = (Reader) session.getAttribute("reader");
        Borrow borrow = new Borrow();
        borrow.setReader(reader);
        borrow.setState(state);
        borrow.setEndTime(new Timestamp(new Date().getTime()));
        ArrayList<Borrow> borrows = borrowService.getOverdueBorrows(borrow);
        request.setAttribute("borrows", borrows);
        return "PageReader/overdueBorrowRecord";
    }

    @GetMapping("/{borrowid}/returnBook.do")
    public String returnBook(@PathVariable("borrowid") Integer borrowId) {
        Borrow tempBorrow = borrowService.getBorrow(borrowId);
        Book tempBook = bookService.getBook(tempBorrow.getBook());
        Book book = new Book();
        book.setId(tempBook.getId());
        book.setbLendNum(tempBook.getbLendNum() - 1);
        bookService.updateBook(book);
        Borrow borrow = new Borrow();
        borrow.setId(tempBorrow.getId());
        borrow.setState(1);
        borrow.setReturnTime(new Timestamp(new Date().getTime()));
        borrowService.returnBorrow(borrow);
        return "redirect:/getBorrows.do";
    }


    @GetMapping("/searchBook.do")
    public String getLikeBooks(String condition, HttpServletRequest request) {
        condition = "%" + condition + "%";
        ArrayList<Book> books = bookService.getLikeBooks(condition);
        request.setAttribute("books", books);
        return "PageReader/showAllBook";
    }

    @GetMapping("/getOverdueBorrow.do")
    public String getOverdueBorrow() {
        return null;
    }
}

