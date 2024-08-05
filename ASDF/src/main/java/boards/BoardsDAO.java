package boards;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.JDBC;

public class BoardsDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// sql 쿼리
	private String BOARDS_LIST = "select * from boards";
	private String BOARDS_GET_ONE = "select * from boards where id = ?";
	private String BOARDS_INSERT = "insert into boards values (0,?,?,?,now(),0)";
	private String BOARDS_UPDATE = "update boards set title = ?, content = ?, regtime = now() where id = ?";
	private String BOARDS_DELETE = "delete from boards where id = ?";
	private String BOARDS_HITS = "update boards set hits = hits + 1 where id = ?";
	
	
	// 기능 | 1. 게시판 목록 조회  2. 게시글 조회  3. 게시글 작성  4. 게시글 수정  5. 게시글 삭제  6. 조회수 증가
	
	// 1. 게시판 목록 조회
	public List<BoardsDTO> getBoardsList(){
		List<BoardsDTO> list = new ArrayList<>();
		conn = JDBC.getConnection();
		
		try {
			pstmt = conn.prepareStatement(BOARDS_LIST);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardsDTO dto = new BoardsDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6));
				list.add(dto);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBC.closeResources(conn, pstmt, rs);
		}
		return list;
	}
	
	// 2. 게시글 조회
	public BoardsDTO getOne(int id) {
		BoardsDTO dto = null;
		conn = JDBC.getConnection();
		try {
			pstmt = conn.prepareStatement(BOARDS_GET_ONE);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new BoardsDTO(
						rs.getInt(1), 
						rs.getString(2), 
						rs.getString(3),
						rs.getString(4), 
						rs.getString(5), 
						rs.getInt(6));
			}
		}catch (SQLException e) {
			
		}finally {
			JDBC.closeResources(conn, pstmt, rs);
		}
		return dto;
	}
	
	// 3. 게시글 작성 w t c
	public void insertBoards(BoardsDTO dto) {
		conn = JDBC.getConnection();
		try {
			pstmt = conn.prepareStatement(BOARDS_INSERT);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBC.closeResources(conn, pstmt);
		}
	}
	
	// 4. 게시글 수정 t c i
	public void updateBoards(BoardsDTO dto) {
		conn = JDBC.getConnection();
		try {
			pstmt = conn.prepareStatement(BOARDS_UPDATE);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getId());
			pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBC.closeResources(conn, pstmt);
		}
	}
	
	// 5. 게시글 삭제
	public void deleteBoards(int id) {
		conn = JDBC.getConnection();
		try {
			pstmt = conn.prepareStatement(BOARDS_DELETE);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBC.closeResources(conn, pstmt);
		}
	}
	
	// 6. 조회수 증가
	public void increaseHits(int id) {
		conn = JDBC.getConnection();
		try {
			pstmt = conn.prepareStatement(BOARDS_HITS);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		}catch (SQLException e) {
			 e.printStackTrace();
		}finally {
			JDBC.closeResources(conn, pstmt);
		}
	}
	
	
}
