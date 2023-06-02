package com.yang.service;

import com.yang.javabean.AdminInfo;
import com.yang.javabean.UserInfo;

public interface UserInfoService {

    /**
     * 添加用户
     * @param user 添加的用户对象
     * @return 返回添加是否成功: 0:失败   1:成功
     */
    int add(UserInfo user);

    /**
     * 删除
     * @param user 删除的用户对象
     * @return 返回删除是否成功: 0:失败   1:成功
     */
    int deleteByid(UserInfo user);

    /**
     * 修改
     * @param user 修改的用户对象
     * @return 返回修改是否成功: 0:失败   1:成功
     */
    int update(UserInfo user);

    /**
     * 查询
     * @param user 查询的用户对象
     * @return 返回修改是否成功: 0:失败   1:成功
     */
    UserInfo queryByid(UserInfo user);

    /**
     * 登陆
     * @param user 登陆的用户对象
     * @return 登陆成功的用户
     */
    UserInfo login(UserInfo user);
}
