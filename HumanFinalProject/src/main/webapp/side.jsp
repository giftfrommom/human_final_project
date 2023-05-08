<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보</title>
    <!-- ajax -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="../resources/js/scripts_junhyeok.js"></script>
	
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="main.js"></script>
    <style>
    
    	.sidebar-item {
  		color: white;
  		cursor: pointer;
		}
		
		.sidebar-item.active {
  		background-color: white;
  		color: black;
  		font-weight: bold;
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
            /* ê°ë¡ ì¤ì ì ë ¬ */
        }

        .navbar__menu li {
            padding: 8px 13px;
            text-align: center;
            /* ì¸ë¡ ì¤ì ì ë ¬ */
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
                /* ì¤ë¥¸ìª½ ì ë ¬ */
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
        .tab_move.selected{
        	background-color: white;
        	color:black;
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
				<ul>
					<li class="sidebar-item"><a class="tab_move" href="02_info.do">회원정보</a></li>
					<li class="sidebar-item"><a class="tab_move" href="09_Orderdetails1.do">주문내역</a></li>
					<li class="sidebar-item"><a class="tab_move" href="10_coupone.do">쿠폰함</a></li>
					<li class="sidebar-item"><a class="tab_move" href="08_Payment.do">띱머니충전</a></li>
					<li class="sidebar-item"><a class="tab_move" href="/">채팅</a></li>
					<li class="sidebar-item"><a class="tab_move" href="/">회원관리</a></li>
                </ul>
                </div>
            </div>
        </ul>
    </nav>
</body>
<script>
const sidebarItems = document.querySelectorAll('.sidebar-item');

//sidebar-item 클릭 시 색상 변경 함수
function activateItem(item) {
// 모든 sidebar-item 클래스에서 active 클래스를 제거합니다.
sidebarItems.forEach(function(item) {
  item.classList.remove('active');
});

// 클릭한 sidebar-item에 active 클래스를 추가합니다.
item.classList.add('active');
}

//sidebar-item과 a태그 클릭 이벤트 처리
sidebarItems.forEach(function(item) {
item.addEventListener('click', function(e) {
  e.preventDefault(); // a 태그의 기본 동작인 페이지 이동을 막습니다.
  const clickedItem = e.target.closest('.sidebar-item'); // 클릭한 태그의 가장 가까운 부모 sidebar-item을 찾습니다.
  activateItem(clickedItem); // sidebar-item 색상 변경 함수를 호출합니다.
  const href = clickedItem.querySelector('a').getAttribute('href'); // 클릭한 태그 내부의 a 태그의 href 속성을 가져옵니다.
  if (href) {
    setTimeout(() => {
      window.location.href = href; // 가져온 href 속성 값으로 페이지를 이동합니다.
    },); // 클릭 후 0.5초 후에 이동합니다.
  }
});
});

</script>
</html>