package com.qst.bean;

import java.util.Date;

public class Movie {
	
	private int id;//电影编号
	private String name;//电影名称
	private String star;//主演
	private String director;//导演
	private String duration;//片长
	private String type;//类型
	private String description;//描述
	private double price;//价格
	private String poster;//海报
	private Date startdate;//上映日期

	public Movie() {
	}

	public Movie(int id, String name, String star, String director, String duration, String type, String description, double price, String poster, Date startdate) {
		this.id = id;
		this.name = name;
		this.star = star;
		this.director = director;
		this.duration = duration;
		this.type = type;
		this.description = description;
		this.price = price;
		this.poster = poster;
		this.startdate = startdate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	@Override
	public String toString() {
		return "Movie{" +
				"id=" + id +
				", name='" + name + '\'' +
				", star='" + star + '\'' +
				", director='" + director + '\'' +
				", duration='" + duration + '\'' +
				", type='" + type + '\'' +
				", description='" + description + '\'' +
				", price=" + price +
				", poster='" + poster + '\'' +
				", startdate=" + startdate +
				'}';
	}
}
