package com.qst.dao;

import com.qst.bean.User;
import com.qst.utils.DBUtils;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

	/*
	 * �����Ƕ��û����һЩ����
	 *  1.��ѯ�����û�
	 *  2.��ѯĳ���û��� 
	 *  //3.ɾ��ĳ�û�
	 *  4.���ĳ�û�
	 *  5.����ĳ�û���Ϣ
	 */
	
	/*��֤�����Ƿ��Ѿ���ע��*/
	public Integer EmailCount(String Email) {
		String sql = "select count(*) from user a where a.email = ?";
		Integer count = DBUtils.getCount(sql,Email);
		return count;
	}
	//�����û�
	public boolean addUser(User user) {
		String sql = "insert into user(email,password,power)" +
				" values(?,?,?)";
		return DBUtils.save(sql,user.getEmail(),user.getPassword(),user.getPower());
	}

	//ͨ������������ѯ�û�
	public User getApplicantByEmailAndPassword(String email, String password) {
			String sql = "select id id,username username,email email,password password,sex sex,phone phone,power power" +
					" from user where email=? and password=?";
			return DBUtils.getSingleObj(User.class,sql,email,password);
	}

	//���¸�������
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
