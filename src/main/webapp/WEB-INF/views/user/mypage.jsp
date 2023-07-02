<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../include/header.jsp" %>
<!-- style.css -->
<link href="${pageContext.request.contextPath}/resources/css/myInfo.css" rel="stylesheet">

<title>BEACHPEDIA</title>


<section>
    <div class="tab-container">
        <!-- 탭 메뉴 -->
		<ul class="nav nav-pills nav-fill" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="userinfo-tab" data-bs-toggle="tab"
					data-bs-target="#myInfo" type="button" role="tab" aria-controls="myInfo"
					aria-selected="true">내 정보</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="myreview-tab" data-bs-toggle="tab"
					data-bs-target="#myBlogs" type="button" role="tab"
					aria-controls="myBlogs" aria-selected="false">내 블로그</button>
			</li>
		</ul>
		
		<!-- 내용 -->
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="myInfo" role="tabpanel"
				aria-labelledby="userinfo-tab">

                        <form action="${pageContext.request.contextPath}/user/update" method="post" name="updateForm">
                            <div class="row-bar">
                            	<span>아이디</span>
                            	<input class="form-control input-sm" name="userId" value="${loginId}" readonly disabled="disabled">
                            </div>
                            <div class="row-bar">
                            	<span>이름</span>
                            	<input class="form-control input-sm" name="userName" value="${userInfo.userName}">
                            </div>	
                            <div class="row-bar">
                            	<span>비밀번호</span>
                            	<input class="form-control input-sm" name="userPw">
                            </div>
                            <div class="row-bar">
                            	<span>비밀번호 확인</span>
                            	<input class="form-control input-sm" name="userPwChk">
                            </div>
                            <div class="email-box">
	                            <div class="row-bar email-bar">
	                            	<span>이메일</span>
	                            	<input class="form-control input-sm" id="userEmail1" name="userEmail1" value="${userInfo.userEmail1}">
	                                <p class="email-mid">@</p>
									<input type="text" class="form-control input-sm" name="userEmail2" id="userEmail2" autocomplete="off">
								</div>
								<div class="mail-select">
									<select class="form-emailSelection form-select " name="emailSelection" id="emailSelection">
										<option value="${userInfo.userEmail2}">직접 입력</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hanmail.com">hanmail.com</option>
									</select>
	                                <button type="button" id="mail-check-btn" class="btn btn-primary">이메일 인증</button>
	                            </div>
	                        </div>
                            <div class="row-bar">
                            	<span>인증번호 입력</span>
                            	<input type="text" class="form-control mail-check-input input-sm pin-num" placeholder="인증번호 6자리" maxlength="5" disabled="disabled">
                                <button type="button" id="mail-auth-btn" class="btn btn-primary">인증 확인</button>
                            </div>
                            
                        </form>

                        <div class="footBtns">
                            <button class="btn modifyBtn">수정</button>
                            <button class="btn listBtn">목록</button>
                        </div>
			</div>
			<div class="tab-pane fade" id="myBlogs" role="tabpanel"
				aria-labelledby="myreview-tab">
				내 블로그 목록 탭
			</div>
		</div>
    </div>
</section>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>


<%@ include file="../include/footer.jsp" %>

<script>
const $title = document.getElementById('pageTitle');
$title.textContent = '마이페이지';


</script>

