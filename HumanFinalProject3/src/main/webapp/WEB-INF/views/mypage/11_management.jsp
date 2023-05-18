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
		    margin-bottom: 30px;
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
		
		.board_list > div.top > div {
		    font-weight: 600;
		}
		
		.board_list .num {
		    width: 10%;
		}
		
		.board_list .title {
		    width: 60%;
		    text-align: left;
		}
		
		.board_list .top .title {
		    text-align: center;
		}
		
		.board_list .writer {
		    width: 10%;
		}
		
		.board_list .date {
		    width: 10%;
		}
		
		.board_list .count {
		    width: 10%;
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
    </style>
</head>
<body>
<ul class="navbar__icons" style="padding-left: 200px;">
           </label>
           <div class="sidebar">
               <div class="sidebar-header">
                   <h3 class="sidebar-title" style="margin-left: 20px; font-size: 30px"><a href="01_Main.do" style="color: white">띱</a></h3>
                   <div style="border: 1px solid white;"></div>
               </div>
               <div class="sidebar-body" style="margin-top: 30px;">
				<a href="02_info.do" style="color: white"><li class="sidebar-item">회원정보</li></a>
				<a href="09_Orderdetails1.do" style="color: white"><li class="sidebar-item">주문내역</li></a>
				<a href="10_coupone.do"><li class="sidebar-item" style="background-color: white; color: black;"><strong>쿠폰함</strong></li></a>
				<a href="08_Payment.do" style="color: white"><li class="sidebar-item">띱머니충전</li></a>
				<a href="/" style="color: white"><li class="sidebar-item">채팅</li></a>
				<a href="/" style="color: white"><li class="sidebar-item">회원관리</li></a>
               </div>
           </div>
       </ul>
       <div class="container" style="margin-left: 330px; margin-right: 30px;">
    <div class="board_wrap">
        <div class="board_title">
            <strong>공지사항</strong>
            <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">작성일</div>
                    <div class="count">조회</div>
                </div>
                <div>
                    <div class="num">5</div>
                    <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                    <div class="writer">김이름</div>
                    <div class="date">2021.1.15</div>
                    <div class="count">33</div>
                </div>
                <div>
                    <div class="num">4</div>
                    <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                    <div class="writer">김이름</div>
                    <div class="date">2021.1.15</div>
                    <div class="count">33</div>
                </div>
                <div>
                    <div class="num">3</div>
                    <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                    <div class="writer">김이름</div>
                    <div class="date">2021.1.15</div>
                    <div class="count">33</div>
                </div>
                <div>
                    <div class="num">2</div>
                    <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                    <div class="writer">김이름</div>
                    <div class="date">2021.1.15</div>
                    <div class="count">33</div>
                </div>
                <div>
                    <div class="num">1</div>
                    <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                    <div class="writer">김이름</div>
                    <div class="date">2021.1.15</div>
                    <div class="count">33</div>
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