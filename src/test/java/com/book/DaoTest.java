package com.book;

import com.bms.dao.BorrowDao;
import com.bms.pojo.Borrow;
import com.bms.pojo.Reader;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

@ContextConfiguration(value = "classpath:spring.xml")
@RunWith(value = SpringJUnit4ClassRunner.class)
public class DaoTest {

    @Autowired
    BorrowDao borrowDao;

    @Test
    public void updateBorrow(){
        Borrow borrow = new Borrow();
        borrow.setId(26);
        borrow.setState(1);
        borrow.setReturnTime(new Timestamp(new Date().getTime()));
        borrowDao.updateBorrow(borrow);
    }

    @Test
    public void getBorrow(){
        Borrow borrow = borrowDao.getBorrow(18);
        System.out.println(borrow);
    }


    @Test
    public void getBorrows(){
        Reader reader = new Reader();
        reader.setrId(1);
        Borrow borrow = new Borrow();
        borrow.setEndTime(new Timestamp(new Date().getTime()));
        borrow.setReader(reader);
        ArrayList<Borrow> borrows = borrowDao.getBorrows(borrow);
        borrows.forEach(System.out::println);
    }
}
