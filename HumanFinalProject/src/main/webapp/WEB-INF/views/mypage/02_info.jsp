<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

        :root {
            --text-color: black;
            --background-color: #263343;
            --accent-color: rgb(87, 170, 166)
        }

        body {
            margin: 0;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }

        a {
            text-decoration: none;
            color: var(--text-color);
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

            .navbar__menu.active,
            .navbar__icons.active {
                display: flex;
                transition: 1s ease-out;
            }
		}
    
    
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
<ul class="navbar__icons" style="padding-left: 200px;">
            </label>
            <div class="sidebar">
                <div class="sidebar-header">
                    <h3 class="sidebar-title" style="margin-left: 20px; font-size: 30px"><a href="01_Main.do" style="color: white">띱</a></h3>
                    <div style="border: 1px solid white;"></div>
                </div>
                <div class="sidebar-body" style="margin-top: 30px;">
					<a href="02_info.do"><li class="sidebar-item" style="cursor: pointer; background-color: white; color: black;"><strong>회원정보</strong></li></a>
					<a href="09_Orderdetails1.do" style="color: white"><li class="sidebar-item">주문내역</li></a>
					<a href="10_coupone.do" style="color: white"><li class="sidebar-item">쿠폰함</li></a>
					<a href="08_Payment.do" style="color: white"><li class="sidebar-item">띱머니충전</li></a>
					<a href="/" style="color: white"><li class="sidebar-item">채팅</li></a>
					<a href="/" style="color: white"><li class="sidebar-item">회원관리</li></a>
                </div>
            </div>
        </ul>
    </nav>
    
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
