<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- c:foreach -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>가게 리스트</title>
	<!-- ajax -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="../resources/js/scripts_junsang.js"></script>
	
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="/resources/css/styles.css" rel="stylesheet" />
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
	/* ajax탭 버튼 */
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
	
   	.card-img-top{
   	  height: 250px;
   	}
   	.card-body{
   	  height: 120px;
	  text-align: center;
	  padding-top:5px;
   	}
   
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    .b-example-divider {
      height: 3rem;
      background-color: rgba(0, 0, 0, .1);
      border: solid rgba(0, 0, 0, .15);
      border-width: 1px 0;
      box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
    }

    .b-example-vr {
      flex-shrink: 0;
      width: 1.5rem;
      height: 100vh;
    }

    .bi {
      vertical-align: -.125em;
      fill: currentColor;
    }

    .nav-scroller {
      position: relative;
      z-index: 2;
      height: 2.75rem;
      overflow-y: hidden;
    }

    .nav-scroller .nav {
      display: flex;
      flex-wrap: nowrap;
      padding-bottom: 1rem;
      margin-top: -1px;
      overflow-x: auto;
      text-align: center;
      white-space: nowrap;
      -webkit-overflow-scrolling: touch;
    }
    
    .outer {
	  border: 6px solid royalblue;
	  width: 300px;
	  height: 200px;
	  margin: 0 auto;
	  overflow-x: hidden;
	}

	.inner-list {
	  display: flex;
	  transition: .3s ease-out;
	  height: 100%;
	}

	.inner {
	  border: 6px solid olive;
	  padding: 0 16px;
	}
	
	.button-list {
	  text-align: center;
	}
	
	.card-3 {
	  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
	}
	.imagecontainer{
		width: 220px;
 		height: 150px; 
		display: flex; 
 		justify-content: center; 
        align-items: center; 
      text-align:center;
	}
	.imagecontainer .card-img-top{
		width:80%;
		height:auto;
	}
	.bi-star-fill{
		width:20px;
		height:20px;
	}
	/*별점 */
	.star-ratings {
	  color: #aaa9a9; 
	  position: relative;
	  unicode-bidi: bidi-override;
	  width: max-content;
	  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
	  -webkit-text-stroke-width: 1.3px;
	  -webkit-text-stroke-color: #2b2a29;
	}
	 
	.star-ratings-fill {
	  color: #fff58c;
	  padding: 0;
	  position: absolute;
	  z-index: 1;
	  display: flex;
	  top: 0;
	  left: 0;
	  overflow: hidden;
	  -webkit-text-fill-color: gold;
	}
	 
	.star-ratings-base {
	  z-index: 0;
	  padding: 0;
	}
	.star-ratings-container{
		display: flex;
		justify-content: center;
        align-items: center;
	}
	
	
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="container TabMenu">
    <header class="d-flex justify-content-center py-3">
      <ul class="nav nav-pills">
        <li class="nav-item"><a href="#" class="nav-link selected" id="all">전체</a></li>
        <li class="nav-item"><a href="#" class="nav-link" id="chicken">치킨</a></li>
        <li class="nav-item"><a href="#" class="nav-link" id="pizza">피자</a></li>
        <li class="nav-item"><a href="#" class="nav-link" id="hambuger">햄버거</a></li>
        <li class="nav-item"><a href="#" class="nav-link" id="snack">분식</a></li>
      </ul>
    </header>
</div>

<section>
	<div class="container px-lg-5">
		<div class="storeListcontainer row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach items="${storeList}" var="store">
				<div class="col mb-5">
					<div class="card h-100 card-3">                      
						<!-- Product image-->
						<div class="imagecontainer">
							<img class="card-img-top" src="../resources/img/${store.store_type}logo/${store.store_name}.png" alt="..." />
						</div>   
						<div class="card-body">
							
							<!-- Product name-->
							<h5 class="fw-bolder">${store.store_name}</h5>						
							
							<!-- Product reviews-->
							<div class="star-ratings-container">
								<div class="star-ratings">
									<!-- 별점  db에서 가져와야함 -->
									<div class="star-ratings-fill space-x-2 text-lg" style=" width: 0% ">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
									<div class="star-ratings-base space-x-2 text-lg">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
								</div>
							</div>
						</div>				
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto position-absolute start-50 translate-middle-x" style="bottom:2rem;" href="04_Store.do?store_id=${store.store_id}">띱 버튼</a>
							</div>
						</div>
					</div>                   
				</div>
			</c:forEach>
        </div>
    </div>
</section>
        
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container">
   		<p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p>
    </div>
</footer>  
    

</body>
</html>
