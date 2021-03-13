package com.bms.service;

import com.bms.pojo.Admin;

import java.util.ArrayList;

public interface AdminService {
    /**
     * 查询管理员
     * @param admin
     */
    public Admin getAdmin(Admin admin);

    /**
     * 跟新管理员信息
     * @param admin
     * @return
     */
    public Integer updateAdmin(Admin admin);


    public ArrayList<Admin> getAllAdmins(Admin admin);


    public Integer addAdmin(Admin admin);


    public Integer deleteAdmin(Integer adminId);
}
