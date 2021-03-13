package com.bms.dao;

import com.bms.pojo.Borrow;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface BorrowDao {
    /**
     * 添加借阅记录
     * @param borrow
     * @return
     */
    Integer addBorrow(Borrow borrow);

    /**
     * 获取借阅记录
     * @param
     * @return
     */
    ArrayList<Borrow> getBorrows(Borrow borrow);

    /**
     * 跟新记录
     * @param borrow
     * @return
     */
    Integer updateBorrow(Borrow borrow);


    Borrow getBorrow(Integer borrowId);

    ArrayList<Borrow> getOverdueBorrows(Borrow borrow);
}
