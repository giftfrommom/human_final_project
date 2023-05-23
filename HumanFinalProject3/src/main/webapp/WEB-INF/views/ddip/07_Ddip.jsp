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
	<!-- Moment.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
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
	.party1{	
		width: 900px;
		height: 200px;
		background-color: #60B0FF;
		text-align:center;
		align-items: center;
	}
	.party2{
		display: flex;
		justify-content: center;
		align-items: center;
		gap: 45px;		
		padding-top:47px;
	}
	.card-3 {
	  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
	}
	.file{
		height:200px;
	}
	.message{
		height:160px;		
	}
	.timebox{
		height:89px;		
	}
	.card-img-top{
		width:100%;
		height:100%;
	}
	.non_parti{
		transition: transform 1s ease; 
	}
	.hover:hover{
		transform: rotate(180deg);
		cursor:pointer;
	}
	#map{
		margin-top:15px;
		width:100%;
	}
</style>
</head>
    <body id="05_DdipWrite">    
    <%@ include file="/header.jsp" %>  
        <!-- Page content-->
        <div id="hidden_ddip_id" class="ddip_id${ddipvo.ddip_id}" style="display:none"></div>
      
        <div class="container mt-5">
            <div class="row">           
                <div class="col-lg-8">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->            
                            <h1 class="fw-bolder mb-1 title">${ddipvo.store_name}&nbsp;띱&nbsp;${ddipvo.ddip_totalcnt}명!</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2"> &nbsp;</div>
                          
                        </header>
<!--              DdipVO(ddip_id=1183, customer_id=1004, ddip_currentcnt=1, ddip_totalcnt=5, ddip_message=~~~~~~~~~~~~,  -->
<!--              ddip_pickupplace=경기 수원시 팔달구 우만동 603, ddip_store_type=chicken, ddip_deadline=오전 06:23,  -->
<!--              ddip_pickuptime=오전 07:23, store_id=1, store_name=교촌치킨, order_tbl_id=0, order_time=null, order_menu_name=null, order_menu_price=0,  -->
<!--              order_menu_quantity=0,ddip_picture_name=images.jpeg, ddip_picture_enname=52e56bd22c9444de8676d830549e3f1f, b_fsize=0,  -->
<!--              fileExtension=.jpeg, ddip_picture=null) -->
                   		
                    </article>     
					<div class="card mb-4 card-3">
						<div class="card-header title">장소</div>
						<div class="card-body">
							<div class="input-group">
								<input class="place form-control" name="ddip_pickupplace" type="text" placeholder="${ddipvo.ddip_pickupplace }" readonly/>                          
							</div>
							<div id="map"class="img-fluid rounded" style="width:822px;height:280px;"></div>                                                    
						</div>
					</div>  
                    <div class="card mb-4 card-3">
                        <div class="card-header title">띱 현황</div>
                        <div class="card-body">                      
	                         <div class="img-fluid rounded party1 card-3" >
		                  		<div class="party2">
<!-- 			                     	<img src="/resources/assets/참여.png" alt="..." />                 -->
<!-- 			                     	<img src="/resources/assets/참여.png" alt="..." /> -->
<!-- 				                  	<img src="/resources/assets/미참여.png" alt="..." />       -->
<!-- 				                  	<img src="/resources/assets/미참여.png" alt="..." />       -->
			                  	</div>                             
		                    </div>                                               
                        </div>
                    </div>        
                   
                </div>
                             
                <!-- Side widgets-->   
                <div class="col-lg-4 left">
                    <!-- Search widget-->
                <form id="ddipFormContent" method="post" action="../store/04_Store2" enctype="multipart/form-data">    
                
                <div class="card mb-4 card-3">
                        <div class="card-header title">메시지</div>
                        <div class="card-body message">
							<textarea class="form-control message" placeholder="${ddipvo.ddip_message}" style="height: 100px"></textarea>					
                        </div>
                    </div>    
                    <div class="card mb-4 card-3">
                        <div class="card-header title">첨부 파일</div>
                        <div class="card-body">
                            <div class="mb-3 file">
								<img class="card-img-top" src="../resources/upload/${ddipvo.ddip_picture_enname}${ddipvo.fileExtension}" alt="..." />
							</div>
                        </div>
                    </div>                  
                    <div class="card mb-4 card-3">
                        <div class="card-header title">시간</div>
                        <div class="card-body">
                            <div class="input-group timebox">
                            <div>
                               	띱 마감까지 남은 시간 : <span class="ddip_deadline"></span>
                             </div>          
                            </div>
                        </div>
                    </div>                  
                    
                  <input type="hidden" name="ddip_id" id="ddip_id" value="${ddipvo.ddip_id}"/> 			
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
        
<!--         <div class="containerBtn_07" > -->
<!-- 			<a id="modal_btn_07" class="btn ddip" href="#">띱 버튼</a> -->
<%-- 			<a class="btn preview" href='04_Store.do?id=${store_id}'>이전 버튼</a> --%>
<!-- 		</div> -->
		
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        
	<script src="/resources/js/scripts_07_junsang.js"></script>	
    </body>
</html>
