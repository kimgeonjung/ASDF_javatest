<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
// pw tel
String pw = request.getParameter("pw");
String tel = request.getParameter("tel");

UserDAO dao = new UserDAO();
UserDTO dto = new UserDTO((int)session.getAttribute("userId"), pw, (String)session.getAttribute("userName"), tel, "0", "0");

dao.updateUser(dto);

response.sendRedirect("index.jsp");
%>