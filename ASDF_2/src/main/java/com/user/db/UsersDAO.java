package com.user.db;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class UsersDAO {
	SqlSessionFactory sqlsession_f = SqlMapConfig.getSqlMapInstance();
	SqlSession session;

	public UsersDAO() {
		session = sqlsession_f.openSession(true);
	}
	
	public UsersDTO loginUser(String login_id, String pw) {
		Map<String, String> map = new HashMap<>();
		map.put("login_id", login_id);
		map.put("pw", pw);
		map.forEach((key, value) -> {	
			System.out.println(key + " : " + value);	
		});	
		return session.selectOne("UsersMapper.loginUser", map);
	}
	
	public String userCheck(String result) {
		return session.selectOne("UsersMapper.userCheck", result);
	}
	
	public void registerUser(UsersDTO dto) {
		session.insert("UsersMapper.registerUser", dto);
	}
	
	public void updateUser(UsersDTO dto) {
		session.update("UsersMapper.updateUser");
	}
	
	public void deleteUser(int user_id) {
		session.delete("UsersMapper.deleteUser");
	}
}
