package com.qst.servlet;

import com.qst.bean.Movie;
import com.qst.dao.DdDAO;
import com.qst.dao.MovieDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "OrdServlet",urlPatterns = "/OrdServlet")
public class OrdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //获取id
        String id = request.getParameter("o_id");
        DdDAO ddDao = new DdDAO();
        int sid = Integer.parseInt(id);
        boolean f =ddDao.deleteyId(sid);
        if(f){
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }
}
