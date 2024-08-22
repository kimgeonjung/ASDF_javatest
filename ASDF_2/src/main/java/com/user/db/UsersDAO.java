package com.user.db;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class UsersDAO {
	SqlSessionFactory sqlsession_f = SqlMapConfig.getSqlMapInstance();
	SqlSession session;

	public UsersDAO() {
		session = sqlsession_f.openSession(true);
	}
	
	public UsersDTO findUser(UsersDTO dto) {
		UserMapper mm = session.getMapper(UserMapper.class);
		return mm.findUser(dto);
	}
	
	public int isUser(UsersDTO dto) {
		UserMapper mm = session.getMapper(UserMapper.class);
		return mm.isUser(dto);
	}
	
}
