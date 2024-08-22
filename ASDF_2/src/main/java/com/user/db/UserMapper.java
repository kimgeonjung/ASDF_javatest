package com.user.db;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {
	@Select("select count(*) from users where login_id = #{login_id} and pw = #{pw}")
	public int isUser(UsersDTO dto);
	
	@Select("select * from users where login_id = #{login_id} and pw = #{pw}")
	public UsersDTO findUser(UsersDTO dto);
}
