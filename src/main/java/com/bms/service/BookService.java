package com.bms.service;

import com.bms.pojo.Book;

import java.util.ArrayList;

public interface BookService {
    /**
     * 添加书
     * @param book
     * @return
     */
    public Integer addBook(Book book);

    /**
     * 获取全部书
     * @param book
     * @return
     */
    public ArrayList<Book> getAllBooks(Book book);


    /**
     * 获取图书
     * @param book
     * @return
     */
    public Book getBook(Book book);


    /**
     * 更新图书
     * @param book
     * @return
     */
    public Integer updateBook(Book book);


    public ArrayList<Book> getLikeBooks(String condition);


    public Integer deleteBook(Integer bookId);
}
