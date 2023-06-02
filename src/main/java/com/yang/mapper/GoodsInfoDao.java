package com.yang.mapper;

import com.yang.javabean.GoodsInfo;

import java.util.List;

public interface GoodsInfoDao {
    int insertGoods(GoodsInfo goods);
    int deleteGoodsById(GoodsInfo goods);
    int updateGoods(GoodsInfo goods);
    List<GoodsInfo> selectGoodsByName();
    GoodsInfo queryByid(GoodsInfo goods);
}
