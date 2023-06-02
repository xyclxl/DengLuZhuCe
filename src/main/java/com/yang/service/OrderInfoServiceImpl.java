package com.yang.service;

import com.yang.javabean.OrderInfo;
import com.yang.mapper.OrderInfoDao;
import com.yang.mapper.OrderInfoDaoImpl;

import java.util.List;

public class OrderInfoServiceImpl implements OrderInfoService{

    private OrderInfoDaoImpl orderInfoDao = new OrderInfoDaoImpl();

    public int add(OrderInfo order) {
        return orderInfoDao.insertGoods(order);
    }
    public int delete(OrderInfo order){
        return orderInfoDao.deleteGoodsById(order);
    }
    public int update(OrderInfo order){
        return orderInfoDao.updateGoods(order);
    }

    /**
     * 查询
     *
     * @param order 查询的用户对象
     * @return 返回修改是否成功: 0:失败   1:成功
     */
    public OrderInfo queryByid(OrderInfo order) {
        return orderInfoDao.queryByid(order);
    }

    /**
     * 查询用户的订单
     *
     * @param ordernums 查询的用户对象
     * @return 返回修改是否成功: 0:失败   1:成功
     */
    public List<OrderInfo> userselectorderByName(String ordernums) {
        return  orderInfoDao.userselectorderByName(ordernums);
    }

}
