<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>공구 게시물 작성 페이지</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/styles.css" rel="stylesheet" />
    <!-- 카카오맵 api -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4373ab24c40cd64e624852567a5db0a&libraries=services"></script>
	
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
		margin-bottom:20px;
	}
	.card-3 {
	  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
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
                            <h1 class="fw-bolder mb-1 title">공구 게시물 작성 페이지</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">Posted on January 1, 2023 by Start Bootstrap</div>
                          
                        </header>
                        <!-- Preview image figure-->
                        <div id="map"class="img-fluid rounded" style="width:746px;height:331px;"></div>                        
                    </article>
                    <section class="mb-5 ">                      
                        <h2 class="fw-bolder mb-4 mt-5">띱! 이용 꿀띱!</h2>
                        <p class="fs-5 mb-4">1. 추천 장소를 띱 장소로 설정하면 띱 성공률이 높아요.</p>
                        <p class="fs-5 mb-4">2. 더 많은 띱 인원을 모아 띱 성공시에 할인 금액이 더 커요.</p>
                        <p class="fs-5 mb-4">3. 18시~20시 22시~23시와 같은 저녁,야식 시간에 성공률이 높아요.</p>
                        <p class="fs-5 mb-4">4. 구미가 당기는 음식 사진과 센스있는 멘트로 띱 성공률을 높이세요.</p>
                    </section>
                </div>
                             
                <!-- Side widgets-->              
                <div class="col-lg-5 left">
                    <!-- Search widget-->
                    <div class="card mb-4 card-3">
                        <div class="card-header title">장소</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="지도를 클릭해 배달 위치를 설정하세요."/>                          
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4 card-3">
                        <div class="card-header title">인원수</div>
                        <div class="card-body">
                            <div class="input-group">
                                <select class="form-select" aria-label="Default select example">
								  <option selected>띱 인원을 선택하세요</option>
								  <option value="3">3</option>
								  <option value="4">4</option>
								  <option value="5">5</option>
								</select>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4 card-3">
                        <div class="card-header title">시간</div>
                        <div class="card-body">
                            <div class="input-group">
                               	수령 시간 &nbsp;<input type="time" value="xxx" min="yyy" max="zzz">&nbsp;&nbsp;&nbsp;&nbsp; 마감 시간 &nbsp;<input type="time" value="xxx" min="yyy" max="zzz">
                            </div>
                        </div>
                    </div>                  
                    <div class="card mb-4 card-3">
                        <div class="card-header title">첨부 파일</div>
                        <div class="card-body">
                            <div class="mb-3">
							  <label for="formFile" class="form-label"></label>
							  <input class="form-control" type="file" id="formFile">
							</div>
                        </div>
                    </div>
                    <div class="card mb-4 card-3">
                        <div class="card-header title">메시지</div>
                        <div class="card-body">
							<textarea class="form-control" placeholder="띱 게시물에 표시할 내용을 입력하세요." style="height: 100px"></textarea>					
                        </div>
                    </div>
                    
                </div>             	               
            </div>
        </div>
        <div class="containerBtn" >
			<a class="btn mt-auto" href="#">띱 버튼</a>
			<a class="btn mt-auto" href="#">이전 버튼</a>
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
