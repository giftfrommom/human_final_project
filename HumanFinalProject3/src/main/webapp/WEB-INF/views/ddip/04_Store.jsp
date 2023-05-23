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
	.containerBtn_04{
		text-align:center;
		margin-top:20px;
		margin-bottom:20px;
	}
	.card-1 {
	  width:85%;
	  box-shadow: 1px 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
	  transition: all 0.3s cubic-bezier(.25,.8,.25,1);
	}
	.review {
		padding:10px;
		margin-top:10px;
		margin-bottom:1px;
		margin-right:80px;
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
	/*수량버튼 */
	.count-wrap {position: relative;padding: 0 30px;border: 1px solid #ddd;overflow: hidden;width: 80px; height: 26px;}
	.count-wrap > button {border: 0;background: #ddd;color: #000;width: 25px;height: 25px;position: absolute;top: 0;font-size: 17px;}
	.count-wrap > button.minus {left: 0; padding:0px}
	.count-wrap > button.plus {right: 0; padding:0px}
	.count-wrap .inp {border: 0;height: 23px;text-align: center;display: block;width: 100%;font-size: 10px;}
	
	.table_title,.table_content,.modal_table_content,.count-wrap{
		text-align:center;
	}
	.count-wrap{
		margin-left: 21px;
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
      height: 450px;

      background-color: rgb(255, 255, 255);
      border-radius: 10px;
      box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

      transform: translateX(-50%) translateY(-50%);
    }
    .modal_body_write {
      position: absolute;
      top: 50%;
      left: 50%;

      width: 400px;
      height: 200px;

      background-color: rgb(255, 255, 255);
      border-radius: 10px;
      box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

      transform: translateX(-50%) translateY(-50%);
    }
    .m_body_write{
      height: 70%;
      padding: 20px;
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
	.m_combo_write {
        border: none;
        outline: none;
    }
    .area_review_write{
    	width: 100%;
    	height: 90%;
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
                            <div id="hidden_store_id" class="store_id${storeInfo[0].store_id}" style="display:none"></div>          
							<div id="hidden_customer_id" class="customer_id${customer_id}" style="display:none;"></div>
                            <h1 class="fw-bolder mb-1 title">${storeInfo[0].store_name}</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">Posted on May 2023 by ddip</div>
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
								<a href="#" class="nav-link selected hover">메뉴</a>
							</div>
							<div class="bg-light">
								<div class="vr" style="height: 50px;"></div>  
							</div>
					  		<div class="bg-light me-auto ms-auto">
					  			<a href="#" class="nav-link hover">리뷰</a>
					  		</div>
						</div>
					</div>
					<hr class="hrline">
					
					<div class="container TabReview" style="display:none"> 
		                <div class="TabReviewdepth1" style="overflow:scroll; height:300px;width:570px;">
<!-- 							<div class="review card-1" > -->
<!-- 								<div class="hstack gap-3"> -->
<!-- 									<div class="me-auto"> -->
<!-- 										아이디 -->
<!-- 									</div> -->
<!-- 							  		<div> -->
<!-- 							  			<a href="#">수정</a> -->
<!-- 							  		</div> -->
<!-- 							  		<div> -->
<!-- 							  			<a href="#">삭제</a> -->
<!-- 							  		</div> -->
<!-- 								</div> -->
<!-- 								<div class="hstack gap-3"> -->
<!-- 									<div class="me-auto"> -->
<!-- 										맛★5 양★5 상태★5 -->
<!-- 									</div> -->
<!-- 							  		<div> -->
<!-- 							  			<a href="#">좋아요 1</a> -->
<!-- 							  		</div> -->
<!-- 								</div> -->
<!-- 								<div class="hstack gap-3"> -->
<!-- 									<div class="me-auto"> -->
<!-- 										너무 너무 맛있어요 맛돌이 -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div>			 -->
						</div>  
					</div>
					
					<div class="container TabMenu" style="display:block">
						<table class="table">
						  <thead>
						    <tr class="table_title">
						      <th scope="col"></th>
						      <th scope="col">이름</th>
						      <th scope="col">가격</th>
						      <th scope="col">수량</th>
						    </tr>
						  </thead>
						  <tbody>
						 <c:forEach items="${storeInfo}" var="storeInfo" varStatus="loop">
							  <input type="hidden" class="${storeInfo.menu_name}" value="${storeInfo.menu_id}"/>
							  <tr class="table_content">
							  <th scope="row">${loop.index + 1}</th>
							  <td id="${storeInfo.menu_id}"class="menuname ${storeInfo.menu_id} hover">${storeInfo.menu_name}</td>
							  <td>${storeInfo.menu_price}</td>
							  <td>
							  	<div class="count-wrap _count">
								    <button type="button" class="minus hover">-</button>
								    <input type="text" class="inp" value="0" />
								    <button type="button" class="plus hover">+</button>
								</div>				
							  </td>
							  </tr>
						  </c:forEach>				   
						  </tbody>
						</table>
					</div>    	  	               
                </div> 
            </div>
        </div>
        
		<!-- Modal Order Table-->		
		<div class="modal" id="modal_04">
		  <div class="modal_body">
		    <div class="m_head">
		      <div class="modal_title">메뉴 확인</div>
		      <div class="close_btn" id="close_btn">X</div>
		    </div>
		    <div class="m_body">
		           아래 메뉴를 선택하고 띱 방을 개설하시겠습니까?
		      	<div class="container ModalMenu">
						<table class="table">
						  <thead>
						    <tr class="table_title">
						      <th scope="col"></th>
						      <th scope="col">이름</th>
						      <th scope="col">가격</th>
						      <th scope="col">수량</th>
						    </tr>
						  </thead>					  
						  <tbody class="table_tbody">
<!-- 							  <tr class="modal_table_content"> -->
<!-- 								  <th scope="row">1</th> -->
<!-- 								  <td class="modal_menuname">치킨</td> -->
<!-- 								  <td class="modal_menuprice">18000</td> -->
<!-- 								  <td class="modal_quantity">1</td> -->
<!--  							  </tr>							  			     -->
						  </tbody>
						</table>
					</div> 
<!-- 					<div> -->
<!-- 					쿠폰사용 :  <select id="m_combo1" class="m_combo"> -->
<!-- 								      <option value="none" selected>사용 가능 쿠폰</option> -->
<!-- 								      <option value="chicken">1000원 할인 쿠폰</option> -->
<!-- 								      <option value="pizza">2000원 할인 쿠폰</option> -->
<!-- 								      <option value="snack">3000원 할인 쿠폰</option> -->
<!-- 								    </select> -->
<!-- 					</div> -->
<!-- 					<div> -->
<!-- 					띱 할인 : 	 -->
<!-- 					</div> -->
		      	최종 가격 : <span class="menuSum"></span> ₩
		    </div>
		    <div class="m_footer">
		      <div class="hover modal_btn cancle" id="close_btn">취소</div>
		      <div class="hover modal_btn save" id="save_btn_04">확인</div>
		    </div>
		  </div>
		</div>
		
	<!-- Modal Review Write-->
	<div class="modal" id="modal_04_write">
		<div class="modal_body_write">
			<div class="m_head">
				<div class="modal_title">리뷰 작성</div>
				<div class="close_btn" ="close_btn">X</div>
			</div>
			<div class="m_body_write">
				<div class="container ModalMenu"></div>
				<span>
					맛 : &nbsp;<select class="m_combo_write">
					   <option value="none" selected>별점</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</span>
				<span>
					상태 : &nbsp;<select class="m_combo_write">
					   <option value="none" selected>별점</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</span>
				<span>
					양 : &nbsp;<select class="m_combo_write">
					   <option value="none" selected>별점</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</span>
				<div>
					리뷰
					<div> 
						<textArea class="area_review_write"></textArea>
					</div>
				</div>
			</div>
			<div class="m_footer">
				<div class="hover modal_btn cancle close_btn" >취소</div>
				<div class="hover modal_btn save" id="save_btn_04_write">확인</div>
			</div>
		</div>
	</div>

	<!-- 메뉴 리스트 전달 히든 폼 -->
		<form id="menuForm" method="post" action="/store/05_DdipWrite">
			<input type="hidden" name="menuList" id="menuList"/>
			<input type="hidden" name="store_id" id="store_id" value="${storeInfo[0].store_id}"/>
			<input type="hidden" name="menuSum" id="menuSum"/>
		</form>
	
        <div class="containerBtn_04" >
			<a id="modal_btn_04" class="btn ddip" href="#">띱 버튼</a>
			<a class="btn preview" href='03_StoreList.do'>이전 버튼</a>
		</div>
        <!-- Footer-->
        <footer class="py-5 bg-dark fixed-footer">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>

    </body>
</html>
