<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>04_Store</title>
	<!-- ajax -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.js"></script>
	<script src="/resources/js/scripts_junsang.js"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="/resources/css/styles.css" rel="stylesheet" />
	<style>
	@font-face {
	    font-family: 'gwangyangbold';
	    src: url('/resources/fonts/GwangyangSunshineBold.ttf') format('truetype');
	}
	@font-face {
	    font-family: 'gwangyangregular';
	    src: url('/resources/fonts/GwangyangSunshineRegular.ttf') format('truetype');
	}
 	*{ 
 		font-family: 'gwangyangbold'; 
 	} 
	.table td{
		font-family: 'gwangyangregular';
	}
	.container{
		margin: 0 auto;		
		width: 800px;
		text-align: center;
	}
	
	.carouselcontainer img {
	    display:block;
		width:100%;
		height:auto;
	}	
	
	
	.btn {
	  color: #60646A;
	  background-color: #DFDFDF;
	  border-color: #DFDFDF;
	}
	.btn:hover {
	  color: white;
	  background-color: #0AC290;
	  border-color: #0AC290;
	}
	.btn{
		width: 200px;
		height: 50px;
		text-align: center;
		font-size: 21px;
	}
	hr {
	  width: 775px; /* 수평선의 가로폭을 50%로 조정 */
	  margin: 0 auto; /* 가운데 정렬 */
	}
	
	.nav-link.selected{
	  color: #0AC290;
	  background-color: white;
	  border-color: white;
	}
	.nav-link {
	  color: black;
	  background-color: white;
	  border-color: white;
	}
	.nav-link:hover {
	  color: #0AC290;
	  background-color: white;
	  border-color: white;
	}
	.TabReview{
		width: 775px;
		
	}
	.imagecontainer{
		width: 600px;	
		 margin: 0 auto;
		text-align: center;
	}
	.imagecontainer img {
	    display:block;
		width:100%;
		height:auto;
	}	

	.review {
 	  border: solid 1.5px black; 
	  margin-top: 10px;
	  margin-bottom: 10px;
	  padding: 15px;
	  
	}
	
	
	</style>
</head>
<body>
<div class="container">
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner" >
	    <div class="carousel-item active" data-bs-interval="20000">
	      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTId-xjEr0g3glaO1LIwouSJDBSs9-2EXo3Mn3GCiy9fNpjokhIjKAXQ8-F50vkt9UG-c4&usqp=CAU" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item" data-bs-interval="20000">
	      <img src="https://www.mcdonalds.co.kr/upload/product/pcfile/1583727855319.png" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item" data-bs-interval="20000">
	      <img src="https://www.mcdonalds.co.kr/upload/product/pcfile/1583728352960.png" class="d-block w-100" alt="...">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
</div>

<div class="container TabMenuReview">
	<div class="hstack gap-3">
		<div class="bg-light me-auto ms-auto">
			<a href="#" class="nav-link selected">메뉴</a>
		</div>
		<div class="bg-light">
			<div class="vr" style="height: 50px;"></div>  
		</div>
  		<div class="bg-light me-auto ms-auto">
  			<a href="#" class="nav-link">리뷰</a>
  		</div>
	</div>
</div>
<hr>

<div class="container TabReview" >
	<div class="review">
		<div class="hstack gap-3">
			<div class="me-auto">
				아이디
			</div>
	  		<div>
	  			<a href="#">수정</a>
	  		</div>
	  		<div>
	  			<a href="#">삭제</a>
	  		</div>
		</div>
		<div class="hstack gap-3">
			<div class="me-auto">
				맛★5 양★5 상태★5
			</div>
	  		<div>
	  			<a href="#">좋아요 1</a>
	  		</div>
		</div>
		<div class="hstack gap-3">
			<div class="me-auto">
				너무 너무 맛있어요 맛돌이
			</div>
		</div>
		<div class="imagecontainer">
			<img src="https://static.hubzum.zumst.com/hubzum/2017/11/13/14/0f1816ea66a74b999b3ae10b0b11e1b8.jpg" class="d-block w-100" alt="...">		
		</div>
	</div>
	<div class="review">
		<div class="hstack gap-3">
			<div class="me-auto">
				아이디
			</div>
	  		<div>
	  			<a href="#">수정</a>
	  		</div>
	  		<div>
	  			<a href="#">삭제</a>
	  		</div>
		</div>
		<div class="hstack gap-3">
			<div class="me-auto">
				맛★5 양★5 상태★5
			</div>
	  		<div>
	  			<a href="#">좋아요 1</a>
	  		</div>
		</div>
		<div class="hstack gap-3">
			<div class="me-auto">
				너무 너무 맛있어요 맛돌이
			</div>
		</div>
	</div>
</div>

<!-- <div class="container TabMenu"> -->
<!-- 	<table class="table table-striped"> -->
<!-- 	  <thead> -->
<!-- 	    <tr> -->
<!-- 	      <th scope="col"></th> -->
<!-- 	      <th scope="col">이름</th> -->
<!-- 	      <th scope="col">가격</th> -->
<!-- 	      <th scope="col">수량</th> -->
<!-- 	    </tr> -->
<!-- 	  </thead> -->
<!-- 	  <tbody> -->
<!-- 	    <tr> -->
<!-- 	      <th scope="row">1</th> -->
<!-- 	      <td>후라이드치킨</td> -->
<!-- 	      <td>18000원</td> -->
<!-- 	      <td>수량</td> -->
<!-- 	    </tr> -->
<!-- 	    <tr> -->
<!-- 	      <th scope="row">2</th> -->
<!-- 	      <td>양념치킨</td> -->
<!-- 	      <td>19000원</td> -->
<!-- 	      <td>수량</td> -->
<!-- 	    </tr> -->
<!-- 	    <tr> -->
<!-- 	      <th scope="row">2</th> -->
<!-- 	      <td>간장치킨</td> -->
<!-- 	      <td>20000원</td> -->
<!-- 	      <td>수량</td> -->
<!-- 	    </tr> -->
<!-- 	  </tbody> -->
<!-- 	</table> -->
<!-- </div> -->

<div class="container" >
	<a class="btn mt-auto" href="#">띱 버튼</a>
	<a class="btn mt-auto" href="#">이전 버튼</a>
</div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>