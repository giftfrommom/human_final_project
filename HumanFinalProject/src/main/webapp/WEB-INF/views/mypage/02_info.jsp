<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
.container {
	margin: 50px auto;
	padding: 20px;
	max-width: 500px;
	border: 2px solid #ddd;
	box-shadow: 0 0 10px #ccc;
	margin-right: 200px;
}

h1 {
	text-align: center;
}

form {
	display: flex;
	flex-direction: column;
}

label {
	margin-top: 10px;
	font-weight: bold;
}

input[type=text],
input[type=email],
input[type=password],
input[type=address],
input[type=detailed-address] {
	padding: 5px;
	margin-bottom: 10px;
	border: none;
	border-bottom: 2px solid #ddd;
}

input[type=file] {
	margin-top: 10px;
}

input[type=submit] {
	margin-top: 20px;
	background-color: #4CAF50;
	color: white;
	padding: 10px;
	border: none;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

    </style>
    
<head>
	<title>회원정보 수정</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%@ include file="/side.jsp" %>
	<div class="container">
		<h1>회원정보 수정</h1>
		<form>
			<label for="username">사용자 이름:</label>
			<input type="text" id="username" name="username"><br>

			<label for="email">이메일:</label>
			<input type="email" id="email" name="email"><br>

			<label for="password">현재 비밀번호:</label>
			<input type="password" id="password" name="password"><br>

			<label for="confirm-password">변경할 비밀번호:</label>
			<input type="password" id="confirm-password" name="confirm-password"><br>

            <label for="address">주소</label>
            <input type="address" id="address" name="address"><br>

            <label for="detailed-address">상세주소</label>
            <input type="detailed-address" id="detailed-address" name="detailed-address"><br>


			<input type="submit" value="수정하기">
		</form>
	</div>
</body>
</html>
