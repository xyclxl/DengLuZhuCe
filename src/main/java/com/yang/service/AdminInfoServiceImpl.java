package com.yang.service;

import com.yang.javabean.AdminInfo;
import com.yang.mapper.AdminInfoDaoImpl;

public class AdminInfoServiceImpl implements AdminInfoService{

    private AdminInfoDaoImpl adminInfoDao = new AdminInfoDaoImpl();


    public int add(AdminInfo admin) {
        return adminInfoDao.insert(admin);
    }
    public int delete(AdminInfo admin){
        return adminInfoDao.deleteByid(admin);
    }
    public int update(AdminInfo admin){
        return adminInfoDao.updateByid(admin);
    }
    public AdminInfo queryByid(AdminInfo admin){
        return adminInfoDao.queryByid(admin);
    }

    public AdminInfo login(AdminInfo admin) {
        return adminInfoDao.selectByNameAndPsd(admin);
    }
}
