package com.qst.bean;

public class Collection {
	
	private int coll_id;//收藏编号
	private int c_id;//用户编号
	private int m_id;//电影编号

	public Collection() {
	}

	public Collection(int coll_id, int c_id, int m_id) {
		this.coll_id = coll_id;
		this.c_id = c_id;
		this.m_id = m_id;
	}

	public int getColl_id() {
		return coll_id;
	}

	public void setColl_id(int coll_id) {
		this.coll_id = coll_id;
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "Collection{" +
				"coll_id=" + coll_id +
				", c_id=" + c_id +
				", m_id=" + m_id +
				'}';
	}
}
