<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
	
	<!-- style.css -->
	<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
	
	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

	<title>BEACHPEDIA</title>		

</head>
<body>

<div class="container">
    <header class="header">
      <a href="/">
      	<img class="logo default" src="${pageContext.request.contextPath}/resources/img/longlogo.png" alt="BEACHPEDIA_LOGO">
      	<img class="logo show" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="BEACHPEDIA_LOGO">
      </a>

      <ul class="user-log">
        <c:if test="${loginId == null}">
			<li class="login"><a href="${pageContext.request.contextPath}/user/login">로그인</a></li>
			<li class="join"><a href="${pageContext.request.contextPath}/user/join">회원가입</a></li>
		</c:if>
		<c:if test="${loginId != null}">
			<li class="mypage"><a href="${pageContext.request.contextPath}/user/mypage">마이페이지</a></li>
			<li class="logout"><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
		</c:if>
      </ul>
    </header>
</div>
