package com.yang.mapper;

import com.yang.javabean.AdminInfo;
import com.yang.javabean.UserInfo;

import java.util.List;

public interface UserInfoDao {

    /**
     * 添加用户
     * @param user 添加的用户对象
     * @return 受影响的行数
     */
    int insert(UserInfo user);

    /**
     * 删除用户
     * @param user 添加的用户对象
     * @return 受影响的行数
     */
    int deleteByid(UserInfo user);

    /**
     * 查询
     * @param user 查询的对象
     * @return 查询成功的用户
     */
    UserInfo selectByNameAndPsd(UserInfo user);

    /**
     * 修改用户
     * @param user 添加的用户对象
     * @return 受影响的行数
     */
    int updateByid(UserInfo user);

    /**
     * 查询用户
     * @param user 修改的用户对象
     * @return 受影响的行数
     */
    UserInfo queryByid(UserInfo user);

    List<UserInfo> selectAll();//查询所有的用户
}
