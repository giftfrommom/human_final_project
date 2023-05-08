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
			margin:20px;
			padding: 20px;
			width: 300px;
			position: relative;#
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
<%@ include file="/side.jsp" %>
	<h1>주문 내역</h1>
	<div class="container">
		<div class="card">
            <h4 style="float: right; color: #BDBDBD;">#123456</h4>
            <h4>2023.05.03 주문</h4>
			<h2>주문완료</h2>
			<p>교촌치킨 <br><span>₩18,000</span></p>
			<div class="card-footer">
                <button class="cancel-btn">삭제</button>
			</div>
		</div>
		<div class="card">
            <h4 style="float: right; color: #BDBDBD;">#123457</h4>
			<h4>2023.05.02 주문</h4>
			<h2>주문완료</h2>
			<p>도미노피자 <br><span>₩28,000</span></p>
			<div class="card-footer">
                <button class="cancel-btn">삭제</button>
			</div>
		</div>
        <div class="card">
            <h4 style="float: right; color: #BDBDBD;">#123457</h4>
			<h4>2023.05.02 주문</h4>
			<h2>주문완료</h2>
			<p>도미노피자 <br><span>₩28,000</span></p>
			<div class="card-footer">
                <button class="cancel-btn">삭제</button>
			</div>
		</div>
        <div class="card">
            <h4 style="float: right; color: #BDBDBD;">#123457</h4>
			<h4>2023.05.02 주문</h4>
			<h2>주문완료</h2>
			<p>도미노피자 <br><span>₩28,000</span></p>
			<div class="card-footer">
                <button class="cancel-btn">삭제</button>
			</div>
		</div>
        <div class="card">
            <h4 style="float: right; color: #BDBDBD;">#123457</h4>
			<h4>2023.05.02 주문</h4>
			<h2>주문완료</h2>
			<p>도미노피자 <br><span>₩28,000</span></p>
			<div class="card-footer">
                <button class="cancel-btn">삭제</button>
			</div>
		</div>
        <div class="card">
            <h4 style="float: right; color: #BDBDBD;">#123457</h4>
			<h4>2023.05.02 주문</h4>
			<h2>주문완료</h2>
			<p>도미노피자 <br><span>₩28,000</span></p>
			<div class="card-footer">
                <button class="cancel-btn">삭제</button>
			</div>
		</div>
	</div>
</body>
</html>
