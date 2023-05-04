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
    <title> 가게 게시물 페이지</title>
    <!-- ajax -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
	<script src="/resources/js/scripts_junsang.js"></script>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/styles.css" rel="stylesheet" />
    <!-- 카카오맵 api -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4373ab24c40cd64e624852567a5db0a&libraries=services"></script>
	
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
	.table td{
		font-family: 'gwangyangbold';
	}
	.left{
		margin-top: 100px;
	}
	.title{
		font-family: 'gwangyangbold';		
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
	.containerBtn{
		text-align:center;
		margin-top:20px;
		margin-bottom:20px;
	}
	.card-1 {
	  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
	  transition: all 0.3s cubic-bezier(.25,.8,.25,1);
	}
	.review {
		padding:10px;
		margin-top:10px;
		margin-bottom:10px;
	}	
	.menupiccontainer{
		width: 700px;
		height: 400px;	
		text-align:center;
	}	
	.menupic{
		height:100%;
		width:auto;
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
	
	.TabMenuReview{
		font-family: 'gwangyangbold';
		font-size:20px;
	}
	#carouselExampleControls{
		text-align:center;
		width:400px;
		height:400px;
	}
	.menuname:hover{
		color: #0AC290;
	}
</style>	 
</head>		 
    <body>    
    <%@ include file="/header.jsp" %>  
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">           
                <div class="col-lg-7">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <div id="hidden_store_id" class="${storeInfo[0].store_id}" style="display:none"></div>
                            <h1 class="fw-bolder mb-1 title">${storeInfo[0].store_name}</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">Posted on January 1, 2023 by Start Bootstrap</div>
                          
                        </header>
                        <!-- Preview image figure-->
                        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
						  <div class="carousel-inner">
						  <c:forEach items="${storeInfo}" var="storeInfo">
						    <div class="carousel-item active ${storeInfo.menu_id}">
						      <img src="../resources/img/${storeInfo.menu_name}.png" class="d-block w-100" alt="...">
						    </div>
						  </c:forEach>						   
						  </div>
						</div>                        
                    </article>
                </div>              
                              
                <!-- Side widgets-->                         
                <div class="col-lg-5 left">
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
					<hr class="hrline">      
					<div class="container TabMenu" style="display:block">
						<table class="table">
						  <thead>
						    <tr>
						      <th scope="col"></th>
						      <th scope="col">이름</th>
						      <th scope="col">가격</th>
						      <th scope="col">수량</th>
						    </tr>
						  </thead>
						  <tbody>
						  <c:forEach items="${storeInfo}" var="storeInfo">
							  <tr>
							  <th scope="row">${storeInfo.menu_id}</th>
							  <td id="${storeInfo.menu_id}"class="menuname ${storeInfo.menu_id}">${storeInfo.menu_name}</td>
							  <td>${storeInfo.menu_price}</td>
							  <td>수량</td>
							  </tr>
						  </c:forEach>				   
						  </tbody>
						</table>
					</div>             
					<!-- style="display:none" -->
	                <div class="container TabReview" style="display:none"> 
		                <div style="overflow:auto; width:500px; height:445px;">
							<div class="review card-1">
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
					</div>          	               
                </div> 
            </div>
        </div>
        
        
       <!-- Modal -->
		<button id="testBtn" class="btn">모달 테스트</button>
	  <!-- 회원가입 확인 Modal-->
		<div class="modal fade show" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">모달테스트</h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">X</span>
						</button>
					</div>
					<div class="modal-body">내용 입력 !!</div>
					<div class="modal-footer">
						<a class="btn" id="modalY" href="#">예</a>
						<button class="btn" type="button" data-dismiss="modal">아니요</button>
					</div>
				</div>
			</div>
		</div>

        
        <div class="containerBtn" >
			<a class="btn mt-auto ddip" href="#" data-bs-toggle="modal" data-bs-target="#modal1">띱 버튼</a>
			<a class="btn mt-auto preview" href="#">이전 버튼</a>
		</div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
<!--         Bootstrap core JS -->
<!--         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> -->
<!--         Core theme JS -->
<!--         <script src="js/scripts.js"></script> -->
	<!-- 카카오 맵api -->
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('대전광역시 유성구 신성로 75-1', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
// 	        var infowindow = new kakao.maps.InfoWindow({
// 	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
// 	        });
// 	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});   
	
	</script>
    </body>
</html>
