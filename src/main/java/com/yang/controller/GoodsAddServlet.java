package com.yang.controller;

import com.yang.javabean.AdminInfo;
import com.yang.javabean.GoodsInfo;
import com.yang.service.AdminInfoService;
import com.yang.service.AdminInfoServiceImpl;
import com.yang.service.GoodsInfoService;
import com.yang.service.GoodsInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@WebServlet("/GoodsAdd")
@MultipartConfig
public class GoodsAddServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String goodnum = request.getParameter("goodnum");
        String goodname = request.getParameter("goodname");
        String goodtype = request.getParameter("goodtype");
        String goodplace = request.getParameter("goodplace");
        Double goodprice = Double.parseDouble(request.getParameter("goodprice"));
        String gooddescribe = request.getParameter("gooddescribe");

        PrintWriter out = response.getWriter();
        //给定路径在web下创建imags文件夹
        String path = request.getServletContext().getRealPath("jsp/static/images");
        System.out.println(path);
        //获取一个文件或图片
        Part part = request.getPart("picture");
        //获取文件名字
        String fname = part.getSubmittedFileName();
        //通过文件的名字获得文件类型取.后面
        if (fname!=null) {
            String suffix = fname.substring(fname.lastIndexOf("."));
            //UUID类可得到随机文件名字加上文件类型
            fname = UUID.randomUUID() + suffix;
            //加载到指定位置 将随机名字的图片加载到images指定为位置
            part.write(path + File.separator + fname);
        }
//        String subtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(time);
            System.out.println(goodnum + "---------" + goodname + "---------" + goodtype + "---------" + goodplace + "---------" + gooddescribe + "---------"+goodprice);
            if (goodnum != null && !goodnum.equals("") && goodname != null && !goodname.equals("")
                    && goodtype != null && !goodtype.equals("") && goodplace != null && !goodplace.equals("")
                    && goodprice != null && !goodprice.equals("")
                    ){
                //把用户名、密码、邮箱、手机添加到数据库中
                GoodsInfoService goodsService = new GoodsInfoServiceImpl();
                GoodsInfo goods = new GoodsInfo(goodnum, goodname, goodtype, goodplace, goodprice,gooddescribe,fname);
                int getRow = goodsService.add(goods);
                if (getRow > 0) {
                    //添加成功
                    response.sendRedirect("jsp/admin/goodAdmin_home.jsp");
                } else {
                    //添加失败
                    System.out.println("0");
                    response.sendRedirect("jsp/admin/goodAdmin_home_tianjia.jsp");
                }

            } else {
                //注册失败
                System.out.println("1");
                response.sendRedirect("jsp/admin/goodAdmin_home_tianjia.jsp");
            }
        }

    }

