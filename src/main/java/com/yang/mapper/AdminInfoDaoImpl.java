package com.yang.mapper;

import com.yang.javabean.AdminInfo;
import com.yang.utils.JDBCUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminInfoDaoImpl implements AdminInfoDao{
    private Connection conn;
    private PreparedStatement sta;
    private ResultSet set;
    //添加
    public int insert(AdminInfo admin) {
        try {
            conn = JDBCUtils.getConnection();//得到连接对象
            String sql = "insert into Admininfo(admin_name,admin_password,admin_email,admin_phone,admin_sign,subtime) values(?,?,?,?,?,?)";
            sta = conn.prepareStatement(sql);//得到发送sql对象
            //为sql语句中的?赋值 (问号的位置,值)
            System.out.println(admin.toString());
            sta.setString(1, admin.getAdmin_name());
            sta.setString(2, admin.getAdmin_password());
            sta.setString(3, admin.getAdmin_email());
            sta.setString(4, admin.getAdmin_phone());
            sta.setString(5, admin.getAdmin_sign());
            sta.setTimestamp(6, admin.getSubtime());
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
    //登录
    public AdminInfo selectByNameAndPsd(AdminInfo admin) {
        try {
            conn = JDBCUtils.getConnection();
            String sql = "select * from admininfo where admin_name=? and admin_password=?";
            sta = conn.prepareStatement(sql);
            sta.setString(1, admin.getAdmin_name());
            sta.setString(2, admin.getAdmin_password());
            set = sta.executeQuery();
            AdminInfo adminInfo = null;
            while (set.next()) {
                int id = set.getInt("id");
                String admin_name = set.getString("admin_name");
                String admin_password = set.getString("admin_password");
                String admin_email = set.getString("admin_email");
                String admin_phone = set.getString("admin_phone");
                Timestamp subtime = set.getTimestamp("subtime");
                String admin_sign = set.getString("admin_sign");
                adminInfo = new AdminInfo(id, admin_name, admin_password,admin_email,admin_phone,subtime,admin_sign);
            }
            return adminInfo;


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn, sta, set);//关闭资源
        }

        return null;
    }
    //查询所有
    public List<AdminInfo> selectAll() {
        List<AdminInfo> rs = new ArrayList<AdminInfo>();
        Connection connection = JDBCUtils.getConnection();
        String sql= "select * from admininfo where id!=1";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rsSet = preparedStatement.executeQuery();
            while (rsSet.next()) {
                int id = rsSet.getInt("id");
                String admin_name = rsSet.getString("admin_name");
                String admin_password = rsSet.getString("admin_password");
                String admin_email = rsSet.getString("admin_email");
                String admin_phone = rsSet.getString("admin_phone");
                Timestamp subtime = rsSet.getTimestamp("subtime");
                String admin_sign = rsSet.getString("admin_sign");
                rs.add(new AdminInfo(id, admin_name,admin_password,admin_email,admin_phone,subtime,admin_sign));
            }
            return rs;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    //删除
    public int deleteByid(AdminInfo admin) {
        try {
            conn = JDBCUtils.getConnection();//得到连接对象
            String sql = "delete from Admininfo where id=?";
            sta = conn.prepareStatement(sql);//得到发送sql对象
            //为sql语句中的?赋值 (问号的位置,值)
            sta.setInt(1, admin.getId());
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

    /**
     * 修改
     */
    public int updateByid(AdminInfo admin) {
        try {
            conn = JDBCUtils.getConnection();//得到连接对象
            String sql = "update Admininfo set admin_name=?,admin_password=?,admin_email=?,admin_phone=?,admin_sign=? where id =?";
            sta = conn.prepareStatement(sql);//得到发送sql对象
            //为sql语句中的?赋值 (问号的位置,值)
            System.out.println(admin.toString());
            sta.setString(1, admin.getAdmin_name());
            sta.setString(2, admin.getAdmin_password());
            sta.setString(3, admin.getAdmin_email());
            sta.setString(4, admin.getAdmin_phone());
            sta.setString(5, admin.getAdmin_sign());
            sta.setInt(6, admin.getId());
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
    //查询(通过id查询)
    public AdminInfo queryByid(AdminInfo admin) {
        AdminInfo adminInfo=null;
        try {
            conn = JDBCUtils.getConnection();//得到连接对象
            String sql = "select * from Admininfo where id=?";
            sta = conn.prepareStatement(sql);//得到发送sql对象
            sta.setInt(1, admin.getId());
            ResultSet rs = sta.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String admin_name = rs.getString("admin_name");
                String admin_password = rs.getString("admin_password");
                String admin_email = rs.getString("admin_email");
                String admin_phone = rs.getString("admin_phone");
                //Timestamp subtime = rs.getTimestamp("subtime");//注册时间不予查询修改
                String admin_sign = rs.getString("admin_sign");
                 adminInfo = new AdminInfo( id,admin_name,admin_password,admin_email,admin_phone,admin_sign);

            } return adminInfo;
//            return admin;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn, sta);//关闭资源
        }
        return admin;
    }

}
