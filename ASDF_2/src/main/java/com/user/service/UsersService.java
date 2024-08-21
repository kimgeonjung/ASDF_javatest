package com.user.service;

import com.user.db.UsersDAO;
import com.user.db.UsersDTO;

public class UsersService {
	public UsersDTO login(String id, String pw) {
		UsersDTO dto = new UsersDAO().loginUser(id, pw);
		System.out.println(dto);
		return dto;
	}
}
