package com.qst.servlet;

import com.qst.dao.CollectionDAO;
import com.qst.dao.DdDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CollServlet",urlPatterns = "/CollServlet")
public class CollServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //获取id
        String c_id = request.getParameter("cid");
        String m_id = request.getParameter("mid");
        CollectionDAO collDao = new CollectionDAO();
        boolean f = collDao.deleteyId(Integer.valueOf(c_id),Integer.valueOf(m_id));
        if (f) {
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }
}
