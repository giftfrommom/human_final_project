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
   		width:100%;
   		height: 110px;
   	}
	
	.card-3 {
	  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
	  display: flex;
		justify-content: center;
        align-items: center;
	}
	.imagecontainer{
		width: 100%;
 		height: 210px; 
		display: flex;
		justify-content: center;
        align-items: center;
	}
	.imagecontainer .card-img-top{
		width:90%;
		height:90%;
	}
	.progress{ 
    	width: 90%; 
    } 
   .countdownContainer {
      margin-top:10px;
	  background-color: gray;
	  border-radius: 5px;
	  display: inline-block;
	  padding: 2px 5px;
	  width: fit-content;
	}
	
	.countdown {
		color: white;
		font-size: 9px;
	}
	.address{
	  font-size: 14px;
	} 
	
	.fixed-footer {
        position: fixed;
        bottom: 0;
        width: 100%;
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
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                   <c:forEach items="${ddipList}" var="ddip">
                    <div class="col mb-5">
                       <a href='../store/07_Ddip.do?ddip_id=${ddip.ddip_id }'>
                        <div class="card h-100 card-3">
                         	<!-- Sale badge-->
                            <!-- Product image-->
                            <div class="imagecontainer">
                            	<img class="card-img-top" src="../resources/upload/${ddip.ddip_picture_enname}${ddip.fileExtension}" alt="..." />
                            </div>       
                            <!-- Product details-->
                            <div class="countdownContainer"><div class="countdown" data-deadline="${ddip.ddip_deadline}"></div></div>
                            
                            <div class="card-body">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <div class="title fw-bolder">${ddip.store_name}</div>                       							
                                    <div class="address">${ddip.ddip_pickupplace}</div>                       							
                                </div>
								<div class="progress position-absolute" style="bottom:5px;left: 11px;">
									<div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: ${ddip.ddip_currentcnt/ddip.ddip_totalcnt*100}%;
									 background-color: #0AC290;" aria-valuenow="${ddip.ddip_currentcnt/ddip.ddip_totalcnt*100}" aria-valuemin="0" aria-valuemax="100">
									 ${ddip.ddip_currentcnt}/${ddip.ddip_totalcnt}</div>
								</div>
                            </div>          
                        </div>   
                        </a>                
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
        
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
