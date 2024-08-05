<%@page import="boards.BoardsDTO"%>
<%@page import="boards.BoardsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
BoardsDAO dao = new BoardsDAO();
dao.increaseHits(Integer.parseInt(id));
BoardsDTO dto = dao.getOne(Integer.parseInt(id));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<th>제목</th>
		<td><%=dto.getTitle() %></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=dto.getWriter() %></td>
	</tr>
	<tr>
		<th>작성시간</th>
		<td><%=dto.getRegtime() %></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=dto.getHits() %></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><%=dto.getContent() %></td>
	</tr>
</table>
<p/>
<input type="button" value="목록" onclick="location.href='boards.jsp'">
<%
if(session.getAttribute("userName").equals(dto.getWriter())){
%>
<input type="button" value="수정" onclick="location.href='boards_update.jsp?id=<%=dto.getId()%>'">
<input type="button" value="삭제" onclick="location.href='boards_delete_process.jsp?id=<%=dto.getId()%>'">
<%
}
%>
</body>
</html>