package com.bms.dao;


import com.bms.pojo.Admin;

import java.util.ArrayList;

public interface AdminDao {
    /**
     * 查询管理员
     * @param admin
     * @return
     */
    public Admin getAdmin(Admin admin);

    /**
     * 添加管理员
     * @param admin
     * @return
     */
    public Integer addAdmin(Admin admin);


    /**
     * 跟新管理员信息
     * @param admin
     * @return
     */
    public Integer updateAdmin(Admin admin);


    public ArrayList<Admin> getAllAdmins(Admin admin);


    public Integer deleteAdmin(Integer adminId);

}
