<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인</title>
    <!-- ajax -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="../resources/js/scripts_junsang.js"></script>
	
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <style>
	    @font-face {
		    font-family: 'gwangyangbold';
		    src: url('../resources/fonts/GwangyangSunshineBold.ttf') format('truetype');
		}
		@font-face {
		    font-family: 'gwangyangregular';
		    src: url('../resources/fonts/GwangyangSunshineRegular.ttf') format('truetype');
		}
		.navbar_detail,.nav-link{
			font-family: 'gwangyangbold'; 	
		}
		*{ 
			font-family: 'gwangyangregular'; 
		} 
	
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
            right: 300px;
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
            background: #222;
            position: fixed;
            top: 0;
            right: -300px;
            z-index: 1;
            transition: all .35s;
        }

        input[id="menuicon"]:checked+label+div {
            right: 0;
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
            
        }

        .navbar__menu li {
            padding: 8px 13px;
            text-align: center;
            color: black;
        }

        .navbar__menu :hover {
            color: #0AC290;
        }

        .navbar__icons li {
            padding: 10px;
        }

        .navbar__toggleBtn {
            display: none;
        }

        .sidebar-item:hover {
            color: aqua;
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
                color: black;
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
        .navbar_detail.selected{
		  color: #0AC290;
		  background-color: white;
		  border-color: white;
		}
		li.selected{
 		  border-bottom: 1px solid #0AC290;
		}
		.beforeLogin, .afterLogin{
			font-size:13.3px;
		}
    </style>
</head>

<body>
    <nav class="navbar">
        <div class="navbar__logo">
	        <a href="../mypage/01_Main.do">
	            <img src="../resources/img/ddiplogo2.png" style="width: 70px" height="70px">
	         </a>
        </div>
        <ul class="navbar__menu" style="padding-left: 300px; margin-top: 13px;">
            <li><a id="StoreList" class="navbar_detail" href="../store/03_StoreList.do">가게리스트</a></li>
            <li><a id="DdipList" class="navbar_detail" href="../store/06_DdipList.do">띱리스트</a></li>
            <li><a id="" class="navbar_detail" href="">커뮤니티</a></li>
            <li><a id="" class="navbar_detail" href="../center/Userservice.do">고객센터</a></li>
        </ul>
        <ul class="navbar__icons" style="padding-left: 150px; margin-top: 13px">
            <li class="beforeLogin" style="cursor: pointer; color: black;"><a href='../member/13_Login.do' style="color:black;">로그인</a></li>
            <li class="beforeLogin" style="cursor: pointer; color: black;"><a href='../member/14_join.do' style="color:black;">회원가입</a></li>
            <li class="afterLogin holdingMoney" style="color: black; display : none;" style="color:black;">보유 띱머니:${myMoney} </li>
            <li class="afterLogin logout" style="cursor: pointer; color: black; display : none;"><a href='../member/logout.do' style="color:black;">로그아웃</a></li>
            <input type="checkbox" id="menuicon">
            <label for="menuicon" style="margin-left: 35px;">
                <span style="background-color: black;"></span>
                <span style="background-color: black;"></span>
                <span style="background-color: black;"></span>
            </label>
            <div class="sidebar">
                <div class="sidebar-header">
                    <h3 class="sidebar-title" style="margin-left: 20px;">띱</h3>
                    <div style="border: 1px solid white;"></div>
                </div>
                <div class="sidebar-body" style="margin-top: 30px;">
                    <a href='../mypage/02_info.do'><li class="sidebar-item" style="cursor: pointer; color: white;">회원정보</li></a>
                    <a href='../mypage/09_Orderdetails1.do'><li class="sidebar-item" style="cursor: pointer; color: white;">주문내역</li></a>
                    <a href='../mypage/10_coupone.do'><li class="sidebar-item" style="cursor: pointer; color: white;">쿠폰함</li></a>
                    <a href='../mypage/08_Payment.do'><li class="sidebar-item" style="cursor: pointer; color: white;">띱머니충전</li></a>
<!--                     <a href="Chat.html"><li class="sidebar-item" style="cursor: pointer; color: white;">채팅</li></a> -->
                    <a href='../mypage/11_management2.do'><li class="sidebar-item" style="cursor: pointer; color: white;">회원관리</li></a>
                </div>
            </div>
        </ul>
    </nav>
    <hr style="margin: 0px;">
    <div id="frogue-container" class="position-right-bottom"
data-chatbot="cac7d81b-cacd-46ab-a064-c1d835b5238a"
data-service-type=""
data-user="사용자ID"
data-init-key="value"
data-close-use="Y" data-close-bgcolor="#ffffff" data-close-linecolor="#000000"
data-move-use="Y" data-move-bgcolor="#ffffff" data-move-linecolor="#000000"
></div>
<!-- data-init-식별키=값 으로 셋팅하면 챗플로우에 파라미터와 연동가능. 식별키는 소문자만 가능 -->
<!-- data 속성 매뉴얼 https://doc.danbee.ai/channel_frogu.html -->
<script>
(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "https://frogue.danbee.ai/js/embed/v20220906/frogue-embed.min.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'frogue-embed'));
</script>
</body>
<script>
    const toggleBtn = document.querySelector(".navbar__toggleBtn");
    const menu = document.querySelector(".navbar__menu");
    const icons = document.querySelector(".navbar__icons");
    
//  0504추가
    let url = location.href;
	let word = url.substring( url.indexOf("_")+1 ,url.indexOf(".") );
	$('#'+word).addClass('selected');
	$('#'+word).parent('li').addClass('selected');
</script>

</html>