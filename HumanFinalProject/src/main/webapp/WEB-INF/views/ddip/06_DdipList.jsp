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
	<title>공구 리스트</title>
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
      
	}
	.imagecontainer .card-img-top{
		width:80%;
		height:80%;
	}
	.progress{ 
    	width: 210px; 
    } 
    .div-with-content-length {
	  display: inline-block;
	  font-size: 16px; /* 필요에 따라 폰트 크기를 조정하세요 */
	  line-height: 1.2; /* 필요에 따라 줄 간격을 조정하세요 */
/* 	  visibility: hidden; /* 요소를 화면에서 보이지 않도록 설정합니다 */ */
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
<p> <a href='05_DdipWrite.do'>05_DdipWrite </a> </p>
	<section>
            <div class="container px-lg-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                   <c:forEach items="${ddipList}" var="ddip">
                    <div class="col mb-5">
                        <div class="card h-100 card-3">
                         	<!-- Sale badge-->
                            <!-- Product image-->
                            <div class="imagecontainer">
                            	<img class="card-img-top" src="../resources/upload/${ddip.ddip_picture_enname}${ddip.fileExtension}" alt="..." />
                            </div>       
                            <!-- Product details-->
                            <div class="div-with-content-length "><div class="countdown" data-deadline="${ddip.ddip_deadline}"></div></div>
                            
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <div class="title fw-bolder">${ddip.store_name}</div>                       							
                                    <div class="title address">${ddip.ddip_pickupplace}</div>                       							
                                </div>
                            </div>          
							<div class="progress position-absolute" style="bottom: -1.5rem; left: 0.3rem">
								<div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: ${ddip.ddip_currentcnt/ddip.ddip_totalcnt*100}%;
								 background-color: #0AC290;" aria-valuenow="${ddip.ddip_currentcnt/ddip.ddip_totalcnt*100}" aria-valuemin="0" aria-valuemax="100">
								 ${ddip.ddip_currentcnt}/${ddip.ddip_totalcnt}</div>
							</div>
                        </div>                   
                    </div> 
                   </c:forEach>                 
                </div>
            </div>
        </section> 
        
        
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
