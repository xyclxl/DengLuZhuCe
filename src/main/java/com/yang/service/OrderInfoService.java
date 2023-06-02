package com.yang.service;

import com.yang.javabean.GoodsInfo;
import com.yang.javabean.OrderInfo;

import java.util.List;

public interface OrderInfoService {

    /**
     * 添加
     * @param order 添加的管理员对象
     * @return 返回添加是否成功: 0:失败   1:成功
     */
    int add(OrderInfo order);

    /**
     * 删除
     * @param order 删除的管理员对象
     * @return 返回删除是否成功: 0:失败   1:成功
     */
    int delete(OrderInfo order);

    /**
     * 修改
     * @param order 修改的用户对象
     * @return 返回修改是否成功: 0:失败   1:成功
     */
    int update(OrderInfo order);

    /**
     * 查询
     * @param order 查询的用户对象
     * @return 返回修改是否成功: 0:失败   1:成功
     */
    OrderInfo queryByid(OrderInfo order);

    /**
     * 查询用户的订单
     * @param ordernums 查询的用户对象
     * @return 返回修改是否成功: 0:失败   1:成功
     */
    List<OrderInfo> userselectorderByName(String ordernums);


}
