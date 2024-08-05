<%@page import="boards.BoardsDTO"%>
<%@page import="java.util.List"%>
<%@page import="boards.BoardsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

BoardsDAO dao = new BoardsDAO();
List<BoardsDTO> list = dao.getBoardsList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
        table     { width:680px; text-align:center; }
        th        { background-color:grey; color: white;}
        
        .id       { width: 80px; }
        .title    { width:230px; }
        .writer   { width:100px; }
        .regtime  { width:180px; }
                
        a:link    { text-decoration:none; color:blue; }
        a:visited { text-decoration:none; color:gray; }
</style>
</head>
<body>
<%
if(session.getAttribute("userId")==null){
%><script>
	alert('로그인 먼저 하세요');
	window.location.href='login.jsp';
	</script>
	<% 
}
%>
	<table>
		<tr>
			<th class="id">번호</th>
			<th class="title">제목</th>
			<th class="writer">작성자</th>
			<th class="regtime">작성시간</th>
			<th>조회수</th>
		</tr>
<%
for(BoardsDTO dto : list){
%>
		<tr>
			<td><%=dto.getId() %></td>
			<td><a href="boards_view.jsp?id=<%=dto.getId() %>"><%=dto.getTitle() %></a></td>
			<td><%=dto.getWriter() %></td>
			<td><%=dto.getRegtime() %></td>
			<td><%=dto.getHits() %></td>
		</tr>
<%
}		
%>
	</table>
	<p/>
	<input type="button" value="글쓰기" onclick="location.href='boards_write.jsp'">
	
</body>
</html>