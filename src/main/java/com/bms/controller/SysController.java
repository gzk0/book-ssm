package com.bms.controller;

import com.bms.pojo.Admin;
import com.bms.pojo.Book;
import com.bms.pojo.Borrow;
import com.bms.pojo.Reader;
import com.bms.service.AdminService;
import com.bms.service.BookService;
import com.bms.service.BorrowService;
import com.bms.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

@Controller
@RequestMapping("/admin")
public class SysController {
    @Autowired
    ReaderService readerService;
    @Autowired
    BookService bookService;
    @Autowired
    BorrowService borrowService;
    @Autowired
    AdminService adminService;

    /**
     * 查询所有读者
     *
     * @param request
     * @return
     */
    @GetMapping("/getReaders.do")
    public String getReaders(HttpServletRequest request,@RequestParam(required = false) Integer rPrivilege ) {
        Reader reader = new Reader();
        reader.setrPrivilege(rPrivilege);
        ArrayList<Reader> readers = readerService.getReaders(reader);

        request.setAttribute("readers", readers);
        return "pageAdmin/showAllReader";
    }

    @GetMapping("/searchReader.do")
    public String searchReader(Reader reader, HttpServletRequest request) {
        ArrayList<Reader> readers = readerService.getLikeReaders(reader);
        request.setAttribute("readers", readers);
        return "pageAdmin/searchReader";
    }


    @GetMapping("/addReader.do")
    public String toAddReader() {
        return "pageAdmin/addReader";
    }

    @PostMapping("/addReader.do")
    public String AddReader(Reader reader, HttpServletRequest request) {

        reader.setrRegistTime(new Timestamp(new Date().getTime()));
        readerService.addReader(reader);
        request.setAttribute("addInfo", "“" + reader.getrCard() + "”添加成功");
        return "pageAdmin/addReader";
    }


    @GetMapping("/addBook.do")
    public String toAddBook() {
        return "pageAdmin/addNewBook";
    }

    @PostMapping("/addBook.do")
    public String addBook(Book book, @RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
        String parentPaht = request.getServletContext().getRealPath("/");
        File file = new File(parentPaht + File.separator + "bookPhoto" + File.separator);

        if (!file.exists() || !file.isDirectory()) {
            file.mkdirs();
        }
        String fileName = UUID.randomUUID().toString().replace("-", "");
        if (!multipartFile.isEmpty()) {
            String path = file.getPath();
            String originalFilename = multipartFile.getOriginalFilename();
            fileName = fileName + originalFilename.substring(originalFilename.lastIndexOf('.'));
            File headPhoto = new File(path + File.separator + fileName);
            try {
                multipartFile.transferTo(headPhoto);
            } catch (IOException e) {
                e.printStackTrace();
            }
            book.setbPath(fileName);
        }
        book.setbJoinTime(new Timestamp(new Date().getTime()));
        book.setbLendNum(0);
        book.setbState(0);
        bookService.addBook(book);

        return "redirect:/admin/getAllBooks.do";
    }


    @RequestMapping("/getAllBooks.do")
    public String getBooks(HttpServletRequest request) {
        Book tempBook = new Book();
        tempBook.setbState(0);
        ArrayList<Book> books = bookService.getAllBooks(tempBook);
        request.setAttribute("books", books);
        return "pageAdmin/showAllBook";
    }

    @GetMapping("/{bookId}/getBookInfo.do")
    public String showBookInfo(@PathVariable("bookId") Integer bookId, HttpServletRequest request) {
        Book tempBook = new Book();
        tempBook.setId(bookId);
        Book book = bookService.getBook(tempBook);
        request.setAttribute("book", book);
        return "pageAdmin/bookDetail";
    }

    @GetMapping("/{bookId}/editBookInfo.do")
    public String toEditBookInfo(@PathVariable("bookId") Integer bookId, HttpServletRequest request) {
        Book tempBook = new Book();
        tempBook.setId(bookId);
        Book book = bookService.getBook(tempBook);
        request.setAttribute("book", book);
        return "pageAdmin/editBook";
    }

    @PostMapping("/updateBook.do")
    public String updateBook(Book book, @RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
        String parentPaht = request.getServletContext().getRealPath("/");
        File file = new File(parentPaht + File.separator + "bookPhoto" + File.separator);

        if (!file.exists() || !file.isDirectory()) {
            file.mkdirs();
        }
        String fileName = UUID.randomUUID().toString().replace("-", "");
        if (!multipartFile.isEmpty()) {
            String path = file.getPath();
            String originalFilename = multipartFile.getOriginalFilename();
            fileName = fileName + originalFilename.substring(originalFilename.lastIndexOf('.'));
            File headPhoto = new File(path + File.separator + fileName);
            try {
                multipartFile.transferTo(headPhoto);
            } catch (IOException e) {
                e.printStackTrace();
            }
            book.setbPath(fileName);
        }
        bookService.updateBook(book);
        return "redirect:/admin/" + book.getId() + "/getBookInfo.do";
    }


    @GetMapping("/toSearchBook.do")
    public String toSearchBook() {
        return "pageAdmin/searchBook";
    }

    @GetMapping("/searchBook.do")
    public String searchBook(String condition, HttpServletRequest request) {
        condition = "%" + condition + "%";
        ArrayList<Book> books = bookService.getLikeBooks(condition);
        request.setAttribute("books", books);
        return "pageAdmin/searchBook";
    }


    @GetMapping("/getAllOffBook.do")
    public String getAllOffBook(HttpServletRequest request) {
        Book book = new Book();
        book.setbState(1);
        ArrayList<Book> books = bookService.getAllBooks(book);
        request.setAttribute("books", books);
        return "pageAdmin/delBookList";
    }


    @GetMapping("/{bookId}/offBook.do")
    public String offBook(@PathVariable("bookId") Integer bookId) {
        Book book = new Book();
        book.setId(bookId);
        book.setbState(1);
        bookService.updateBook(book);
        return "forward:/admin/getAllOffBook.do";
    }

    @GetMapping("/{bookId}/onBook.do")
    public String onBook(@PathVariable("bookId") Integer bookId) {
        Book book = new Book();
        book.setId(bookId);
        book.setbState(0);
        bookService.updateBook(book);
        return "forward:/admin/getAllOffBook.do";
    }

    @GetMapping("/{bookId}/deleteBook.do")
    public String deleteBook(@PathVariable("bookId") Integer bookId) {
        bookService.deleteBook(bookId);
        return "forward:/admin/getAllOffBook.do";
    }


    @GetMapping("/getBorrows.do")
    public String getBorrows(@RequestParam(required = false) Integer state, HttpServletRequest request) {
        Borrow borrow = new Borrow();
        borrow.setState(state);
        ArrayList<Borrow> borrows = borrowService.getBorrows(borrow);
        request.setAttribute("borrows", borrows);
        return "pageAdmin/borrowBook";
    }

    @GetMapping("/{readerId}/getReaderInof.do")
    public String getReaderInof(@PathVariable("readerId") Integer readerId, HttpServletRequest request) {
        Reader readerTemp = new Reader();
        readerTemp.setrId(readerId);
        Reader reader = readerService.getReader(readerTemp);
        request.setAttribute("reader", reader);
        return "PageReader/userInfo";
    }

    @GetMapping("/{readerId}/getBorrowsByReader.do")
    public String getBorrowsByReader(@PathVariable("readerId") Integer readerId, HttpServletRequest request) {
        Reader reader = new Reader();
        reader.setrId(readerId);
        Borrow borrow = new Borrow();
        borrow.setReader(reader);
        ArrayList<Borrow> borrows = borrowService.getBorrows(borrow);
        request.setAttribute("borrows", borrows);
        return "PageReader/borrowRecord";
    }

    @GetMapping("/{rId}/deleteReader.do")
    public String deleteReader(@PathVariable("rId") Integer rId, HttpServletRequest request) {
        Integer result = readerService.deleteReader(rId);
        request.setAttribute("deleteInfo", "删除成功");
        return "redirect:/admin/getReaders.do";
    }

    @GetMapping("/getAllAdmins.do")
    public String getAllAdmins(HttpServletRequest request) {
        ArrayList<Admin> admins = adminService.getAllAdmins(new Admin());
        request.setAttribute("admins",admins);
        return "pageAdmin/showAllAdmin";
    }

    @GetMapping("/addAdmin.do")
    public String toAddAdmin(){
        return "pageAdmin/addAdmin";
    }

    @PostMapping("/addAdmin.do")
    public String addAdmin(Admin admin,HttpServletRequest request){
        if(admin.getaPassword()==null ||
                admin.getaPassword()==""||
                admin.getaNick()==null ||
                admin.getaNick()=="" || admin.getaEmail()==null ||admin.getaEmail()==""){
            request.setAttribute("addInfo", "请将信息补充完整");
            return "pageAdmin/addAdmin";
        }
        admin.setaRegistTime(new Timestamp(new Date().getTime()));
        adminService.addAdmin(admin);
        request.setAttribute("addInfo", "管理员添加成功");
        return "pageAdmin/addAdmin";
    }

    @GetMapping("/{adminId}/disableAdmin.do")
    public String disableAdmin(@PathVariable("adminId") Integer adminId){
        Admin admin = new Admin();
        admin.setaId(adminId);
        admin.setaState(1);
        adminService.updateAdmin(admin);
        return "forward:/admin/getAllAdmins.do";
    }

    @GetMapping("/{adminId}/ableAdmin.do")
    public String ableAdmin(@PathVariable("adminId") Integer adminId){
        Admin admin = new Admin();
        admin.setaId(adminId);
        admin.setaState(0);
        adminService.updateAdmin(admin);
        return "forward:/admin/getAllAdmins.do";
    }

    @GetMapping("/{adminId}/deleteAdmin.do")
    public String deleteAdmin(@PathVariable("adminId") Integer adminId){
        adminService.deleteAdmin(adminId);
        return "forward:/admin/getAllAdmins.do";
    }


}

