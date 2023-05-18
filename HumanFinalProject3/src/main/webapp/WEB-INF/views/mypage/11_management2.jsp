<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- c:foreach -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <!-- ajax -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="../resources/js/scripts_junsang.js"></script>
    <!-- Core theme CSS (includes Bootstrap)-->
	<link href="/resources/css/styles.css" rel="stylesheet" />
	<!-- Excel다운 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
	<!-- 부트스트랩 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"></script>
    <style>
		* {
			margin: 0;
			padding: 0;
		}
		
		html {
			font-size: 10px;
		}
		
		ul, li {
			list-style: none;
		}
		
		a {
			text-decoration: none;
			color: inherit;
		}
		
		.board_wrap {
			width: 800px;
			margin: 100px auto;
		}
		
		.board_title {
			border: 1px solid gray;
			margin-bottom: 10px;
		}
		
		.board_title strong {
			font-size: 3rem;
		}
		
		.board_title p {
			margin-top: 5px;
			font-size: 1.4rem;
		}
		
		.bt_wrap {
			margin-top: 30px;
			text-align: center;
			font-size: 0;
		}
		
		.bt_wrap a {
			display: inline-block;
			min-width: 80px;
			margin-left: 10px;
			padding: 10px;
			border: 1px solid #000;
			border-radius: 2px;
			font-size: 1.4rem;
		}
		
		.bt_wrap a:first-child {
			margin-left: 0;
		}
		
		.bt_wrap a.on {
			background: #000;
			color: #fff;
		}
		
		.board_list {
			width: 100%;
			border-top: 2px solid #000;
		}
		
		.board_list>div {
			border-bottom: 1px solid #ddd;
			font-size: 0;
		}
		
		.board_list>div.top {
			border-bottom: 1px solid #999;
		}
		
		.board_list>div:last-child {
			border-bottom: 1px solid #000;
		}
		
		.board_list>div>div {
			display: inline-block;
			padding: 15px 0;
			text-align: center;
			font-size: 1.4rem;
		}
		
		/* 		.board_list > div.top > div { */
		/* 		    font-weight: 600; */
		/* 		} */
		.board_list .select {
			width: 7.5%
		}
		
		.board_list .num {
			width: 7.5%
		}
		
		.board_list .customerId {
			width: 12.5%
		}
		
		.board_list .name {
			width: 15%
		}
		
		.board_list .gender {
			width: 7.5%
		}
		
		.board_list .preferFood {
			width: 15%
		}
		
		.board_list .preferStore {
			width: 15%
		}
		
		.board_list .birth {
			width: 20%
		}
		
		.board_page {
			margin-top: 30px;
			text-align: center;
			font-size: 0;
		}
		
		.board_page a {
			display: inline-block;
			width: 32px;
			height: 32px;
			box-sizing: border-box;
			vertical-align: middle;
			border: 1px solid #ddd;
			border-left: 0;
			line-height: 100%;
		}
		
		.board_page a.bt {
			padding-top: 10px;
			font-size: 1.2rem;
			letter-spacing: -1px;
		}
		
		.board_page a.num {
			padding-top: 9px;
			font-size: 1.4rem;
		}
		
		.board_page a.num.on {
			border-color: #000;
			background: #000;
			color: #fff;
		}
		
		.board_page a:first-child {
			border-left: 1px solid #ddd;
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
		
		.navbar__icons {
			list-style: none;
			display: flex;
			color: white;
			padding-left: 0px;
			padding-right: 80px;
			/* margin-left: 300px; */
		}
		
		.navbar__icons li {
			padding: 10px;
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
		
		@media screen and (max-width: 768px) {
			.navbar__menu.active, .navbar__icons.active {
				display: flex;
				transition: 1s ease-out;
			}
		}
		
		.sidebar-item {
			padding: 10px;
			font-size: 16px;
		}
		
		.search-form {
			display: flex;
			flex-direction: column;
			align-items: flex-start;
		}
		
		.search-form label {
			margin-bottom: 10px;
		}
		
		.search-form input[type="text"], .search-form select {
			width: 200px;
			padding: 5px;
		}
		
		.search-form input[type="submit"] {
			padding: 5px 10px;
			background-color: #4CAF50;
			color: white;
			border: none;
			cursor: pointer;
		}
		
		.search-form * {
			font-size: 16px;
		}
		
		.board_wrap2 {
			margin: 10px;
		}
		
		.btnContainer {
			/* 			border:1px solid gray; */
			width: 800px;
			margin-bottom: 10px;
		}
		
		.btnContainer2 {
			/* 			border:1px solid gray; */
			height: 30px;
			margin: 10px;
			display: flex;
			justify-content: flex-end;
		}
		
		.btnContainer2 button {
			font-size: 13px;
			margin-left: 10px;
		}
		
		.combo {
			width: 20px;
		}
		
		.select {
			display: flex;
			align-items: center;
		}
		
		.form-check {
			display: flex;
			align-items: center;
			justify-content: center;
		}
		
		.form-check-input {
			margin: 0;
		}

		/*모달*/
		.modal {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			display: none;
			background-color: rgba(0, 0, 0, 0.4);
		}
		
		.modal.show {
			display: block;
		}
		
		.modal_body {
			position: absolute;
			top: 50%;
			left: 50%;
			width: 600px;
			height: 400px;
			background-color: rgb(255, 255, 255);
			border-radius: 10px;
			box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
			transform: translateX(-50%) translateY(-50%);
		}
		
		.m_head {
			padding: 10px 20px;
			display: flex;
			justify-content: space-between;
			background-color: #e7e5e5;
			border-top-left-radius: 10px;
			border-top-right-radius: 10px;
		}
		
		.m_body {
			font-size:15px;
			height: 80%;
			padding: 20px;
		}
		
		.m_footer {
			padding: 15px;
			background-color: #e7e5e5;
			border-bottom-left-radius: 10px;
			border-bottom-right-radius: 10px;
			display: flex;
			justify-content: end;
		}
		
		.modal_title {
			font-size: 18px;
			color: gray;
			font-weight: 500;
		}
		
		.close_btn {
			font-size: 20px;
			color: rgb(139, 139, 139);
			font-weight: 900;
			cursor: pointer;
		}
		
		.modal_label {
			padding-top: 10px;
		}
		
		.input_box {
			width: 100%;
			border: 1px solid rgb(189, 189, 189);
			height: 30px;
		}
		
		.modal_btn {
			width: 80px;
			height: 30px;
			border-radius: 5px;
			text-align: center;
			font-size: 14px;
			font-weight: bolder;
			padding-top: 5px;
			margin-left: 5px;
			font-family: sans-serif;
		}
		
		.cancle {
			background-color: white;
			color: black;
		}
		
		.save {
			background-color: #6C757D;
			color: white;
		}
		
		.hover:hover {
			cursor: pointer;
		}
		table {
		  width: 100%;
		  border-collapse: collapse;
		}
		
		th, td {
		  padding: 8px;
		  text-align: left;
		  border-bottom: 1px solid #ddd;
		}
		
		th {
		  background-color: #f2f2f2;
		}
</style>
</head>
<body>
	<ul class="navbar__icons" style="padding-left: 200px;">
		<div class="sidebar">
			<div class="sidebar-header">
				<h3 class="sidebar-title" style="margin-left: 20px; margin-top:30px; margin-bottom:30px; font-size: 30px"><a href="01_Main.do" style="color: white">띱</a></h3>
				<div style="border: 1px solid white;"></div>
			</div>
			<div class="sidebar-body" style="margin-top: 30px;">
				<a href="02_info.do" style="color: white"><li class="sidebar-item">회원정보</li></a>
				<a href="09_Orderdetails1.do" style="color: white"><li class="sidebar-item">주문내역</li></a>
				<a href="10_coupone.do" style="color: white"><li class="sidebar-item" >쿠폰함</li></a>
				<a href="08_Payment.do" style="color: white"><li class="sidebar-item">띱머니충전</li></a>
				<a href="/" style="color: white"><li class="sidebar-item">채팅</li></a>
				<a href="11_management.do" style="color: white"><li class="sidebar-item" style="background-color: white; color: black;"><strong>회원관리</strong></li></a>
			</div>
		</div>
	</ul>
	<div class="container1" style="margin-left: 330px; margin-right: 30px;">
	    <div class="board_wrap">
	        <div class="board_title">
	  		  <div class="board_wrap2">
	         <form class="search-form">
	         <div class="firstLine">
			    <span>
				    <select id="category">
				      <option value="none">카테고리</option>
				      <option value="customer_name">이름</option>
				      <option value="customer_id">고객ID</option>
				    </select>
				    <input type="text" id="search">
			    </span>
			    <span class="genderSpan">
				    <label for="male">남</label>
				    <input type="radio" id="male" name="gender" value="male" checked>
				    <label for="female">여</label>
				    <input type="radio" id="female" name="gender" value="female">
			    </span>
			  </div>
			  <div>
			    <span>
				    <select id="combo1" class="combo">
				      <option value="none" selected>선호음식</option>
				      <option value="chicken">치킨</option>
				      <option value="pizza">피자</option>
				      <option value="snack">분식</option>
				    </select>
				    <select id="combo2" class="combo">
				      <option value="none" selected>선호가게</option>
<!-- 				      <option value="optionX">옵션 X</option> -->
<!-- 				      <option value="optionY">옵션 Y</option> -->
<!-- 				      <option value="optionZ">옵션 Z</option> -->
				    </select>
			    </span>   
			    <span>
				    <input type="date" id="start_date">
				    <input type="date" id="end_date">
			    </span>
			  </div>  
			  </form>  
	        </div>
	        </div>
	        <div class="btnContainer">
		        <div class="btnContainer2">
	        		  <button type="button" class="read btn btn-secondary">조회</button>
	        		  <button type="button" class="update btn btn-secondary">수정</button>
	        		  <button type="button" class="delete btn btn-secondary">삭제</button>
	        		  <button type="button" class="excel btn btn-secondary" id="downloadButton">엑셀다운</button>
		        </div>
	        </div>
			<!-- 모달 -->
				<!-- Modal -->
			<div class="modal" id="modal_11">
				<div class="modal_body">
					<div class="m_head">
						<div class="modal_title">정보 수정</div>
						<div class="close close_btn" id="close_btn">X</div>
					</div>
					<div class="m_body">					
						<div class="container">
							<table>
							  <tbody>
							    <tr>
							      <th>고객ID</th>
							      <td>1004</td>
							    </tr>
							    <tr>
							      <th>이름</th>
							      <td>엄준상</td>
							    </tr>
							    <tr>
							      <th>성별</th>
							      <td>남</td>
							    </tr>
							    <tr>
							      <th>선호음식</th>
							      <td>치킨</td>
							    </tr>
							    <tr>
							      <th>선호가게</th>
							      <td>교촌치킨</td>
							    </tr>
							    <tr>
							      <th>생년월일</th>
							      <td>1996.11.27</td>
							    </tr>
							  </tbody>
							</table>
						</div>
					</div>
					<div class="m_footer">
						<div class="close hover modal_btn cancle" id="close_btn">취소</div>
						<div class="hover modal_btn save" id="save_btn_11">확인</div>
					</div>
				</div>
			</div>

			<div class="board_list_wrap">
	            <div id="dataContainer" class="board_list">
	                <div class="row top">
	                    <div class="select">선택</div>
	                    <div class="cell num">번호</div>
	                    <div class="cell customerId">고객ID</div>
	                    <div class="cell name">이름</div>
	                    <div class="cell gender">성별</div>
	                    <div class="cell preferFood">선호음식</div>
	                    <div class="cell preferStore">선호가게</div>
	                    <div class="cell birth">생년월일</div>
	                </div>
	                <div class="row">
	                    <div class="select">
	                    	<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							</div>
	                    </div>
	                    <div class="cell num">1</div>
	                    <div class="cell customerId">1004</div>
	                    <div class="cell name">엄준상</div>
	                    <div class="cell gender">남</div>
	                    <div class="cell preferFood">치킨</div>
	                    <div class="cell preferStore">교촌치킨</div>
	                    <div class="cell birth">1996.11.27</div>
	                </div>  
	                <div class="row">
	                    <div class="select">
	                    	<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							</div>
	                    </div>
	                    <div class="cell num">2</div>
	                    <div class="cell customerId">2004</div>
	                    <div class="cell name">김김김</div>
	                    <div class="cell gender">남</div>
	                    <div class="cell preferFood">치킨</div>
	                    <div class="cell preferStore">교촌치킨</div>
	                    <div class="cell birth">1996.11.27</div>
	                </div>             
	            </div>
	            <div class="board_page">
	                <a href="#" class="bt first"><<</a>
	                <a href="#" class="bt prev"><</a>
	                <a href="#" class="num on">1</a>
	                <a href="#" class="num">2</a>
	                <a href="#" class="num">3</a>
	                <a href="#" class="num">4</a>
	                <a href="#" class="num">5</a>
	                <a href="#" class="bt next">></a>
	                <a href="#" class="bt last">>></a>
	            </div>
	            <div class="bt_wrap">
	                <a href="write.html" class="on">등록</a>
	                <!--<a href="#">수정</a>-->
	            </div>
	        </div>
	    </div>
    </div>

</body>
</html> 