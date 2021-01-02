package com.qst.dao;

import com.qst.bean.User;
import com.qst.utils.DBUtils;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

	/*
	 * 以下是对用户表的一些操作
	 *  1.查询所有用户
	 *  2.查询某个用户名 
	 *  //3.删除某用户
	 *  4.添加某用户
	 *  5.更新某用户信息
	 */
	
	/*验证邮箱是否已经被注册*/
	public Integer EmailCount(String Email) {
		String sql = "select count(*) from user a where a.email = ?";
		Integer count = DBUtils.getCount(sql,Email);
		return count;
	}
	//保存用户
	public boolean addUser(User user) {
		String sql = "insert into user(email,password,power)" +
				" values(?,?,?)";
		return DBUtils.save(sql,user.getEmail(),user.getPassword(),user.getPower());
	}

	//通过邮箱和密码查询用户
	public User getApplicantByEmailAndPassword(String email, String password) {
			String sql = "select id id,username username,email email,password password,sex sex,phone phone,power power" +
					" from user where email=? and password=?";
			return DBUtils.getSingleObj(User.class,sql,email,password);
	}

	//更新个人资料
	public boolean updateUserInfo(User user) {
		String sql = "update user set \n" +
				"username = ?,\n" +
				"phone = ?,\n" +
				"sex = ?,\n" +
				"password = ? \n" +
				" where id =? ";
		boolean flag = DBUtils.update(sql, user.getUsername(), user.getPhone(), user.getSex()
				, user.getPassword(), user.getId());
		return flag;
	}
}
