<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
    <!-- <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet"> -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="https://js.tosspayments.com/v1/payment-widget"></script>
    <script src="main.js"></script>
    <style>
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
<%@ include file="/side.jsp" %>
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