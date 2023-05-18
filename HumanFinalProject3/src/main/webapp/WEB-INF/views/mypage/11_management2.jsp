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
 			border : 1px solid gray; 
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
		
		.board_list > div {
		    border-bottom: 1px solid #ddd;
		    font-size: 0;
		}
		
		.board_list > div.top {
		    border-bottom: 1px solid #999;
		}
		
		.board_list > div:last-child {
		    border-bottom: 1px solid #000;
		}
		
		.board_list > div > div {
		    display: inline-block;
		    padding: 15px 0;
		    text-align: center;
		    font-size: 1.4rem;
		}
		
/* 		.board_list > div.top > div { */
/* 		    font-weight: 600; */
/* 		} */
		
		.board_list .select{
			width:7.5%
		}
		.board_list .num{
			width:7.5%
		}
		.board_list .customerId{
			width:12.5%		
		}
		.board_list .name{
			width:15%
		}
		.board_list .gender{
			width:7.5%
		}
		.board_list .preferFood{
			width:15%
		}
		.board_list .preferStore{
			width:15%
		}
		.board_list .birth{
			width:20%
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
            .navbar__menu.active,
            .navbar__icons.active {
                display: flex;
                transition: 1s ease-out;
            }
		}
		.sidebar-item{
			padding:10px;
			font-size:16px;
		}
		
		.search-form {
	      display: flex;
	      flex-direction: column;
	      align-items: flex-start;
	    }
	    
	    .search-form label {
	      margin-bottom: 10px;
	    }
	    
	    .search-form input[type="text"],
	    .search-form select {
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
	    .search-form *{
	    	font-size:16px;
	    }
	   
		.board_wrap2{
			margin:10px;
		}
		.btnContainer{
/* 			border:1px solid gray; */
			width:800px;
			margin-bottom:10px;
		}
		.btnContainer2{
/* 			border:1px solid gray; */
			height:30px;
			margin:10px;
			display: flex;
  			justify-content: flex-end;
		}
		.btnContainer2 button{
			font-size:13px;
			margin-left:10px;
		}
		.combo{
			width:20px;
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
	        		  <button type="button" class="excel btn btn-secondary">엑셀다운</button>
		        </div>
	        </div>
	        <div class="board_list_wrap">
	            <div class="board_list">
	                <div class="top">
	                    <div class="select">선택</div>
	                    <div class="num">번호</div>
	                    <div class="customerId">고객ID</div>
	                    <div class="name">이름</div>
	                    <div class="gender">성별</div>
	                    <div class="preferFood">선호음식</div>
	                    <div class="preferStore">선호가게</div>
	                    <div class="birth">생년월일</div>
	                </div>
	                <div>
	                    <div class="select">
	                    	<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							</div>
	                    </div>
	                    <div class="num">1</div>
	                    <div class="customerId">1004</div>
	                    <div class="name">엄준상</div>
	                    <div class="gender">남</div>
	                    <div class="preferFood">치킨</div>
	                    <div class="preferStore">교촌치킨</div>
	                    <div class="birth">1996.11.27</div>
	                </div>
	                <div>
	                    <div class="select">
		                    <div class="form-check">
		                    	<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		                    </div>
	                    </div>
	                    <div class="num">2</div>
	                    <div class="customerId">2004</div>
	                    <div class="name">이아현</div>
	                    <div class="gender">여자</div>
	                    <div class="preferFood">피자</div>
	                    <div class="preferStore">피자마루</div>
	                    <div class="birth">2000.03.14</div>
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