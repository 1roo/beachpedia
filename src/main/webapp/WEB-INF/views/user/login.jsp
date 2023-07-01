<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>

<title>BEACHPEDIA</title>

<main class="login-bar form-signin m-auto">
	<form action="${pageContext.request.contextPath}/user/login}" method="post" name="loginForm">
    <div class="form-floating">
      <input type="text" class="form-control" id="userId" placeholder="아이디">
      <label for="floatingInput">아이디</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="userPw" placeholder="Password">
      <label for="floatingPassword">비밀번호</label>
    </div>

    <button class="w-100 btn btn-lg btn-primary loginBtn" name="loginForm" id="loginBtn" type="submit">로그인</button>
  </form>
</main>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

<%@ include file="../include/footer.jsp" %>

<script>

	document.getElementById('loginBtn').onclick = () => {
    const $userId = document.getElementById('userId');
    const $userPw = document.getElementById('userPw');

    if($userId.value === '') {
      alert('아이디를 입력하세요.');
      $userId.focus();
      return;
    }

    if($userPw.value === '') {
      alert('비밀번호를 입력하세요.');
      $userPw.focus();
      return;
    }

    document.loginForm.submit();

  }


  //엔터키로 진행 되게 설정
  function EnterLogin() {
    var keyCode = window.event.keyCode;
    if(keyCode == 13) {
      document.getElementById('loginBtn').click();
    }
  }


</script>