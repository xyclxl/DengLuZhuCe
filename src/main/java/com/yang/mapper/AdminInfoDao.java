package com.yang.mapper;

import com.yang.javabean.AdminInfo;

import java.util.List;

public interface AdminInfoDao {

    /**
     * 添加用户
     * @param admin 添加的用户对象
     * @return 受影响的行数
     */
    int insert(AdminInfo admin);

    /**
     * 查询
     * @param admin 查询的对象
     * @return 查询成功的管理员
     */
    AdminInfo selectByNameAndPsd(AdminInfo admin);

    List<AdminInfo> selectAll();//查询所有的管理员

    /**
     * 删除管理员
     * @param admin 删除的管理员对象
     * @return 受影响的行数
     */
    int deleteByid(AdminInfo admin);

    /**
     * 修改管理员
     * @param admin 修改的管理员对象
     * @return 受影响的行数
     */
    int updateByid(AdminInfo admin);

    /**
     * 查询管理员
     * @param admin 修改的管理员对象
     * @return 受影响的行数
     */
    AdminInfo queryByid(AdminInfo admin);
}
