package com.bms.service.impl;

import com.bms.dao.BookDao;
import com.bms.pojo.Book;
import com.bms.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    BookDao bookDao;


    @Override
    public Integer addBook(Book book) {
        return bookDao.addBook(book);
    }

    @Override
    public ArrayList<Book> getAllBooks(Book book) {
        return bookDao.getBooks(book);
    }

    @Override
    public Book getBook(Book book) {
        return bookDao.getBook(book);
    }

    @Override
    public Integer updateBook(Book book) {
        return bookDao.updateBook(book);
    }

    @Override
    public ArrayList<Book> getLikeBooks(String condition) {
        return bookDao.getLikeBooks(condition);
    }

    @Override
    public Integer deleteBook(Integer bookId) {
        return bookDao.deleteBook(bookId);
    }
}
