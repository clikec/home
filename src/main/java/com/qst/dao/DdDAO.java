package com.qst.dao;

import com.qst.bean.Dd;
import com.qst.bean.Movie;
import com.qst.bean.User;
import com.qst.bean.ddmessage;
import com.qst.utils.DBUtils;

import java.util.List;

public class DdDAO {

    public List<ddmessage> getddmListByPage(String sql, Object... id) {
        return DBUtils.getList(ddmessage.class, sql, id);
    }

    public Integer getddCount(String sql, Object... parm) {
        Integer count = DBUtils.getCount(sql, parm);
        return count;
    }

    public boolean addDd(Dd dd) {
        String sql = "insert into dd(c_id,time_id,s_id,way_of_pay,date)" +
                " values(?,?,?,?,?)";
        return DBUtils.save(sql,dd.getC_id(),dd.getTime_id(),dd.getS_id(),dd.getWay_of_pay(),dd.getDate());
    }

    public boolean deleteyId(int sid) {
        String sql = "DELETE \n" +
                "FROM `dd` \n" +
                "WHERE o_id = ? ";
        return DBUtils.update(sql, sid);
    }
}
