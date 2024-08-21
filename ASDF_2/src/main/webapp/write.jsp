<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
a {
	color: inherit;
	text-decoration: none;
}

</style>
</head>
<body>
	<header>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div class="container">
		<h1><strong>
			<a class="text-white" href="${pageContext.request.contextPath}" style="text-size: 50px;">ASDF</a></strong></h1>
	
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<ul class="nav justify-content-end util">
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/list" style="color: #999;">
						게시판
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#" style="color: #999;">
						회원관리
					</a>
				</li>
				<c:choose>
				<c:when test="${userId}">
					<li class="nav-item" style="color: #999; font-size: 12px;">반갑습니다 ${userName}님
					<li><a href="logout_process.jsp">로그아웃</a></li>
            	</c:when>
	            <c:otherwise>
		            <li class="nav-item"><a class="nav-link" href="login" style="color: #999;">로그인</a></li>
		            <li class="nav-item"><a class="nav-link" href="register" style="color: #999;">회원가입</a></li>
	            </c:otherwise>
            </c:choose>
			</ul>
		</div>
	</nav>
</header>
	<div class="container pt-5">
		<form method="post" action="${action}">
			<div class="mb-3">
				<label for="title" class="form-label">제목</label> 
				<input type="text" class="form-control" id="title" name="title" value="${msg.title}">
			</div>
			<div class="mb-3">
				<label for="writer" class="form-label">작성자</label>
				<input type="text" class="form-control" id="writer" name="writer" value="${msg.writer}">
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">내용</label>
				<textarea class="form-control" id="content" rows="3" name="content">${msg.content}</textarea>
			</div>
			
			<br> 
			<input type="submit" value="저장" class="btn btn-outline-primary"> 
			<input type="button" value="취소" onclick="history.back()" class="btn btn-outline-danger">
		</form>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>