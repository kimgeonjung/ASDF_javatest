package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.JDBC;

public class UserDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// sql 쿼리
	private String USER_LOGIN = "select * from user where name = ? and pw = ?";
	private String USER_UPDATE = "update user set pw = ?, tel = ?, regtime = now() where id = ?";
	private String USER_CHECK = "select tel from user where tel = ?";
	private String USER_REGISTER = "insert into user values (0, ?, ?, ?, now(), now())";
	
	// 기능 | 1. 로그인  2. 회원수정  3. 회원가입
	
	// 1. 로그인
	public UserDTO loginUser(String name, String pw) {
		UserDTO dto = null;
		conn = JDBC.getConnection();
		try {
			pstmt = conn.prepareStatement(USER_LOGIN);
			pstmt.setString(1, name);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new UserDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.closeResources(conn, pstmt);
		}
		return dto;
	}
	
	// 2. 회원수정
	public void updateUser(UserDTO dto) {
		conn = JDBC.getConnection();
		try {
			pstmt = conn.prepareStatement(USER_UPDATE);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getTel());
			pstmt.setInt(3, dto.getId());
			pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBC.closeResources(conn, pstmt);
		}
	}
	
	// 3. 회원가입
	// 3.1 중복 가입 확인
	public boolean confirmTel(String tel) {
		boolean result = false;
		try {
			conn = JDBC.getConnection();
			pstmt = conn.prepareStatement(USER_CHECK);
			pstmt.setString(1, tel);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBC.closeResources(conn, pstmt, rs);
		}
		return result;
	}
	
	// 3.2 회원가입 p n t
	public void registerUser(UserDTO dto) {
		conn = JDBC.getConnection();
		try {
			pstmt = conn.prepareStatement(USER_REGISTER);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getTel());
			pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBC.closeResources(conn, pstmt);
		}
	}
}
