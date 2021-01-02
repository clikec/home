package com.qst.dao;

import com.qst.bean.Movie;
import com.qst.bean.Schedule;
import com.qst.bean.User;
import com.qst.utils.DBUtils;

import java.util.List;

public class ScheduleDAO {
    public List<Schedule> getSchedulebyMovieId(int id) {
        String sql = "select time_id time_id,f_id f_id,room_id room_id,date date,start_h start_h" +
                ",start_m start_m,end_h end_h,end_m end_m from schedule where f_id=?";
        return DBUtils.getList(Schedule.class, sql, id);
    }

    public List<Schedule> getscheduleList(String sql) {
        List<Schedule> scheduleList = DBUtils.getList(Schedule.class, sql);
        return scheduleList;
    }

    public Integer getscheduleCount() {
        String sql = "select count(*) from schedule";
        //查询一共有多少行
        Integer count = DBUtils.getCount(sql);
        return count;
    }

    public Boolean deleteyId(int id) {
        String sql = "DELETE \n" +
                "FROM `schedule` \n" +
                "WHERE time_id = ? ";
        return DBUtils.update(sql, id);
    }

    //通过id查询排期
    public Schedule getScheById(int id) {
        String sql = "select time_id time_id,f_id f_id,room_id room_id,date date,start_h start_h" +
                ",start_m start_m,end_h end_h,end_m end_m from schedule where time_id=?";
        return DBUtils.getSingleObj(Schedule.class, sql, id);
    }

    public boolean addSchedule(Schedule s) {
        String sql = "insert into schedule(f_id,room_id,date,start_m,start_h,end_m,end_h)" +
                " values(?,?,?,?,?,?,?)";
        return DBUtils.save(sql, s.getF_id(), s.getRoom_id(), s.getDate(), s.getStart_m(), s.getStart_h(), s.getEnd_m(), s.getEnd_h());
    }

    public boolean updateScheduleBYId(Schedule s) {
        String sql = "update schedule set \n" +
                "f_id = ?,\n" +
                "room_id = ?,\n" +
                "date = ? ,\n" +
                "start_m = ?,\n" +
                "start_h = ?,\n" +
                "end_m = ?,\n" +
                "end_h = ? \n" +
                " where time_id =? ";
        boolean flag = DBUtils.update(sql, s.getF_id(), s.getRoom_id(), s.getDate(), s.getStart_m(), s.getStart_h(),
                s.getEnd_m(), s.getEnd_h(), s.getTime_id());
        return flag;
    }
}
