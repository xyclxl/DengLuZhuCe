package com.yang.service;

import com.yang.javabean.GoodsInfo;
import com.yang.mapper.GoodsInfoDaoImpl;

public class GoodsInfoServiceImpl implements GoodsInfoService{

    private GoodsInfoDaoImpl goodsInfoDao = new GoodsInfoDaoImpl();

    public int add(GoodsInfo goods) {
        return goodsInfoDao.insertGoods(goods);
    }
    public int delete(GoodsInfo goods){
        return goodsInfoDao.deleteGoodsById(goods);
    }
    public int update(GoodsInfo goods){
        return goodsInfoDao.updateGoods(goods);
    }

    /**
     * 查询
     *
     * @param goods 查询的用户对象
     * @return 返回修改是否成功: 0:失败   1:成功
     */
    public GoodsInfo queryByid(GoodsInfo goods) {
        return goodsInfoDao.queryByid(goods);
    }

}
