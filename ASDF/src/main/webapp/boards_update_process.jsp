<%@page import="boards.BoardsDTO"%>
<%@page import="boards.BoardsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String writer = request.getParameter("writer");
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardsDAO dao = new BoardsDAO();
BoardsDTO dto = new BoardsDTO(Integer.parseInt(id), writer, title, content, "0", 0);

dao.updateBoards(dto);

response.sendRedirect("boards.jsp");
%>