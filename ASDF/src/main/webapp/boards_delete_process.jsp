<%@page import="boards.BoardsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");

BoardsDAO dao = new BoardsDAO();
dao.deleteBoards(Integer.parseInt(id));

response.sendRedirect("boards.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

</body>
</html>