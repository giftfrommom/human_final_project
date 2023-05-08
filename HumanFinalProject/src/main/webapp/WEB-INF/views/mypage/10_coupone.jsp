<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>주문 내역</title>
	<style>
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
		}
		.container {
			display: flex;
			justify-content: center;
			margin: 0 auto;
			max-width: 1000px;
            height: 230px;
            flex-wrap: wrap;
		}
		.card {
			background-color: #ffffff;
			border-radius: 8px;
			box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
			margin:20px;
			padding: 20px;
			width: 300px;
			position: relative;
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
        padding: 10px 20px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 30px;
        margin-left: 100px;
        }

        .card .cancel-btn:hover {
        background-color: #e53935;
        }
	</style>
</head>
<body>
<%@ include file="/side.jsp" %>
	<h1 style="margin-left: 250px">쿠폰함</h1>
	<div class="container" style="margin-left: 300px">
		<div class="card">
            <h3>1000원 할인 쿠폰</h3>
            <p>최소 주문 금액: 20,000원</p>
                <button class="cancel-btn">쿠폰 사용</button>
			</div>
		<div class="card">
			<h3>2000원 할인 쿠폰</h3>
			<p>최소 주문 금액: 20,000원</p>
                <button class="cancel-btn">쿠폰 사용</button>
			</div>
        <div class="card">
			<h3>교촌치킨 3000원 할인 쿠폰</h3>
			<p>최소 주문 금액: 20,000원</p>
                <button class="cancel-btn">쿠폰 사용</button>
			</div>
        <div class="card">
			<h3>도미노피자 2000원 할인 쿠폰</h3>
			<p>최소 주문 금액: 20,000원</p>
                <button class="cancel-btn">쿠폰 사용</button>
			</div>
        <div class="card">
			<p>10% 할인 쿠폰</p>
			<p>최소 주문 금액: 20,000원</p>
                <button class="cancel-btn">쿠폰 사용</button>
			</div>
        <div class="card">
			<h3>20% 할인 쿠폰</h3>
			<p>최소 주문 금액: 20,000원</p>
                <button class="cancel-btn">쿠폰 사용</button>
			</div>
	</div>
</body>
</html>
