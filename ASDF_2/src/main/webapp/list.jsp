<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="./css/style.css" rel="stylesheet">
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
		<h1 class="p-3">게시판</h1>
		<table class="table table-bordered table-hover">
			<tr>
				<th class="num">번호</th>
				<th class="title">제목</th>
				<th class="writer">작성자</th>
				<th class="regtime">작성일시</th>
				<th>조회수</th>
			</tr>

			<c:forEach var="msg" items="${msgList}">
				<tr>
					<td>${msg.num}</td>
					<td style="text-align: left;"><a
						href="view?num=${msg.num}&page=${param.page}"> ${msg.title} </a></td>
					<td>${msg.writer}</td>
					<td>${msg.regtime}</td>
					<td>${msg.hits}</td>
				</tr>
			</c:forEach>
		</table>

		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:forEach var="pgn" items="${pgnList}">
					<li class="page-item"><a class="page-link"
						href="list?page=${pgn.pageNo}"> <c:choose>
								<c:when test="${pgn.curPage}">
									<u>${pgn.display}</u>
								</c:when>
								<c:otherwise>
								${pgn.display}
							</c:otherwise>
							</c:choose>
					</a></li>
				</c:forEach>
			</ul>
		</nav>

		<button type="button" class="btn btn-outline-primary"
			onclick="location.href='write'">글쓰기</button>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>