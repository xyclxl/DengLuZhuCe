package com.yang.mapper;

import com.yang.javabean.AdminInfo;
import com.yang.javabean.GoodsInfo;
import com.yang.javabean.OrderInfo;
import com.yang.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderInfoDaoImpl implements OrderInfoDao {
    private Connection conn;
    private PreparedStatement sta;
    private ResultSet set;
    //添加
    public int insertGoods(OrderInfo order) {
        try {
            conn = JDBCUtils.getConnection();//得到连接对象
            String sql = "insert into orderinfo(ordernum,ordername,ordernumber,ordertype,ordertime) values(?,?,?,?,?)";
            sta = conn.prepareStatement(sql);//得到发送sql对象
            //为sql语句中的?赋值 (问号的位置,值)
            System.out.println(order.toString());
            sta.setString(1, order.getOrdernum());
            sta.setString(2, order.getOrdername());
            sta.setString(3, order.getOrdernumber());
            sta.setString(4, order.getOrdertype());
            sta.setString(5, order.getOrdertime());
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
    public int deleteGoodsById(OrderInfo order) {
        try {
            conn = JDBCUtils.getConnection();//得到连接对象
            String sql = "delete from orderinfo where id=?";
            sta = conn.prepareStatement(sql);//得到发送sql对象
            //为sql语句中的?赋值 (问号的位置,值)
            sta.setInt(1, order.getId());
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
    public int updateGoods(OrderInfo order) {
        try {
            conn = JDBCUtils.getConnection();//得到连接对象
            String sql = "update orderinfo set ordernum=?,ordername=?,ordernumber=?,ordertype=?,ordertime=? where id =?";
            sta = conn.prepareStatement(sql);//得到发送sql对象
            //为sql语句中的?赋值 (问号的位置,值)
            sta.setString(1, order.getOrdernum());
            sta.setString(2, order.getOrdername());
            sta.setString(3, order.getOrdernumber());
            sta.setString(4, order.getOrdertype());
            sta.setString(5, order.getOrdertime());
            sta.setInt(6, order.getId());
            System.out.println(order);
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
    public List<OrderInfo> selectGoodsByName() {
        List<OrderInfo> result = new ArrayList<OrderInfo>();
        Connection connection = JDBCUtils.getConnection();
        String sql= "select * from orderinfo";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String ordernum = resultSet.getString("ordernum");
                String ordername = resultSet.getString("ordername");
                String ordernumber = resultSet.getString("ordernumber");
                String ordertype = resultSet.getString("ordertype");
                String ordertime = resultSet.getString("ordertime");
                result.add(new OrderInfo(id, ordernum,ordername,ordernumber,ordertype,ordertime));

            }
            return result;


        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }


        return null;
    }
//用户的订单所有查询
    public List<OrderInfo> userselectorderByName(String ordernums) {
        List<OrderInfo> result = new ArrayList<OrderInfo>();
        Connection connection = JDBCUtils.getConnection();
        String sql= "select * from orderinfo where ordernum=?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            //为sql语句赋值
            preparedStatement.setString(1,ordernums);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String ordernum = resultSet.getString("ordernum");
                String ordername = resultSet.getString("ordername");
                String ordernumber = resultSet.getString("ordernumber");
                String ordertype = resultSet.getString("ordertype");
                String ordertime = resultSet.getString("ordertime");
                result.add(new OrderInfo(id, ordernum,ordername,ordernumber,ordertype,ordertime));

            }
            return result;


        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }


        return null;
    }

    //查询(通过id)
    public OrderInfo queryByid(OrderInfo order) {
        OrderInfo orderInfo=null;
        try {
            conn = JDBCUtils.getConnection();//得到连接对象
            String sql = "select * from orderinfo where id=?";
            sta = conn.prepareStatement(sql);//得到发送sql对象
            sta.setInt(1, order.getId());
            ResultSet rs = sta.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String ordernum = rs.getString("ordernum");
                String ordername = rs.getString("ordername");
                String ordernumber = rs.getString("ordernumber");
                String ordertype = rs.getString("ordertype");
                String ordertime = rs.getString("ordertime");
                orderInfo = new OrderInfo(id,ordernum,ordername,ordernumber,ordertype,ordertime);

            }
            System.out.println(orderInfo);
            return orderInfo;
//            return admin;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn, sta);//关闭资源
        }
        return orderInfo;
    }
}
