package com.qst.servlet;

import com.qst.bean.User;
import com.qst.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/MyMessageServlet", name="MyMessageServlet")
public class MyMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //获取前台提交的email和密码
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String sex = request.getParameter("sex");
        String password = request.getParameter("password");
        String newpassword = request.getParameter("newpassword");
        //根据邮箱和密码验证用户
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getApplicantByEmailAndPassword(email,password);

        System.out.println(user);
        PrintWriter writer = response.getWriter();

        if(user!=null){
            user.setUsername(username);
            user.setPhone(phone);
            user.setSex(sex);
            user.setPassword(newpassword);
            //更新用户信息
            boolean flag = userDAO.updateUserInfo(user);
            if(flag==true){
                writer.write("ok");
                //将登录用户对象保存到session
                request.getSession().setAttribute("USER",user);
            }else{
                writer.write("false");
            }
        }else{
            writer.write("error");
        }
        writer.flush();
        writer.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
