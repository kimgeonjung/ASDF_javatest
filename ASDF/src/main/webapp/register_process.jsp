<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String pw = request.getParameter("pw");
String tel = request.getParameter("tel");

UserDAO dao = new UserDAO();
UserDTO dto = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
if(dao.confirmTel(tel)){
%>
<script>
alert('이미 등록된 계정입니다.');
history.back();
</script>
<%
} else {
	dto = new UserDTO(0, pw, name, tel, "0", "0");
	dao.registerUser(dto);
%>
<script>
alert('가입이 완료되었습니다.');
window.location.href='login.jsp';
</script>
<%
}
response.sendRedirect("login.jsp");
%>

</body>
</html>