package com.bms.dao;

import com.bms.pojo.Book;

import java.util.ArrayList;

public interface BookDao {
    /**
     *获取图书
     * @return
     */
    public Book getBook(Book book);

    /**
     * 获取大量图书
     * @param book
     * @return
     */
    public ArrayList<Book> getBooks(Book book);


    /**
     * 添加图书
     * @param book
     * @return
     */
    public Integer addBook(Book book);

    /**
     * 修改图书
     * @param book
     * @return
     */
    public Integer updateBook(Book book);


    public ArrayList<Book> getLikeBooks(String condition);

    /**
     * 删除图书
     * @param bookId
     * @return
     */
    public Integer deleteBook(Integer bookId);

}
