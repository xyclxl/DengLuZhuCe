package com.yang.mapper;

import com.yang.javabean.AdminInfo;
import com.yang.javabean.GoodsInfo;
import com.yang.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GoodsInfoDaoImpl implements GoodsInfoDao {
    private Connection conn;
    private PreparedStatement sta;
    private ResultSet set;
    //添加
    public int insertGoods(GoodsInfo goodsinfo) {
        try {
            conn = JDBCUtils.getConnection();//得到连接对象
            String sql = "insert into goodsinfo(goodnum,goodurl,goodname,goodtype,goodplace,goodprice,gooddescribe) values(?,?,?,?,?,?,?)";
            sta = conn.prepareStatement(sql);//得到发送sql对象
            //为sql语句中的?赋值 (问号的位置,值)
            System.out.println(goodsinfo.toString());
            sta.setString(1, goodsinfo.getGoodnum());
            sta.setString(2, goodsinfo.getGoodurl());
            sta.setString(3, goodsinfo.getGoodname());
            sta.setString(4, goodsinfo.getGoodtype());
            sta.setString(5, goodsinfo.getGoodplace());
            sta.setDouble(6, goodsinfo.getGoodprice());
            sta.setString(7, goodsinfo.getGooddescribe());
            //执行sql 增删改操作使用:executeUpdate()  查询操作使用:executeQuery()
            int getRow = sta.executeUpdate();
            return getRow;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn, sta);//关闭资源
        }
        return 0;
    }

    //删除
    public int deleteGoodsById(GoodsInfo good) {
        try {
            conn = JDBCUtils.getConnection();//得到连接对象
            String sql = "delete from goodsinfo where id=?";
            sta = conn.prepareStatement(sql);//得到发送sql对象
            //为sql语句中的?赋值 (问号的位置,值)
            sta.setInt(1, good.getId());
            //执行sql 增删改操作使用:executeUpdate()  查询操作使用:executeQuery()
            int getRow = sta.executeUpdate();
            return getRow;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn, sta);//关闭资源
        }
        return 0;
    }

    //修改
    public int updateGoods(GoodsInfo goods) {
        try {
            conn = JDBCUtils.getConnection();//得到连接对象
            String sql = "update goodsinfo set goodnum=?,goodname=?,goodtype=?,goodplace=?,goodprice=?,gooddescribe=? where id =?";
            sta = conn.prepareStatement(sql);//得到发送sql对象
            //为sql语句中的?赋值 (问号的位置,值)
            sta.setString(1, goods.getGoodnum());
            sta.setString(2, goods.getGoodname());
            sta.setString(3, goods.getGoodtype());
            sta.setString(4, goods.getGoodplace());
            sta.setDouble(5, goods.getGoodprice());
            sta.setString(6, goods.getGooddescribe());
            sta.setInt(7, goods.getId());
            System.out.println(goods);
            //执行sql 增删改操作使用:executeUpdate()  查询操作使用:executeQuery()
            int getRow = sta.executeUpdate();
            return getRow;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn, sta);//关闭资源
        }
        return 0;
    }

    //查询所有
    public List<GoodsInfo> selectGoodsByName() {
        List<GoodsInfo> result = new ArrayList<GoodsInfo>();
        Connection connection = JDBCUtils.getConnection();
        String sql= "select * from goodsinfo";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int goodId = resultSet.getInt("id");
                String goodnum = resultSet.getString("goodnum");
                String goodname = resultSet.getString("goodname");
                String goodtype = resultSet.getString("goodtype");
                String goodplace = resultSet.getString("goodplace");
                double goodprice = resultSet.getDouble("goodprice");
                String goodurl = resultSet.getString("goodurl");
                String gooddescribe = resultSet.getString("gooddescribe");
                result.add(new GoodsInfo(goodId, goodnum,goodname,goodtype,goodplace,goodprice,goodurl,gooddescribe));

            }
            return result;


        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }


        return null;
    }

    //查询(通过id)
    public GoodsInfo queryByid(GoodsInfo goods) {
        GoodsInfo goodsInfo=null;
        try {
            conn = JDBCUtils.getConnection();//得到连接对象
            String sql = "select * from goodsinfo where id=?";
            sta = conn.prepareStatement(sql);//得到发送sql对象
            sta.setInt(1, goods.getId());
            ResultSet rs = sta.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String goodnum = rs.getString("goodnum");
                String goodname = rs.getString("goodname");
                String goodtype = rs.getString("goodtype");
                String goodplace = rs.getString("goodplace");
                double goodprice = rs.getDouble("goodprice");
                String gooddescribe = rs.getString("gooddescribe");
                goodsInfo = new GoodsInfo( goodnum,goodname,goodtype,goodplace,goodprice,gooddescribe,id);

            }
            System.out.println(goodsInfo);
            return goodsInfo;
//            return admin;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn, sta);//关闭资源
        }
        return goods;
    }
}
