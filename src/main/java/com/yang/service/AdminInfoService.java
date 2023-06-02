package com.yang.service;

import com.yang.javabean.AdminInfo;

public interface AdminInfoService {

    /**
     * 添加
     * @param admin 添加的管理员对象
     * @return 返回添加是否成功: 0:失败   1:成功
     */
    int add(AdminInfo admin);

    /**
     * 删除
     * @param admin 删除的管理员对象
     * @return 返回删除是否成功: 0:失败   1:成功
     */
    int delete(AdminInfo admin);

    /**
     * 修改
     * @param admin 修改的用户对象
     * @return 返回修改是否成功: 0:失败   1:成功
     */
    int update(AdminInfo admin);

    /**
     * 查询
     * @param admin 查询的用户对象
     * @return 返回修改是否成功: 0:失败   1:成功
     */
    AdminInfo queryByid(AdminInfo admin);

    /**
     * 登陆
     * @param admin 登陆的用户对象
     * @return 登陆成功的用户
     */
     AdminInfo login(AdminInfo admin);


}
