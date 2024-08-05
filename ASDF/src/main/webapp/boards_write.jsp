<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="boards_write_process.jsp" method="post">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" maxlength="80"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" maxlength="20" value="<%=session.getAttribute("userName")%>" readonly></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="10"></textarea></td>
			</tr>
		</table>
		
		<p/>
		<input type="submit" value="저장">
		<input type="button" value="취소" onclick="history.back()">
	</form>
</body>
</html>