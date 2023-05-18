<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	max-width: 550px;
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
input[type=detailed-address] {
        padding: 5px;
        margin-bottom: 10px;
        border: none;
        border-bottom: 2px solid #ddd;
        background-color: #f9f9f9; /* 배경 색상 추가 */
    }
    
    .btn {
        padding: 10px 20px;
        margin-top: 10px;
        background-color: #808080;
        color: white;
        border: none;
        cursor: pointer;
    }

    .btn:hover {
        background-color: #606060;
    }
    .address-field {
        display: flex;
        justify-content: space-between;
    }
    .address-field input[type=detailed-address] {
        flex-grow: 1;
        margin-right: 10px;
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
		<form id="02_edit" action="02_edit" method="get">
			<label for="username">아이디:${vo2.CUSTOMER_LOGINID}</label>
			<input type="text" id="username" name="CUSTOMER_LOGINID"><br>

			<label for="email">이메일:${vo2.CUSTOMER_EMAIL}</label>
			<input type="email" id="email" name="CUSTOMER_EMAIL"><br>
			
			<label for="nickname">닉네임:</label>
			<input type="text" id="nickname" name="nickname"><br>

			<label for="password">현재 비밀번호</label>
			<input type="password" id="password" name="CUSTOMER_PASSWORD"><br>

			<label for="confirm-password">변경할 비밀번호</label>
			<input type="password" id="confirm-password" name="confirm-password"><br>
			
			<div class="address-field1">
                <label for="CUSTOMER_ADDRESS1">우편번호:</label>
                <input type="text2" id="CUSTOMER_ADDRESS1" name="CUSTOMER_ADDRESS1" required>
                <button type="button" class="btn" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
            </div>

        <div class="address-field" style="margin-top: 20px;">
            <input type="detailed-address" class="form-control" id="CUSTOMER_ADDRESS2" name="CUSTOMER_ADDRESS2" placeholder="도로명주소">
            <input type="detailed-address" class="form-control" name="CUSTOMER_ADDRESS3" id="CUSTOMER_ADDRESS3" placeholder="상세주소">
            <input type="text" class="form-control" name="CUSTOMER_ADDRESS4" id="CUSTOMER_ADDRESS4" placeholder="참고항목">
        </div>
	
			<input type="submit" value="수정하기">
		</form>
	</div>
</body>
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
</html>
