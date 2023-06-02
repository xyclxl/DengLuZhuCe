package com.yang.mapper;

import com.yang.javabean.AdminInfo;
import com.yang.javabean.UserInfo;
import com.yang.utils.JDBCUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserInfoDaoImpl implements UserInfoDao{
    private Connection conn;
    private PreparedStatement sta;
    private ResultSet set;

    //添加
    public int insert(UserInfo user) {
        try {
            conn = JDBCUtils.getConnection();//得到连接对象
            String sql = "insert into userinfo(user_name,user_password,user_email,user_phone) values(?,?,?,?)";
            sta = conn.prepareStatement(sql);//得到发送sql对象
            //为sql语句中的?赋值 (问号的位置,值)
            sta.setString(1, user.getUser_name());
            sta.setString(2, user.getUser_password());
            sta.setString(3, user.getUser_email());
            sta.setString(4, user.getUser_phone());
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
     * 删除用户
     *
     * @param user 添加的用户对象
     * @return 受影响的行数
     */
    //删除
    public int deleteByid(UserInfo user) {
        try {
            conn = JDBCUtils.getConnection();//得到连接对象
            String sql = "delete from UserInfo where id=?";
            sta = conn.prepareStatement(sql);//得到发送sql对象
            //为sql语句中的?赋值 (问号的位置,值)
            sta.setInt(1, user.getId());
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
    public UserInfo selectByNameAndPsd(UserInfo user) {
        try {
            conn = JDBCUtils.getConnection();
            String sql = "select * from userinfo where user_name=? and user_password=? ";
            sta = conn.prepareStatement(sql);
            sta.setString(1, user.getUser_name());
            sta.setString(2, user.getUser_password());
            set = sta.executeQuery();
            UserInfo userInfo = null;
            while (set.next()) {
                int id = set.getInt("id");
                String user_name = set.getString("user_name");
                String user_password = set.getString("user_password");
                String user_email = set.getString("user_email");
                String user_phone = set.getString("user_phone");
                userInfo = new UserInfo(id, user_name, user_password,user_email,user_phone);
            }
            return userInfo;


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn, sta, set);//关闭资源
        }

        return null;
    }

    /**
     * 修改用户
     *
     * @param user 添加的用户对象
     * @return 受影响的行数
     */
    public int updateByid(UserInfo user) {
        try {
            conn = JDBCUtils.getConnection();//得到连接对象
            String sql = "update userinfo set user_name=?,user_password=?,user_email=?,user_phone=? where id =?";
            sta = conn.prepareStatement(sql);//得到发送sql对象
            //为sql语句中的?赋值 (问号的位置,值)
            System.out.println(user.toString());
            sta.setString(1, user.getUser_name());
            sta.setString(2, user.getUser_password());
            sta.setString(3, user.getUser_email());
            sta.setString(4, user.getUser_phone());
            sta.setInt(5, user.getId());
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
     * 查询用户
     *
     * @param user 修改的管理员对象
     * @return 受影响的行数
     */
    public UserInfo queryByid(UserInfo user) {
        UserInfo userinfo=null;
        try {
            conn = JDBCUtils.getConnection();//得到连接对象
            String sql = "select * from userinfo where id=?";
            sta = conn.prepareStatement(sql);//得到发送sql对象
            sta.setInt(1, user.getId());
            ResultSet rs = sta.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String user_name = rs.getString("user_name");
                String user_password = rs.getString("user_password");
                String user_email = rs.getString("user_email");
                String user_phone = rs.getString("user_phone");
                userinfo = new UserInfo( id,user_name,user_password,user_email,user_phone);

            } return userinfo;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn, sta);//关闭资源
        }
        return user;
    }


    //查询所有
    public List<UserInfo> selectAll() {
        List<UserInfo> rs = new ArrayList<UserInfo>();
        Connection connection = JDBCUtils.getConnection();
        String sql= "select * from userInfo";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rsSet = preparedStatement.executeQuery();
            while (rsSet.next()) {
                int id = rsSet.getInt("id");
                String user_name = rsSet.getString("user_name");
                String user_password = rsSet.getString("user_password");
                String user_email = rsSet.getString("user_email");
                String user_phone = rsSet.getString("user_phone");
                rs.add(new UserInfo(id, user_name,user_password,user_email,user_phone));
            }
            return rs;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
