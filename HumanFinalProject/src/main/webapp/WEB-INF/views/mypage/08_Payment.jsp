<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>띱포인트충전</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
    <!-- <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet"> -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="https://js.tosspayments.com/v1/payment-widget"></script>
    <script src="main.js"></script>
    <style>
    
    
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
 		body {
			font-family: Arial, Helvetica, sans-serif;
			font-size: 16px;
			background-color: #f2f2f2;
		}
		h1 {
			text-align: center;
			margin-top: 50px;
			color: #333;
		}
		form {
			margin: 0 auto;
			width: 450px;
			background-color: #fff;
			padding: 20px;
			border-radius: 10px;
			box-shadow: 0 0 10px #ccc;
		}
		label {
			display: block;
			margin-bottom: 10px;
			color: #666;
		}
		input[type="number"] {
			width: 60%;
			padding: 10px;
			border: none;
			border-radius: 5px;
			box-shadow: 0 0 5px black;
			margin-bottom: 20px;
			font-size: 16px;
			color: #333;
		}
		button[type="button"] {
			background-color: #666;
			color: #fff;
			padding: 10px 20px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			margin-right: 26px;
			margin-bottom: 10px;
			font-size: 16px;
			transition: all 0.3s ease-in-out;
			width: 120px;
		}
		button[type="button"]:hover {
			background-color: #0AC290;
		}
		select {
			display: block;
			width: 100%;
			padding: 10px;
			border: none;
			border-radius: 5px;
			box-shadow: 0 0 5px #ccc;
			margin-bottom: 20px;
			font-size: 16px;
			color: #333;
		}

        #payment-button{ width:50%; padding:15px; background-color:#3065AC; color:white; border-radius:3px; font-size:16px; border:none; margin-top:10px; margin-left: 460px;}
	    .title {margin: 0 0 4px; font-size: 24px; font-weight: 600;color: #4e5968;}
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
					<a href="10_coupone.do" style="color: white"><li class="sidebar-item">쿠폰함</li></a>
					<a href="08_Payment.do"><li class="sidebar-item" style="cursor: pointer; background-color: white; color: black;"><strong>띱머니충전</strong></li></a>
					<a href="/" style="color: white"><li class="sidebar-item">채팅</li></a>
					<a href="/" style="color: white"><li class="sidebar-item">회원관리</li></a>
                </div>
            </div>
        </ul>
    </nav>
    
    <div class="charge" style="margin-left: 350px;">
        <h1>띱머니 충전</h1>
        <form action="결제 처리 페이지 URL" method="POST">
            <label for="chargeAmount">충전할 금액:</label>
            <input type="number" id="chargeAmount" name="chargeAmount" required>
            <button type="button" style="float: right; margin-right: 30px;" onclick="setChargeAmount('')">직접입력</button><br><br>
    
            <button type="button" onclick="setChargeAmount(10000)">1만원</button>
            <button type="button" onclick="setChargeAmount(20000)">2만원</button>
            <button type="button" onclick="setChargeAmount(30000)">3만원</button>
            <button type="button" onclick="setChargeAmount(50000)">5만원</button>
            <button type="button" onclick="setChargeAmount(100000)">10만원</button>
            <button type="button" onclick="setChargeAmount(500000)">50만원</button>
        </form>
	</form>
    </div>

    <!-- 결제 방법 영역-->
  <div id="payment-method" style="margin-left: 300px; margin-top: 50px;"></div> 
  <div id="agreement"></div> 
  <button id="payment-button">결제하기</button>
    
</body>

<script>
    const clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq' // 상점을 특정하는 키
    const customerKey = 'YbX2HuSlsC9uVJW6NMRMj' // 결제 고객을 특정하는 키
    const amount = 15_000; // 결제 금액
    const couponAmount = 5_000 // 할인 쿠폰 금액

  /*결제위젯 영역 렌더링*/
  const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제
  // const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS) // 비회원 결제
  paymentMethods = paymentWidget.renderPaymentMethods('#payment-method', amount)
  
  /*결제창 열기*/
  document.querySelector("#payment-button").addEventListener("click",()=>{
    paymentWidget.requestPayment({
      orderId: 'AD8aZDpbzXs4EQa-UkIX6',
      orderName: '토스 티셔츠',
      successUrl: 'http://localhost:8080/success',
      failUrl: 'http://localhost:8080/fail',
      customerEmail: 'customer123@gmail.com', 
      customerName: '김토스'
      }).catch(function (error) {
          if (error.code === 'USER_CANCEL') {
          // 결제 고객이 결제창을 닫았을 때 에러 처리
          } if (error.code === 'INVALID_CARD_COMPANY') {
            // 유효하지 않은 카드 코드에 대한 에러 처리
          }
      })  
  })

  /*할인 쿠폰 적용*/
  document.querySelector("#coupon").addEventListener("click", applyDiscount)
	
  function applyDiscount(e) {
    if (e.target.checked) {
      paymentMethods.updateAmount(amount - couponAmount, "쿠폰")
    } else {
      paymentMethods.updateAmount(amount)
    }
  }

  function setChargeAmount(amount) {
			document.getElementById("chargeAmount").value = amount;
		}

</script>

</html>