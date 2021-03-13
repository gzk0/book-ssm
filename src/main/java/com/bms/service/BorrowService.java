package com.bms.service;

import com.bms.pojo.Borrow;

import java.util.ArrayList;

public interface BorrowService {

    /**
     * 新增图书借阅记录
     * @param borrow
     * @return
     */
    Integer addBorrow(Borrow borrow);


    ArrayList<Borrow> getBorrows(Borrow borrow);

    /**
     * 归还图书
     * @param borrow
     * @return
     */
    Integer returnBorrow(Borrow borrow);


    Borrow getBorrow(Integer borrowId);

    ArrayList<Borrow> getOverdueBorrows(Borrow borrow);


}
