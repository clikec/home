package com.qst.bean;

import java.util.Date;

public class Dd {

    private int o_id;//订单编号
    private int c_id;//客户编号
    private int time_id;//排期编号
    private int s_id;//座位编号
    private int way_of_pay;//支付方式
    private Date date;//日期

    public Dd() {
    }

	public Dd(int c_id, int time_id, int s_id, int way_of_pay, Date date) {
		this.c_id = c_id;
		this.time_id = time_id;
		this.s_id = s_id;
		this.way_of_pay = way_of_pay;
		this.date = date;
	}

	public Dd(int o_id, int c_id, int time_id, int s_id, int way_of_pay, Date date) {
        this.o_id = o_id;
        this.c_id = c_id;
        this.time_id = time_id;
        this.s_id = s_id;
        this.way_of_pay = way_of_pay;
        this.date = date;
    }

    public int getO_id() {
        return o_id;
    }

    public void setO_id(int o_id) {
        this.o_id = o_id;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Order{" +
                "o_id=" + o_id +
                ", c_id=" + c_id +
                ", time_id=" + time_id +
                ", s_id=" + s_id +
                ", way_of_pay='" + way_of_pay + '\'' +
                ", date=" + date +
                '}';
    }
}
