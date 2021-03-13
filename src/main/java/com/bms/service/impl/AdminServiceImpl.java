package com.bms.service.impl;

import com.bms.dao.AdminDao;
import com.bms.pojo.Admin;
import com.bms.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminDao adminDao;

    @Override
    public Admin getAdmin(Admin admin) {
        return adminDao.getAdmin(admin);
    }

    @Override
    public Integer updateAdmin(Admin admin) {
        return adminDao.updateAdmin(admin);
    }

    @Override
    public ArrayList<Admin> getAllAdmins(Admin admin) {
        return adminDao.getAllAdmins(admin);
    }

    @Override
    public Integer addAdmin(Admin admin) {
        return adminDao.addAdmin(admin);
    }

    @Override
    public Integer deleteAdmin(Integer adminId) {
        return adminDao.deleteAdmin(adminId);
    }


}
