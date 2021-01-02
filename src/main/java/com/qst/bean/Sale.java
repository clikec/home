package com.qst.bean;

public class Sale
{
    private String name;//电影名字
    private int num;// 数量
    private double price;//金额

    public Sale() {
    }

    public Sale(String name, int num) {
        this.name = name;
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Sale{" +
                "name='" + name + '\'' +
                ", num=" + num +
                ", price=" + price +
                '}';
    }
}
