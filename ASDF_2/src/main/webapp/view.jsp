<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>세부 내용</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
a {
	color: inherit;
	text-decoration: none;
}

</style>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
  </head>
  <body>
    <header>
        <div class="inner">
            <h1><a href="${pageContext.request.contextPath}">ASDF</a></h1>

            <ul id="gnb">
                <li><a href="#">DEPARTMENT</a></li>
                <li><a href="#">GALLERY</a></li>
                <li><a href="#">YOUTUBE</a></li>
                <li><a href="${pageContext.request.contextPath}/list">BOARD</a></li>
                <li><a href="#">LOCATION</a></li>
            </ul>

            <ul class="util">
                <c:if test="${userLoggedIn}">
                	<li><a href="#">${userInfo.name}님</a></li>
                	<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                </c:if>
                <c:if test="${!userLoggedIn}">
                	<li><a href="${pageContext.request.contextPath}/loginForm">Login</a></li>
                </c:if>
                
                <li><a href="#">Sitemap</a></li>
            </ul>
        </div>
    </header>

    <div  class="container p-5">
    <table class="table table-bordered table-hover">
    <tr>
        <th>제목</th>
        <td>${msg.title}</td>
    </tr>
    <tr>
        <th>작성자</th>
        <td>${msg.writer}</td>
    </tr>
    <tr>
        <th>작성일시</th>
        <td>${msg.regtime}</td>
    </tr>
    <tr>
        <th>조회수</th>
        <td>${msg.hits}</td>
    </tr>
    <tr>
        <th>내용</th>
        <td>${msg.content}</td>
    </tr>
</table>
<button type="button" class="btn btn-outline-primary" onclick="location.href='list'">목록보기</button>
<c:if test="${userLoggedIn}">
<c:if test="${userInfo.name == msg.writer}">
<button type="button" class="btn btn-outline-secondary" onclick="location.href='write?num=${param.num}'">수정</button>
<button type="button" class="btn btn-outline-success" onclick="location.href='delete?num=${param.num}'">삭제</button>
</c:if>
</c:if>
<c:if test="${!userLoggedIn}">

</c:if>

</div>

    <footer class="pt-5">
        <div class="inner">
            <div class="upper">
                <h1>ASDF</h1>
                <ul>
                    <li><a href="#">Policy</a></li>
                    <li><a href="#">Terms</a></li>
                    <li><a href="#">Family Site</a></li>
                    <li><a href="#">Sitemap</a></li>
                </ul>
            </div>

            <div class="lower">
                <address>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas, facere.<br>
                    TEL : 031-111-1234 C.P : 010-1234-5678
                </address>
                <p>
                    2020 DOCDELAB &copy; copyright all right reserved.
                </p>
            </div>
        </div>
    </footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>