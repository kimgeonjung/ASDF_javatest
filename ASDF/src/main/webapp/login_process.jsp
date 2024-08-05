<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String pw = request.getParameter("pw");

UserDAO dao = new UserDAO();
UserDTO dto = dao.loginUser(name, pw);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
if(dto != null){
	if(dto.getName().equals(name) && dto.getPw().equals(pw)){
		session.setAttribute("userId", dto.getId());
		session.setAttribute("userName", name);
		session.setAttribute("userTel", dto.getTel());
		response.sendRedirect("index.jsp");
	}
} else{
%>
<script>
	alert('이름 또는 비밀번호가 틀립니다.');
	history.back();
</script>

<% 
}
%>	
</body>
</html>