package com.bms.service.impl;

import com.bms.dao.ReaderDao;
import com.bms.pojo.Reader;
import com.bms.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class ReaderServiceImpl implements ReaderService {

    @Autowired
    ReaderDao readerDao;

    @Override
    public ArrayList<Reader> getReaders(Reader reader) {
        return readerDao.getReaders(reader);
    }

    @Override
    public Reader getReader(Reader reader) {
        return readerDao.getReader(reader);
    }

    @Override
    public Integer updateReader(Reader reader) {
        return readerDao.updateReader(reader);
    }

    @Override
    public Integer addReader(Reader reader) {
        return readerDao.addReader(reader);
    }
    @Override
    public ArrayList<Reader> getLikeReaders(Reader reader){
        return readerDao.getLikeReaders(reader);
    }

    @Override
    public Integer deleteReader(Integer rId) {
        return readerDao.deleteReader(rId);
    }
}
