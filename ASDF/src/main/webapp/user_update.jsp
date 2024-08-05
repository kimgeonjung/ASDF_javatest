<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
</head>
<body>
<form action="user_update_process.jsp" method="post">
	<table>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" value="<%=session.getAttribute("userName")%>" readonly></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pw" value=""></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="tel" name="tel" value="<%=session.getAttribute("userTel")%>"></td>
		</tr>
	</table>
	<button type="submit">수정</button>
</form>
	<button onclick="history.back()">취소</button>
</body>
</html>