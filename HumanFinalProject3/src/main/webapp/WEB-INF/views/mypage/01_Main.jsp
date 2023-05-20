<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인</title>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <style>
    
    .main-header {
  text-align: center;
}

.main-header img {
  max-width: 100%;
  height: auto;
}

    .main-content {
        background-color: #f5f5f5;
        padding: 50px 0;
        text-align: center;
    }

    .main-content h1 {
        font-size: 36px;
        margin-bottom: 20px;
    }

    .main-content p {
        font-size: 18px;
    }

    .btn-primary {
        display: inline-block;
        background-color: #008CBA;
        color: #fff;
        padding: 10px 20px;
        border-radius: 5px;
        text-decoration: none;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .btn-primary:hover {
        background-color: #005a87;
    }

    .features {
        padding: 50px 0;
        text-align: center;
    }

    .features h2 {
        font-size: 24px;
        margin-bottom: 20px;
    }

    .feature {
        margin-bottom: 30px;
    }

    .feature i {
        font-size: 48px;
        margin-bottom: 20px;
        color: #008CBA;
    }

    .feature h3 {
        font-size: 18px;
        margin-bottom: 10px;
    }

    .feature p {
        font-size: 14px;
        color: #555;
    }

    .footer {
        background-color: #222;
        color: #fff;
        padding: 20px 0;
        text-align: center;
    }

    .footer p {
        font-size: 14px;
        margin: 0;
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
            /* ê°ë¡ ì¤ì ì ë ¬ */
        }

        .navbar__menu li {
            padding: 8px 13px;
            text-align: center;
            /* ì¸ë¡ ì¤ì ì ë ¬ */
            color: black;
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
    </style>
</head>

<body>
<%@ include file="/header.jsp" %>

<section class="main-header">
        <img src="../resources/img/ddipheaderlogo122.png">
    </section>
    <section class="main-content">
        <div class="container">
            <img src="../resources/img/asdg.jpg">
            <div style="display: flex; justify-content: center; margin-bottom: 50px;">
                <a href="#features" class="btn-primary">바로가기</a>
            </div>
        </div>
    </section>   
    <footer class="footer">
        <div class="container">
            <p>&copy; 2023 Ddip. All rights reserved.</p>
        </div>
    </footer>
   
</body>
<script>
    const toggleBtn = document.querySelector(".navbar__toggleBtn");
    const menu = document.querySelector(".navbar__menu");
    const icons = document.querySelector(".navbar__icons");
</script>

</html>