package com.bms.dao;

import com.bms.pojo.Reader;

import java.util.ArrayList;

public interface ReaderDao {
    /**
     * 查询读者
     * @param reader
     * @return
     */
    public Reader getReader(Reader reader);

    /**
     * 添加读者
     * @param reader
     * @return
     */
    public Integer addReader(Reader reader);

    /**
     * 根据删除reader
     * @param r_id
     * @return
     */
    public Integer deleteReader(int r_id);

    /**
     * 查询多个读者
     * @return
     */
    public ArrayList<Reader> getReaders(Reader reader);

    /**
     * 跟新读者
     * @param reader
     * @return
     */
    public Integer updateReader(Reader reader);

    public ArrayList<Reader> getLikeReaders(Reader reader);


    public Integer deleteReader(Integer rId);

}
