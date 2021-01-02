package com.qst.dao;

import com.qst.bean.Movie;
import com.qst.bean.Sale;
import com.qst.utils.DBUtils;

import java.util.List;

public class SaleDAO {
    public List<Sale> getsale() {
        String sql = "select m.`name`,\n" +
                "count(*) num\n" +
                "from dd AS o\n" +
                "join schedule as s on s.time_id=o.time_id\n" +
                "join movie as m on m.id=s.f_id\n" +
                "GROUP BY name";
        List<Sale> saleList = DBUtils.getList(Sale.class,sql);
        return saleList;
    }
}
