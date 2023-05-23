<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">
<title>회원가입</title>
<!-- ajax -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script src="../resources/js/scripts_ilsang.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("CUSTOMER_ADDRESS4").value = extraAddr;

						} else {
							document.getElementById("CUSTOMER_ADDRESS4").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('CUSTOMER_ADDRESS1').value = data.zonecode;
						document.getElementById("CUSTOMER_ADDRESS2").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("CUSTOMER_ADDRESS3")
								.focus();
					}
				}).open();
		
		
	}
</script>




<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.2/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg"
	color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">
<!-- ajax -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script src="/resources/js/scripts_ilsang.js"></script>


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>


<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">
</head>
<body class="bg-light">

	<div class="container" >
		<div style="display: flex;justify-content: center;align-items: center;margin-left: 350px;">
		<div class="py-5 text-center"></div>
		<main>

			<div class="row g-12">

<!-- 				<h2>로고</h2> -->
				<form method="post" class="needs-validation" name="userinput" action="userInsert.do"
					onsubmit="return false;" novalidate>
					<div class="col-md-7 col-lg-8">
						<h4 class="mb-3">회 원 가 입</h4>
						<div class="row g-3">

							<div class="col-12">
								<label for="username" class="form-label">ID</label>
								<div class="input-group has-validation">
									<input type="text" class="form-control" id="CUSTOMER_LOGINID"
										placeholder="UserId" name="CUSTOMER_LOGINID" required>
								</div>
								<div id="idCheckResult" style="color: red;"></div>
							</div>
							<div class="col-12">
								<label for="username" class="form-label">비밀번호</label>
								<div class="input-group has-validation">
									<input type="password" class="form-control"
										id="CUSTOMER_PASSWORD" name="CUSTOMER_PASSWORD" placeholder="password" required>

								</div>
							</div>
							<div class="col-12">
								<label for="username" class="form-label">비밀번호확인</label>
								<div class="input-group has-validation">
									<input type="password" class="form-control" id="userPass_in"
										placeholder="password확인" required>
								</div>
							</div>

							<div class="col-sm-12">
								<label class="form-label">이름</label> <input type="text"
									class="form-control" id="CUSTOMER_NAME" placeholder="이름" name="CUSTOMER_NAME"
									value="" required>
								<div class="invalid-feedback">유효한 이름이 필요합니다.</div>
							</div>
							<div class="col-12">
								<label for="username" class="form-label">닉네임</label>
								<div class="input-group has-validation">
									<input type="text" class="form-control" id="CUSTOMER_NICKNAME" name="CUSTOMER_NICKNAME"
										placeholder="닉네임" required>
								</div>
							</div>
							<div class="col-sm-12">
								<label class="form-label">생년월일</label> <input type="text"
									class="form-control" id="CUSTOMER_BIRTHDAY" placeholder="생년월일" name="CUSTOMER_BIRTHDAY"
									value="" required>

							</div>
							<div class="col-12">
								<label for="email" class="form-label">Email <span
									class="text-muted">(Optional)</span></label> <input type="email" name="CUSTOMER_EMAIL"
									class="form-control" id="CUSTOMER_EMAIL" placeholder="이메일주소">
							</div>
							<div id="emailCheckResult" style="color: red;"></div>

							<br>
							
							<!-- CUSTOMER_ADDRESS 가 좌표가 아니며, 4개로 나눠져 있음 -->
							<div class="col-4">
								<label for="sample6_postcode" class="form-label">주소</label> <input
									type="text" class="form-control" id="CUSTOMER_ADDRESS1" name="CUSTOMER_ADDRESS1"
									placeholder="우편번호" required>
							</div>
							<div class="col-4">
								<input type="button" style="margin-top: 32px;"
									class="btn btn-secondary" class="form-control" id="address"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							</div>
							<div class="col-5">
								<input type="text" class="form-control" id="CUSTOMER_ADDRESS2" name="CUSTOMER_ADDRESS2"
									 placeholder="도로명주소">

							</div>
							<div class="col-4">
								<input type="text" class="form-control" name="CUSTOMER_ADDRESS3"
									id="CUSTOMER_ADDRESS3" placeholder="상세주소">

							</div>
							<div class="col-3">
								<input type="text" class="form-control" name="CUSTOMER_ADDRESS4"
									id="CUSTOMER_ADDRESS4" placeholder="참고항목">
							</div>
							
							
							<div class="col-6">
								<input type="text" style="margin-top: 32px;"
									class="form-control" id="CUSTOMER_PREFERMENU" placeholder="메뉴" name="CUSTOMER_PREFERMENU"
									required>
							<div class="invalid-feedback">음식</div>
							<div class="col-6">
								<label for="address" class="form-label"></label> <input
									type="text" class="form-control" id="CUSTOMER_PREFERSTORE" name="CUSTOMER_PREFERSTORE"
									placeholder="가게" required>
								<div class="invalid-feedback">메뉴</div>
							</div>
							


							</div>
						</div>
						<hr class="my-4">

						<div class="form-check">
							개인정보동의서 <input type="checkbox" class="form-check-input"
								id="same-address"> <label class="form-check-label"
								for="same-address">Shipping address is the same as my
								billing address</label>
						</div>

						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="save-info">
							<label class="form-check-label" for="save-info">Save this
								information for next time</label>
						</div>


						<div class="row gy-3"></div>

						<hr class="my-4">

						<button class="w-100 btn btn-primary btn-lg" type="submit"
							id="confirm">회원 가입 완료</button>
					</div>
				</form>
			</div>
		</main>
		</div>
	</div>

	<footer class="my-5 pt-5 text-muted text-center text-small"> </footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>

	<script src="form-validation.js"></script>
</body>
</html>
