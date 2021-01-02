package com.qst.bean;

public class Seat {

    private int s_id;//座位编号
    private int time_id;//排片编号
    private int row;//第i排
    private int col;//第i列
    private String isActive;//是否已定

    public Seat() {
    }

    public Seat(int s_id, int time_id, int row, int col, String isActive) {
        this.s_id = s_id;
        this.time_id = time_id;
        this.row = row;
        this.col = col;
        this.isActive = isActive;
    }

    public int getS_id() {
        return s_id;
    }

    public void setS_id(int s_id) {
        this.s_id = s_id;
    }

    public int getTime_id() {
        return time_id;
    }

    public void setTime_id(int time_id) {
        this.time_id = time_id;
    }

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public int getCol() {
        return col;
    }

    public void setCol(int col) {
        this.col = col;
    }

    public String getActive() {
        return isActive;
    }

    public void setActive(String active) {
        isActive = active;
    }

    @Override
    public String toString() {
        return "Seat{" +
                "s_id=" + s_id +
                ", time_id=" + time_id +
                ", row=" + row +
                ", col=" + col +
                ", isActive=" + isActive +
                '}';
    }
}
