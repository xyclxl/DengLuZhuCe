package com.yang.mapper;

import com.yang.javabean.OrderInfo;

import java.util.List;

public interface OrderInfoDao {
    int insertGoods(OrderInfo order);
    int deleteGoodsById(OrderInfo order);
    int updateGoods(OrderInfo order);
    List<OrderInfo> selectGoodsByName();
    List<OrderInfo> userselectorderByName(String ordernums);
    OrderInfo queryByid(OrderInfo order);

}
