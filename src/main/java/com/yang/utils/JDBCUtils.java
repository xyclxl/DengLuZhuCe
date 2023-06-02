package com.yang.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * JDBC工具类
 */
public class JDBCUtils {

    /**
     * 得到连接
     */
    public static Connection getConnection(){
        try {
            //1.驱动数据库（1.填写驱动类名，导入mysql的驱动）
//            Class.forName("com.mysql.jdbc.Driver"); //如果控制台弹出警告，表示当前版本的驱动过时，我是5.5.6
            Class.forName("com.mysql.cj.jdbc.Driver");//mysql 8.0以上版本  要用到这个
            //Class.forName("com.mysql.jdbc.Driver");
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("数据库驱动失败");
        }
        //2.得到Connection连接对象
        try {
            String url="jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=UTF-8";
            //?useUnicode=true&characterEncoding=UTF-8  //此处添加保证写入数据可是不会出现中文乱码
            Connection conn = DriverManager.getConnection(url,"root","123456");
            //我得数据库  没有密码  注意修改
            return conn;
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("数据库连接失败");
        }
        return null;
    }

    //关闭资源
    public static void close(Connection conn, Statement sta, ResultSet set){
        try {
            if(set!=null){
                set.close();
            }
            if(sta!=null){
                sta.close();
            }
            if(conn!=null){
                conn.close();
            }
        }catch (Exception e){

        }
    }

    public static void close(Connection conn, Statement sta){
        try {
            if(sta!=null){
                sta.close();
            }
            if(conn!=null){
                conn.close();
            }
        }catch (Exception e){

        }
    }



    public static void main(String[] args) {
        JDBCUtils jdbc = new JDBCUtils();
        jdbc.getConnection();
    }
    //测试代码  查看  数据库连接是否成功  若什么也不显示  表示没报错  连接数据库成功
}
