package com.qst.dao;

import com.qst.bean.Movie;
import com.qst.bean.User;
import com.qst.utils.DBUtils;

import java.util.List;

public class MovieDAO {
    public Integer getMovieCount(String sql, Object... parm) {
        //查询一共有多少行
        Integer count = DBUtils.getCount(sql, parm);
        return count;
    }

    //分页查询
    public List<Movie> getMovieListByPage(String sql,Object... parm) {
        List<Movie> movieList = DBUtils.getList(Movie.class,sql,parm);
        return movieList;
    }

    //通过id查询电影
    public Movie getMovieById(String id) {
        String sql = "select id id,name name,director director,duration duration,type type,description description,price price" +
                ",poster poster,startdate startdate from movie where id=?";
        return DBUtils.getSingleObj(Movie.class,sql,id);
    }

    public Movie getMovieByName(String name) {
        String sql = "select price price" +
                " from movie where name=?";
        return DBUtils.getSingleObj(Movie.class,sql,name);
    }
}
