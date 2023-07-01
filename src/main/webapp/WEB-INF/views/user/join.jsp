<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<!-- style.css -->
	<link href="${pageContext.request.contextPath}/resources/css/join.css" rel="stylesheet">

<title>BEACHPEDIA</title>


<div class="join-container">
	<section id="section">
		<form action="${pageContext.request.contextPath}/user/join"	method="POST" name="joinForm">
			<!-- 아이디 -->
			<div class="row justify-content-between has-validation mb-4">
				<div class="box">
					<input id="userId" class="col form-control form-control-lg"
						name="userId" type="text" placeholder="아이디(영문 4~12자)"
						autocomplete="off">
					<button id="idCheckBtn" class="col-3 btn idCheckBtn" type="button"
						disabled>아이디 중복 체크</button>
				</div>
				<div id="idValidMsg" class="valid-feedback">아이디 중복 체크를 진행해주세요.</div>
				<div id="idInvalidMsg" class="invalid-feedback">부적합한 아이디입니다.</div>
			</div>

			<!-- 비밀번호 -->
			<div class="row justify-content-between has-validation mb-4">
				<div class="w-80">
					<input id="userPw" class="col form-control form-control-lg"
						name="userPw" type="password"
						placeholder="비밀번호(영문, 숫자 포함 8~16자)" autocomplete="off">
				</div>
				<div id="pwValidMsg" class="valid-feedback">사용 가능한 비밀번호입니다.</div>
				<div id="pwInvalidMsg" class="invalid-feedback">부적합한 비밀번호입니다.</div>
			</div>

			<!-- 비번 체크 -->
			<div class="row justify-content-between has-validation mb-4">
				<div class="w-80">
					<input id="pwCheck" class="col form-control form-control-lg"
						name="pwCheck" type="password" placeholder="비밀번호 재확인"
						autocomplete="off">
				</div>
				<div id="pwCValidMsg" class="valid-feedback">비밀번호가 일치합니다.</div>
				<div id="pwCInvalidMsg" class="invalid-feedback">비밀번호가 불일치합니다.</div>
			</div>

			<!-- 이름 -->
			<div class="row justify-content-between mb-4">
				<div class="w-80">
					<input class="form-control form-control-lg" name="userName"
						id="userName" type="text" placeholder="이름" autocomplete="off">
				</div>
			</div>

			<!-- 닉네임 -->
			<div class="row justify-content-between mb-4">
				<div class="w-100 d-flex">
					<input class="form-control form-control-lg" name="userNick"
						id="userNick" type="text" placeholder="닉네임" autocomplete="off">
				</div>
			</div>

			<!-- 이메일 -->
			<div class="row mb-4">
				<div class="email-border">
					<input type="text" class="form-control form-control-lg"
						name="userEmail1" id="userEmail1" placeholder="이메일" autocomplete="off">
					<p>@</p>
					<input type="text" class="form-control form-control-lg"
						name="userEmail2" id="userEmail2" autocomplete="off"> 
						<select class="form-emailSelection form-select " name="emailSelection" id="emailSelection">
						<option value="direct">직접 입력</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.com">hanmail.com</option>
					</select>
				</div>

			<!-- 이메일 인증 -->
			<div class="has-validation mb-4">
				<div id="emailVerification" class="row d-flex flex-nowrap">
					<input class="col form-control form-control-lg" type="text"
						placeholder="인증번호를 입력하세요." id="emailCheck" name="emailCheck"
						autocomplete="off" disabled>
					<button class="col-3 btn emailCheckBtn" type="button"
						id="emailCheckBtn" disabled>이메일 인증</button>
				</div>
				<div id="emailValidMsg" class="valid-feedback">인증번호가 일치합니다.</div>
				<div id="emailInvalidMsg" class="invalid-feedback">인증번호가 불일치합니다.</div>
			</div>
		</div>
		
			<!-- 버튼 -->
			<div class="btns">
				<button type="button" class="btn joinBtn" id="joinBtn">회원가입</button>
				<button type="button" class="btn exitBtn"
					onclick="location.href='${pageContext.request.contextPath}/'">취소</button>
			</div>
		</form>
		
	</section>
</div>



<script>
	const $title = document.getElementById('pageTitle');
	$title.textContent = '회원가입';
	
	let code = '';
	let idFlag, pwFlag;
	
	// 아이디 형식 검사
	document.getElementById("userId").onkeyup = function () {
		var regex = /^[A-Za-z0-9+]{4,12}$/;
		const $userId = document.getElementById('userId');
		document.getElementById('idInvalidMsg').textContent = '부적합한 아이디입니다.'';

		if (regex.test($userId.value)) {
			$userId.classList.remove('is-invalid');
			$userId.classList.add('is-valid');
			document.getElementById('idInvalidMsg').style.display = 'none';
			document.getElementById('idValidMsg').style.display = 'block';
			document.getElementById('idCheckBtn').disabled = false;
			idFlag = true;
		} else {
			$userId.classList.remove('is-valid');
			$userId.classList.add('is-invalid');
			document.getElementById('idValidMsg').style.display = 'none';
			document.getElementById('idInvalidMsg').style.display = 'block';
			document.getElementById('idCheckBtn').disabled = true;
		}
	}
	
	// 아이디 중복 체크
	document.getElementById('idCheckBtn').onclick = function () {
		// 요청에 관련된 정보 객체
		const userId = document.getElementById('userId').value;

		const reqObj = {
			method: 'post',
			headers: {
				'Content-Type': 'text/plain'
			},
			body: userId
		};

		
		// 비동기 요청 보내기
		fetch('${pageContext.request.contextPath}/user/idCheck', reqObj)
			.then(res => res.text())
			.then(data => {
				const $userId = document.getElementById('userId');
				console.log('data : ' + data);
				if (data === 'available') {
					$userId.style.color = '#198754';
					$userId.setAttribute('readonly', true);
					document.getElementById('idCheckBtn').disabled = true;
					document.getElementById('idValidMsg').textContent = '사용 가능한 아이디입니다. :)';
				} else {
					$userId.classList.remove('is-valid');
					$userId.classList.add('is-invalid');
					document.getElementById('idValidMsg').style.display = 'none';
					document.getElementById('idInvalidMsg').textContent = '중복되는 아이디입니다. :(';
					document.getElementById('idInvalidMsg').style.display = 'block';
					$userId.value = '';
					$userId.focus();
				}
			});
	}
	
	// 비밀번호
	document.getElementById("userPw").onkeyup = function () {
		var regex = /^[A-Za-z0-9+]{8,16}$/;
		const $userPw = document.getElementById('userPw');

		if (regex.test($userPw.value)) {
			$userPw.classList.remove('is-invalid');
			$userPw.classList.add('is-valid');
			document.getElementById('pwInvalidMsg').style.display = 'none';
			document.getElementById('pwValidMsg').style.display = 'block';
		} else {
			$userPw.classList.remove('is-valid');
			$userPw.classList.add('is-invalid');
			document.getElementById('pwValidMsg').style.display = 'none';
			document.getElementById('pwInvalidMsg').style.display = 'block';
		}
	}
	
	// 비밀번호 확인
	document.getElementById('pwCheck').onkeyup = () => {
		const $pwCheck = document.getElementById('pwCheck');

		if (document.getElementById('userPw').value === $pwCheck.value) {
			$pwCheck.classList.remove('is-invalid');
			$pwCheck.classList.add('is-valid');
			document.getElementById('pwCInvalidMsg').style.display = 'none';
			document.getElementById('pwCValidMsg').style.display = 'block';
			pwFlag = true;
		} else {
			$pwCheck.classList.add('is-invalid');
			$pwCheck.classList.remove('is-valid');
			document.getElementById('pwCValidMsg').style.display = 'none';
			document.getElementById('pwCInvalidMsg').style.display = 'block';
		}
	}
	
	// 이메일
	const email1 = document.getElementById('userEmail1');
	const email2 = document.getElementById('userEmail2');
	const emailSelection = document.getElementById('emailSelection');
	const emailCheckBtn = document.getElementById('emailCheckBtn');

	// 이메일 선택 옵션 변경 시 userEmail2 값 설정
	document.getElementById('emailSelection').addEventListener('change', function () {
		const $emailSelection = this.value;
		if ($emailSelection === 'direct') {
			email2.value = '';
			email2.removeAttribute('readonly', 'false');
			email2.focus();
		} else {
			email2.value = $emailSelection;
			email2.setAttribute('readonly', 'true');
		}
	});

	// 이메일 인증 버튼 비활성화
	email1.addEventListener('input', btnUpdate);
	email2.addEventListener('input', btnUpdate);
	emailSelection.addEventListener('change', btnUpdate);
	function btnUpdate() {
		if (email1.value === '' || (emailSelection.value === 'direct' && email2.value === '')) {
			emailCheckBtn.disabled = true;
		} else {
			emailCheckBtn.disabled = false;
		}
	}

	// 인증번호 전송
	document.getElementById('emailCheckBtn').addEventListener('click', function () {
		const email = document.getElementById('userEmail1').value + '@' + document.getElementById('userEmail2')
			.value;

		fetch('${pageContext.request.contextPath}/user/mailCheck?email=' + email)
			.then(res => res.text())
			.then(data => {
				console.log('인증번호: ' + data)
				code = data;
				alert('인증번호가 전송되었습니다. 확인 후 입력란에 정확히 입력해주세요.');
				document.getElementById('emailCheckBtn').textContent = '인증번호 재전송';
				const email2 = document.getElementById('userEmail2');
				email2.setAttribute('onFocus', 'this.initialSelect = this.selectedIndex');
				email2.setAttribute('onChange', 'this.selectedIndex = this.initialSelect');
				document.getElementById('emailCheck').disabled = false;
			});
	});

	// 인증번호 검증
	document.getElementById('emailCheck').addEventListener('blur', function () {
		const inputCode = this.value; // 인증번호 입력값 가져오기
		const $emailCheck = document.getElementById('emailCheck');

		if (inputCode === String(code)) {
			$emailCheck.classList.remove('is-invalid');
			$emailCheck.classList.add('is-valid');
			document.getElementById('emailInvalidMsg').style.display = 'none';
			document.getElementById('emailValidMsg').style.display = 'block';
			document.getElementById('emailCheckBtn').disabled = true;
			document.getElementById('userEmail1').setAttribute('readonly', true);
			document.getElementById('userEmail2').setAttribute('readonly', true);
			document.getElementById('emailSelection').disabled = true;
			$emailCheck.style.color = '#198754';
			$emailCheck.disabled = true;

		} else {
			$emailCheck.classList.remove('is-valid');
			$emailCheck.classList.add('is-invalid');
			document.getElementById('emailValidMsg').style.display = 'none';
			document.getElementById('emailInvalidMsg').style.display = 'block';
			document.getElementById('emailCheck').value = '';
			document.getElementById('emailCheck').focus();
		}
	});
	
	document.getElementById('joinBtn').onclick = function () {

		if (idFlag && pwFlag) {
			if (!document.getElementById('userId').getAttribute('readonly')) {
				alert('아이디 중복 체크를 진행히세요');
				document.getElementById('userId').focus();
				return;
			}

			if (document.getElementById('userName').value === '') {
				alert('이름을 입력하세요');
				document.getElementById('userName').focus();
				return;
			}

			if (document.getElementById('userNick').value === '') {
				alert('닉네임을 입력하세요');
				document.getElementById('userName').focus();
				return;
			}

			if (!document.getElementById('emailCheckBtn').disabled) {
				alert('이메일 인증을 완료해주세요');
				document.getElementById('emailCheck').focus();
				return;
			}


			if (confirm('회원가입을 진행하시겠습니까?')) {
				document.forms.joinForm.submit();
			} else return;

		} else {
			alert('입력값을 다시 한 번 확인하세요.';
		}
	}

	
	
	
</script>





<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
	integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
	crossorigin="anonymous"></script>



<%@ include file="../include/footer.jsp"%>

