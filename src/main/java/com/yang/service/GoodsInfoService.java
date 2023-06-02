package com.yang.service;

import com.yang.javabean.GoodsInfo;

public interface GoodsInfoService {

    /**
     * 添加
     * @param goods 添加的管理员对象
     * @return 返回添加是否成功: 0:失败   1:成功
     */
    int add(GoodsInfo goods);

    /**
     * 删除
     * @param goods 删除的管理员对象
     * @return 返回删除是否成功: 0:失败   1:成功
     */
    int delete(GoodsInfo goods);

    /**
     * 修改
     * @param goods 修改的用户对象
     * @return 返回修改是否成功: 0:失败   1:成功
     */
    int update(GoodsInfo goods);

    /**
     * 查询
     * @param goods 查询的用户对象
     * @return 返回修改是否成功: 0:失败   1:成功
     */
    GoodsInfo queryByid(GoodsInfo goods);



}
