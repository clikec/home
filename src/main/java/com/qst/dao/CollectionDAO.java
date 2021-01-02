package com.qst.dao;

import com.qst.bean.Collection;
import com.qst.bean.User;
import com.qst.utils.DBUtils;

import java.util.List;

public class CollectionDAO {


    public Integer getCollectCount(String sql,Object... parm) {
        //查询一共有多少行
        Integer count = DBUtils.getCount(sql,parm);
        return count;
    }

    public List<Collection> getCollectList(String sql, Object... parm) {
        List<Collection> list = DBUtils.getList(Collection.class,sql,parm);
        return list;
    }

    public Collection findbyidandcid(String id,String c_id) {
            String sql = "select * from collection where m_id=? and c_id =?";
            return DBUtils.getSingleObj(Collection.class,sql,id,c_id);
    }

    public boolean addCollection(Integer c_id,Integer m_id) {
        String sql = "insert into collection(c_id,m_id)" +
                " values(?,?)";
        return DBUtils.save(sql,c_id,m_id);
    }

    public boolean deleteyId(int cid,int mid) {
        String sql = "DELETE \n" +
                "FROM `collection` \n" +
                "WHERE c_id = ? and m_id = ?";
        return DBUtils.update(sql, cid,mid);
    }
}
