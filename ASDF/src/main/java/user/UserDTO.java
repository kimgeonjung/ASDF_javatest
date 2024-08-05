package user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class UserDTO {
	private int id;
	private String pw;
	private String name;
	private String tel;
	private String createtime;
	private String regtime;
}
