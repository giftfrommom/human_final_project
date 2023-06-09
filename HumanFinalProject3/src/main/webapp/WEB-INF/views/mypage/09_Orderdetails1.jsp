<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:foreach -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>주문 내역</title>
<style>

input[id="menuicon"] {
	display: none;
}

input[id="menuicon"]+label {
	display: block;
	width: 40px;
	height: 22px;
	position: absolute;
	right: 50px;
	/* top: calc(50% - 25px); */
	transition: all .35s;
	cursor: pointer;
	margin-top: 10px;
}

input[id="menuicon"]+label span {
	display: block;
	position: absolute;
	width: 100%;
	height: 5px;
	border-radius: 30px;
	background: #fff;
	transition: all .35s;
}

input[id="menuicon"]+label span:nth-child(1) {
	top: 0;
}

input[id="menuicon"]+label span:nth-child(2) {
	top: 50%;
	transform: translateY(-50%);
}

input[id="menuicon"]+label span:nth-child(3) {
	bottom: 0;
}

input[id="menuicon"]:checked+label {
	z-index: 2;
	left: 300px;
}

input[id="menuicon"]:checked+label span {
	background: #fff;
}

input[id="menuicon"]:checked+label span:nth-child(1) {
	top: 50%;
	transform: translateY(-50%) rotate(45deg);
}

input[id="menuicon"]:checked+label span:nth-child(2) {
	opacity: 0;
}

input[id="menuicon"]:checked+label span:nth-child(3) {
	bottom: 50%;
	transform: translateY(50%) rotate(-45deg);
}

div[class="sidebar"] {
	width: 300px;
	height: 100%;
	background: #60646A;
	position: fixed;
	top: 0;
	left: 00px;
	z-index: 1;
	transition: all .35s;
}

input[id="menuicon"]:checked+label+div {
	left: 0;
}

:root { -
	-text-color: black; -
	-background-color: #263343; -
	-accent-color: rgb(87, 170, 166)
}

body {
	margin: 0;
	font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI',
		Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue',
		sans-serif;
}

a {
	text-decoration: none;
	color: var(- -text-color);
}

.navbar {
	display: flex;
	justify-content: space-evenly;
	align-items: center;
	/* background-color: #263343; */
	padding: 5px 12px;
}

.navbar__logo {
	font-size: 24px;
	color: cadetblue;
}

.navbar__menu li {
	padding: 10px 20px;
}

.navbar__icons {
	list-style: none;
	display: flex;
	color: white;
	padding-left: 0px;
	padding-right: 80px;
	/* margin-left: 300px; */
}

.navbar__menu {
	display: flex;
	list-style: none;
	padding-left: 0px;
	justify-content: center;
	/* 가로 중앙 정렬 */
}

.navbar__menu li {
	padding: 8px 13px;
	text-align: center;
	/* 세로 중앙 정렬 */
}

.navbar__menu :hover {
	color: aqua;
	border-radius: 5px;
}

.navbar__icons li {
	padding: 10px;
}

.navbar__toggleBtn {
	display: none;
}

@media screen and (max-width: 768px) {
	.navbar {
		flex-direction: column;
		align-items: flex-start;
		padding: 10px 24px;
	}
	.navbar__menu {
		display: none;
		flex-direction: column;
		align-items: center;
		width: 100%;
	}
	.navbar__menu li {
		width: 100%;
		text-align: center;
	}
	.navbar__icons {
		list-style: none;
		display: flex;
		justify-content: flex-end;
		/* 오른쪽 정렬 */
		color: white;
		padding-left: 0px;
		padding-right: 80px;
		/* margin-left: 300px; */
	}
	.navbar__toggleBtn {
		display: block;
		position: absolute;
		right: 20px;
		font-size: 24px;
		color: rgb(87, 170, 166);
	}
	.navbar__menu.active, .navbar__icons.active {
		display: flex;
		transition: 1s ease-out;
	}
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
}

h1 {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 30px;
	margin-left: 300px;
}

.container {
	display: flex;
	justify-content: center;
	margin: 0 auto;
	max-width: 1000px;
	height: 230px;
	flex-wrap: wrap;
	margin-left: 300px;
}

.card {
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	margin: 20px;
	padding: 20px;
	width: 300px;
	position: relative;
	#
}

.card h2 {
	font-size: 20px;
	margin-top: 0;
}

.card p {
	font-weight: bold;
}

.card p span {
	font-weight: normal;
	color: #848484;
}

.card .cancel-btn {
	position: absolute;
	bottom: 30px;
	right: 20px;
	background-color: #f44336;
	color: white;
	border: none;
	border-radius: 4px;
	padding: 8px;
	cursor: pointer;
	font-size: 14px;
}

.card .cancel-btn:hover {
	background-color: #e53935;
}
</style>
</head>
<body>
	<ul class="navbar__icons" style="padding-left: 200px;">
		</label>
		<div class="sidebar">
			<div class="sidebar-header">
				<h3 class="sidebar-title" style="margin-left: 20px; font-size: 30px">
				<a href="01_Main.do" style="color: white">띱</a>
				</h3>
				<div style="border: 1px solid white;"></div>
			</div>
			<div class="sidebar-body" style="margin-top: 30px;">
				<a href="02_info.do" style="color: white"><li class="sidebar-item" style="cursor: pointer;">회원정보</li></a> 
				<a href="09_Orderdetails1.do"><li class="sidebar-item" style="cursor: pointer; background-color: white; color: black;"><strong>주문내역</strong></li></a>
				<a href="10_coupone.do" style="color: white"><li class="sidebar-item" style="cursor: pointer;">쿠폰함</li></a>
				<a href="08_Payment.do" style="color: white"><li class="sidebar-item" style="cursor: pointer;">띱머니충전</li></a> 
				<a style="color: white"><li class="sidebar-item" style="cursor: pointer;">채팅</li></a>
				<a href="11_management2.do" style="color: white"><li class="sidebar-item" style="cursor: pointer;">회원관리</li></a>
			</div>
		</div>
	</ul>

	<h1>주문 내역</h1>
	<div class="container">
		<c:forEach items="${OrderList}" var="ddip">
			<div class="card">
				<h4 style="float: right; color: #BDBDBD;">#${ddip.order_tbl_datail_id}</h4>
				<h4>${ddip.order_time}주문</h4>
				<h2>주문완료</h2>
				<p>${ddip.order_menu_name}
					<br>
					<span>₩${ddip.order_menu_price}</span>
				</p>
				<div class="card-footer">
					<button class="cancel-btn">삭제</button>
				</div>
			</div>
		</c:forEach>
</body>
<script>
	var cancelButtons = document.getElementsByClassName('cancel-btn');
	for (var i = 0; i < cancelButtons.length; i++) {
		cancelButtons[i].addEventListener('click', function() {
			var card = this.closest('.card');
			card.remove();
		});
	}
</script>
</html>
