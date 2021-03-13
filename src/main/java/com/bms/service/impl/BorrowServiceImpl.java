package com.bms.service.impl;

import com.bms.dao.BorrowDao;
import com.bms.pojo.Borrow;
import com.bms.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class BorrowServiceImpl implements BorrowService {
    @Autowired
    BorrowDao borrowDao;

    @Override
    public Integer addBorrow(Borrow borrow) {
        return borrowDao.addBorrow(borrow);
    }

    @Override
    public ArrayList<Borrow> getBorrows(Borrow borrow) {
        return borrowDao.getBorrows(borrow);
    }

    @Override
    public Integer returnBorrow(Borrow borrow) {
        return borrowDao.updateBorrow(borrow);
    }

    @Override
    public Borrow getBorrow(Integer borrowId) {
        return borrowDao.getBorrow(borrowId);
    }

    @Override
    public ArrayList<Borrow> getOverdueBorrows(Borrow borrow) {
        return borrowDao.getOverdueBorrows(borrow);
    }
}
