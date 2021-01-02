package com.qst.bean;


public class User {
	
	private int id;//用户编号
	private String username;//用户名
	private String email;//email
	private String password;//密码
	private String sex;//性别
	private String phone;//点好
	private int power;//权限信息

	public User() {
	}

	public User(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public User(String email, String password,int power) {
		this.email = email;
		this.password = password;
		this.power=2;
	}

	public User(int id, String username, String email, String password, String sex, String phone, int power) {
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.sex = sex;
		this.phone = phone;
		this.power = power;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPower() {
		return power;
	}

	public void setPower(int power) {
		this.power = power;
	}


	@Override
	public String toString() {
		return "User{" +
				"id=" + id +
				", username='" + username + '\'' +
				", email='" + email + '\'' +
				", password='" + password + '\'' +
				", sex='" + sex + '\'' +
				", phone='" + phone + '\'' +
				", power=" + power +
				'}';
	}

}
