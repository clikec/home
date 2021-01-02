package com.qst.servlet;

import com.qst.bean.Movie;
import com.qst.bean.Sale;
import com.qst.bean.Schedule;
import com.qst.dao.MovieDAO;
import com.qst.dao.SaleDAO;
import com.qst.dao.ScheduleDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SaleServlet",urlPatterns = "/SaleServlet")
public class SaleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        SaleDAO saleDao = new SaleDAO();

        MovieDAO movieDao = new MovieDAO();
        List<Sale> saleList = saleDao.getsale();
        for(Sale s:saleList){
            s.setPrice( movieDao.getMovieByName(s.getName()).getPrice());
        }
        request.setAttribute("SaleList", saleList);
        request.getRequestDispatcher("show.jsp").forward(request, response);
    }
}
