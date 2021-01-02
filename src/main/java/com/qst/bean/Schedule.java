package com.qst.bean;

import java.util.Date;

public class Schedule {

    private int time_id;//排片编号
    private int f_id;//电影编号
    private int room_id;//放映厅号
    private Date date;//日期
    private int start_h;//开始小时
    private int start_m;//开始分钟
    private int end_h;//结束小时
    private int end_m;//结束分钟

    public Schedule() {
    }

    public Schedule(int time_id, int f_id, int room_id, Date date, int start_h, int start_m, int end_h, int end_m) {
        this.time_id = time_id;
        this.f_id = f_id;
        this.room_id = room_id;
        this.date = date;
        this.start_h = start_h;
        this.start_m = start_m;
        this.end_h = end_h;
        this.end_m = end_m;
    }

    public Schedule(int f_id, int room_id, Date date, int start_h, int start_m, int end_h, int end_m) {
        this.f_id = f_id;
        this.room_id = room_id;
        this.date = date;
        this.start_h = start_h;
        this.start_m = start_m;
        this.end_h = end_h;
        this.end_m = end_m;
    }


    public int getTime_id() {
        return time_id;
    }

    public void setTime_id(int time_id) {
        this.time_id = time_id;
    }

    public int getF_id() {
        return f_id;
    }

    public void setF_id(int f_id) {
        this.f_id = f_id;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getStart_h() {
        return start_h;
    }

    public void setStart_h(int start_h) {
        this.start_h = start_h;
    }

    public int getStart_m() {
        return start_m;
    }

    public void setStart_m(int start_m) {
        this.start_m = start_m;
    }

    public int getEnd_h() {
        return end_h;
    }

    public void setEnd_h(int end_h) {
        this.end_h = end_h;
    }

    public int getEnd_m() {
        return end_m;
    }

    public void setEnd_m(int end_m) {
        this.end_m = end_m;
    }

    @Override
    public String toString() {
        return "Schedule{" +
                "time_id=" + time_id +
                ", f_id=" + f_id +
                ", room_id=" + room_id +
                ", date=" + date +
                ", start_h=" + start_h +
                ", start_m=" + start_m +
                ", end_h=" + end_h +
                ", end_m=" + end_m +
                '}';
    }
}
