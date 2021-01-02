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

@WebServlet(name = "RegisterServlet",urlPatterns = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println(email);
        System.out.println(password);

        PrintWriter writer = response.getWriter();
        //判断是否有相同的email
        int count = 0;
        UserDAO userDAO= new UserDAO();
        count = userDAO.EmailCount(email);

        if (count>0||email==null||password==null){
            writer.write("1");

        }else{
            User user = new User(email,password,2);
            if(userDAO.addUser(user)){
                writer.write("ok");
            }else{
                writer.write("Error");
            }

        }
        writer.flush();
        writer.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}
