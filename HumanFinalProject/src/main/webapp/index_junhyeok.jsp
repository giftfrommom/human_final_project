<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <title>Home</title>
</head>
<body>
<h1>
   Hello world!
</h1>

<p> <a href='mypage/01_Main.do'>01_Main </a> </p>
<p> <a href='mypage/02_info.do'>02_info </a> </p>
<p> <a href='mypage/08_Payment.do'>08_Payment </a> </p>
<p> <a href='mypage/09_Orderdetails1.do'>09_Orderdetails1 </a> </p>
<p> <a href='mypage/10_coupon.do'>10_coupone </a> </p>

<p>
<h1>로그인</h1>
   <form action="mypage/01_Main.do" method="get">
      <input type="text" name="CUSTOMER_LOGINID" placeholder="입력해주세요">
      <input type="password" name="test3">
      <button>로그인</button>
   </form>

</p>

</body>
</html>