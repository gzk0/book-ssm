package com.bms.service;

import com.bms.dao.ReaderDao;
import com.bms.pojo.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


public interface ReaderService {

    public ArrayList<Reader> getReaders(Reader reader);

    public Reader getReader(Reader reader);

    public Integer updateReader(Reader reader);

    public Integer addReader(Reader reader);

    public ArrayList<Reader> getLikeReaders(Reader reader);

    public Integer deleteReader(Integer rId);
}
