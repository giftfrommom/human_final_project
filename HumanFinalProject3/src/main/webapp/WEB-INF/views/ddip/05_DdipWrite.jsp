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
    <title>공구 게시물 작성 페이지</title>
    
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/styles.css" rel="stylesheet" />
    <!-- 카카오맵 api -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4373ab24c40cd64e624852567a5db0a&libraries=services"></script>
	<!-- swal -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style>
	@font-face {
	    font-family: 'gwangyangbold';
	    src: url('../resources/fonts/GwangyangSunshineBold.ttf') format('truetype');
	}
	@font-face {
	    font-family: 'gwangyangregular';
	    src: url('../resources/fonts/GwangyangSunshineRegular.ttf') format('truetype');
	}
	.navbar_detail,.nav-link,.bold{
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
	.containerBtn_05{
		text-align:center;
		margin-bottom:20px;
	}
	.card-3 {
	  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
	}
	.time{
		border:none;
	}
	
		/*모달*/
	.modal {
      position: absolute;
      top: 0;
      left: 0;

      width: 100%;
      height: 100%;

      display: none;

      background-color: rgba(0, 0, 0, 0.4);
    }

    .modal.show {
      display: block;
    }

    .modal_body {
      position: absolute;
      top: 50%;
      left: 50%;

      width: 600px;
      height: 400px;

      background-color: rgb(255, 255, 255);
      border-radius: 10px;
      box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

      transform: translateX(-50%) translateY(-50%);
      
     
    }
    .m_head{
      padding: 10px 20px;
      display: flex;
      justify-content: space-between;
      background-color:#e7e5e5;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
    }
    .m_body{
      height: 80%;
      padding: 20px;
      display: flex;
  	  align-items: center; /* 상하 중앙 정렬 */
    }
    .m_body_title{
    	font-size:16px;
    	text-align:center;
    }
    .m_footer{
      padding: 15px;
      background-color:#e7e5e5;
      border-bottom-left-radius: 10px;
      border-bottom-right-radius: 10px;
      display: flex;
      justify-content: end;
    }
    .modal_title{
      font-size: 18px;
      color: gray;
      font-weight: 500;
    }
    .close_btn{
      font-size: 20px;
      color: rgb(139, 139, 139);
      font-weight: 900;
      cursor: pointer;
    }
    .modal_label{
      padding-top: 10px;
    }
    .input_box{
      width: 100%;
      border: 1px solid rgb(189, 189, 189);
      height: 30px;
    }
    .modal_btn{
      width: 80px;
      height: 30px;
      border-radius: 5px;
      text-align: center;
      font-size: 14px;
      font-weight: bolder;
      padding-top: 5px;
      margin-left: 5px;
      font-family: sans-serif;
    }
    .cancle{
      background-color: white;
      color: black;
    }
    .save{
      background-color: #0AC290;
      color: white;
    }
		
	.hover:hover{
		cursor:pointer;
	}
	.ddipInfo{
		margin-bottom:10px;
	}
	
	table.type05 {
	  border-collapse: separate;
	  border-spacing: 1px;
	  text-align: left;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  margin: 20px 10px;
	}
	table.type05 th {
	  width: 150px;
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	  background: #efefef;
	}
	table.type05 td {
	  width: 390px;
	  padding: 10px;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	}
	.ddipFormContent{
		border: none;
 		outline: none;
 		padding:0px;
 		width:300px;
	}
	
</style>
</head>
    <body id="05_DdipWrite">    
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
                            <div id="hidden_store_id" class="store_id${store_id}" style="display:none"></div>
                            <h1 class="fw-bolder mb-1 title">공구 게시물 작성 페이지</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">Posted on January 1, 2023 by Start Bootstrap</div>
                          
                        </header>
                        <!-- map -->
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
                <form id="ddipFormContent" method="post" action="/store/05to06_DdipList" enctype="multipart/form-data">           
                    <div class="card mb-4 card-3">
                        <div class="card-header title">장소*</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input class="place form-control" name="ddip_pickupplace" type="text" placeholder="지도를 클릭해 배달 위치를 설정하세요." readonly/>                          
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4 card-3">
                        <div class="card-header title">인원수*</div>
                        <div class="card-body">
                            <div class="input-group">
                                <select name="ddip_totalcnt" class="form-select hover" aria-label="Default select example">
								  <option selected>띱 인원을 선택하세요</option>
								  <option value="3">3</option>
								  <option value="4">4</option>
								  <option value="5">5</option>
								</select>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4 card-3">
                        <div class="card-header title">시간*</div>
                        <div class="card-body">
                            <div class="input-group">
                               	수령 시간 &nbsp;<input id="time_first" class="time hover" type="time" value="xxx" />
                               	&nbsp;&nbsp;띱 마감 시간 &nbsp;<input id="time_second" class="time" type="time" value="xxx" readonly/>
                            </div>
                        </div>
                    </div>                  
                    <div class="card mb-4 card-3">
                        <div class="card-header title">첨부 파일</div>
                        <div class="card-body">
                            <div class="mb-3">
							  <label for="formFile" class="form-label"></label>
							  <input class="form-control" name="ddip_picture" type="file" id="formFile">
							</div>
                        </div>
                    </div>
                    <div class="card mb-4 card-3">
                        <div class="card-header title">메시지</div>
                        <div class="card-body">
							<textarea class="form-control message" name="ddip_message" placeholder="띱 게시물에 표시할 내용을 입력하세요." style="height: 100px"></textarea>					
                        </div>
                    </div>  
                  <input type="hidden" name="store_id" id="store_id" value="${store_id}"/> 
				  <input type="hidden" name="menuList" id="menuList" value='${menuList_JSON}'/>
				  <input type="hidden" name="ddip_pickuptime" id="ddip_pickuptime"/>
				  <input type="hidden" name="ddip_deadline" id="ddip_deadline"/>
				</form>            	               
                </div> 
            </div>
        </div>
        
        <!-- Modal -->	
        <div class="modal" id="modal_05">
		  <div class="modal_body">
		    <div class="m_head">
		      <div class="modal_title">아래 정보로 띱 방을 개설하시겠습니까?</div>
		      <div class="close_btn" id="close_btn">X</div>
		    </div>			  
		    <div class="m_body">	    
				  <table class="type05">
				    <tr>
				      <th scope="row">장소</th>
				      <td><input type="text" class="ddipFormContent ddipPlace" readonly></td>
				    </tr>
				    <tr>
				      <th scope="row">띱 인원</th>
				      <td><input type="text" class="ddipFormContent ddippCnt" readonly></td>
				    </tr>
				    <tr>
				      <th scope="row">주문 수령 시간</th>
				      <td><input type="text" class="ddipFormContent ddippTime1" readonly></td>
				    </tr>
				    <tr>
				      <th scope="row">띱 마감 시간</th>
				      <td><input type="text" class="ddipFormContent ddippTime2" readonly></td>
				    </tr>
				     <tr>
				      <th scope="row">띱 사진</th>
				      <td><input type="text" class="ddipFormContent ddip_picture" readonly></td>
				    </tr>
				    <tr>
				      <th scope="row">메시지</th>
				      <td><input type="text" class="ddippMessage" readonly></input></td>
				    </tr>
				  </table>		
				
		    </div>
		    <div class="m_footer">
		      <div class="hover modal_btn cancle" id="close_btn">취소</div>
		      <div class="hover modal_btn save" id="save_btn_05">확인</div>
		    </div>
		  </div>
		</div>
        
        <div class="containerBtn_05" >
			<a id="modal_btn_05" class="btn ddip" href="#">띱 버튼</a>
			<a class="btn preview" href='04_Store.do?id=${store_id}'>이전 버튼</a>
		</div>
		
		<!-- 메뉴 리스트 전달 히든 폼 -->
<!-- 		<form id="ddipForm" method="post" action="/store/06_DdipList"> -->
<%-- 			 --%>
<!-- 		</form> -->
		
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        
	<script src="/resources/js/scripts_05map_junsang.js"></script>
    </body>
</html>
