<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, ê·¸ë¦¬ê³  Bootstrap ê¸°ì¬ìë¤">
<meta name="generator" content="Hugo 0.104.2">
<title>13_Login</title>



<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script> -->
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


<style>
	.text-center {
		max-width: 400px;
		margin: 50px auto;
	}
	
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
<link href="signin.css" rel="stylesheet">
</head>
<script>
	window.onload = function(){
		document.getElementById('Submit').onclick = check;	
	}
	
	function check(){
		if(document.form.CUSTOMER_LOGINID.value==""){
			alert("ID를 입력하세요.")
			document.form.userId.focus();
			return false;
		}
		
		if(document.form.CUSTOMER_PASSWORD.value==""){
			alert("패스워드를 입력하세요.")
			document.form.userPass.focus();
			return false;
		}
		
		document.form.submit();//전송
		
	}
	
	
</script>
<body>
	<%@ include file="/header.jsp"%>
	<div class="text-center">


		<main class="form-signin w-100 m-auto">
			<form style="margin-top: 200px;" action="/member/login.do" name="form">
				<div class="form-floating">
					<input type="text" class="form-control" id="CUSTOMER_LOGINID" name="CUSTOMER_LOGINID"
						placeholder="name@example.com"> <label for="floatingInput">아이디</label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="CUSTOMER_PASSWORD" name="CUSTOMER_PASSWORD"
						placeholder="Password"> <label for="floatingPassword">패스워드</label>
				</div>

				<div class="checkbox mb-3">
					<label> <input type="checkbox" value="remember-me" id="IdMemory">
						아이디 저장
					</label>
				</div>
				<button class="w-100 btn btn-lg btn-primary" type="submit" id="Submit">로그인</button>
			</form>
		</main>

	</div>

</body>
<script type="text/javascript">



</script>
</html>
