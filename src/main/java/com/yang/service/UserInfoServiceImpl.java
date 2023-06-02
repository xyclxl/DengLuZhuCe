package com.yang.service;

import com.yang.javabean.UserInfo;
import com.yang.mapper.UserInfoDaoImpl;

public class UserInfoServiceImpl implements UserInfoService{

private UserInfoDaoImpl userInfoDao = new UserInfoDaoImpl();

    public int add(UserInfo user) {
        return userInfoDao.insert(user);
    }

    /**
     * 删除
     *
     * @param user 删除的用户对象
     * @return 返回删除是否成功: 0:失败   1:成功
     */
    public int deleteByid(UserInfo user) {
        return userInfoDao.deleteByid(user);
    }

    /**
     * 修改
     *
     * @param user 修改的用户对象
     * @return 返回修改是否成功: 0:失败   1:成功
     */
    public int update(UserInfo user) {
        return userInfoDao.updateByid(user);
    }

    /**
     * 查询
     *
     * @param user 查询的用户对象
     * @return 返回修改是否成功: 0:失败   1:成功
     */
    public UserInfo queryByid(UserInfo user) {
        return userInfoDao.queryByid(user);
    }

    public UserInfo login(UserInfo user) {
        return userInfoDao.selectByNameAndPsd(user);
    }
}
