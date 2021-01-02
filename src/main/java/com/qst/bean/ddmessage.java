package com.qst.bean;

import java.util.Date;

public class ddmessage {
    private String name;//电影名字
    private int c_id;//客户编号
    private Date buydate;//购票日期
    private int o_id;//订单编号
    private int time_id;//排期编号
    private int s_id;//座位编号
    private int way_of_pay;//支付方式
    private int end_h;//结束时间小时
    private int end_m;//结束时间分钟
    private int start_h;//开始时间小时
    private int start_m;//开始时间分钟
    private Date watchdate;//观看时间
    private int room_id;//放映厅号

    public ddmessage() {
    }

    public ddmessage(String name, int c_id, Date buydate, int o_id, int time_id, int s_id, int way_of_pay, int end_h, int end_m, int start_h, int start_m, Date watchdate, int room_id) {
        this.name = name;
        this.c_id = c_id;
        this.buydate = buydate;
        this.o_id = o_id;
        this.time_id = time_id;
        this.s_id = s_id;
        this.way_of_pay = way_of_pay;
        this.end_h = end_h;
        this.end_m = end_m;
        this.start_h = start_h;
        this.start_m = start_m;
        this.watchdate = watchdate;
        this.room_id = room_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public Date getBuydate() {
        return buydate;
    }

    public void setBuydate(Date buydate) {
        this.buydate = buydate;
    }

    public int getO_id() {
        return o_id;
    }

    public void setO_id(int o_id) {
        this.o_id = o_id;
    }

    public int getTime_id() {
        return time_id;
    }

    public void setTime_id(int time_id) {
        this.time_id = time_id;
    }

    public int getS_id() {
        return s_id;
    }

    public void setS_id(int s_id) {
        this.s_id = s_id;
    }

    public int getWay_of_pay() {
        return way_of_pay;
    }

    public void setWay_of_pay(int way_of_pay) {
        this.way_of_pay = way_of_pay;
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

    public Date getWatchdate() {
        return watchdate;
    }

    public void setWatchdate(Date watchdate) {
        this.watchdate = watchdate;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    @Override
    public String toString() {
        return "ddmessage{" +
                "name='" + name + '\'' +
                ", c_id=" + c_id +
                ", buydate=" + buydate +
                ", o_id=" + o_id +
                ", time_id=" + time_id +
                ", s_id=" + s_id +
                ", way_of_pay=" + way_of_pay +
                ", end_h=" + end_h +
                ", end_m=" + end_m +
                ", start_h=" + start_h +
                ", start_m=" + start_m +
                ", watchdate=" + watchdate +
                ", room_id=" + room_id +
                '}';
    }
}
