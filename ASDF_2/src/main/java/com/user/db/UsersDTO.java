package com.user.db;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UsersDTO {
	private int user_id;
	private String login_id;
	private String pw;
	private String name;
	private String tel;
	private String regtime;
}
