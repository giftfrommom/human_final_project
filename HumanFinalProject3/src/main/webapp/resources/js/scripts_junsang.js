$(function() {
	
	// header.jsp
	$(document).ready(function() {
		
		$.ajax({
			  url: "/store/get_session_id",
			  type : "post",
			  datatype : "json",
			  success: function(sessionMap) {			  
			    
				  var customer_id = sessionMap.customer_id;
				  if(customer_id != null){
					  $('.beforeLogin').hide();			
					  $('.afterLogin').show();	
				  } else {
					  $('.beforeLogin').show();			
					  $('.afterLogin').hide();	
				  }
				  
				  
			  },
			  error: function(xhr, status, error) {
				alert("AJAX Error:", error);
			  }
			});
		
	});
	
	// 06_DdipList 시간
	$(document).ready(function() {
		  // .countdown 요소에 대해 각각 처리
		  $('.countdown').each(function() {
		    var countdownElement = $(this);
		    var deadlineString = countdownElement.data('deadline'); // 예시: "오후 3:24"

		    // 시간과 분을 추출
		    var timeParts = deadlineString.split(" ")[1].split(":");
		    var hours = parseInt(timeParts[0]);
		    var minutes = parseInt(timeParts[1]);

		    // 오후인 경우 시간에 12를 더해줌
		    if (deadlineString.includes("오후") && hours < 12) {
		      hours += 12;
		    }

		    // 데드라인 시간을 설정
		    var deadlineDate = new Date();
		    deadlineDate.setHours(hours, minutes, 0, 0);

		    // 남은 시간 계산 및 업데이트
		    function updateCountdown() {
		      var currentTime = new Date();
		      var remainingTime = deadlineDate - currentTime;

		      if (remainingTime <= 0) { // 시간이 마감되었을 경우
		        countdownElement.text("마감되었습니다.");
		        return;
		      }

		      // 남은 시간을 시간, 분, 초로 변환
		      var hours = Math.floor(remainingTime / (1000 * 60 * 60));
		      var minutes = Math.floor((remainingTime % (1000 * 60 * 60)) / (1000 * 60));
		      var seconds = Math.floor((remainingTime % (1000 * 60)) / 1000);

		      // 시간, 분, 초를 2자리 숫자로 포맷팅
		      var formattedHours = padNumber(hours);
		      var formattedMinutes = padNumber(minutes);
		      var formattedSeconds = padNumber(seconds);

		      // 남은 시간을 문자열로 포맷팅
		      var countdownText = formattedHours + "시간 " + formattedMinutes + "분 " + formattedSeconds + "초";

		      countdownElement.text(countdownText);
		    }

		    function padNumber(number) {
		      return String(number).padStart(2, '0');
		    }

		    updateCountdown();
		    setInterval(updateCountdown, 1000); // 1초마다 업데이트
		  });
		});
	
	//03_StoreList.jsp ajax 메뉴 탭 이동
	$('.navbar__menu').on('click','.navbar_detail',function(){
		
		$(this).addClass('selected');
		$('.navbar_detail').not(this).removeClass('selected');
		
	})
	
	
	//03_StoreList.jsp ajax 메뉴 탭 이동
	$('.TabMenu').on('click','.nav-link',function(){
		
		$(this).addClass('selected');
		$('.nav-link').not(this).removeClass('selected');
		
		
		$.ajax( {
			url : "03_Tabmove",
			data : {"inputData":$(this).attr('id')},
			type : "post",
			datatype : "json",
			success : function(storeMap){ 
				var html="";
				$.each(storeMap, function(index, storeList) { 
					$.each(storeList, function(index, storeList) {
						var store_name = storeList.store_name;
						var store_type = storeList.store_type;
						var store_id = storeList.store_id;
						var average_rating = storeList.average_rating;
						
						  
						var htmlplus = 
							'<div class="col mb-5">'+
							'<div class="card h-100 card-3">'+               
							'<!-- Product image-->'+
							'<div class="imagecontainer">'+
							'<img class="card-img-top" src="../resources/img/'+store_type+'logo/'+store_name+'.png" alt="..." />'+
							'</div>'+   
							'<div class="card-body">'+
							'<div class="text-center">'+
							'<!-- Product name-->'+
							'<h5 class="fw-bolder">'+store_name+'</h5>'+						
							'</div>'+
							'<!-- Product reviews-->'+
							'<div class="star-ratings-container">'+
							'<div class="star-ratings">'+
							'<div class="star-ratings-fill space-x-2 text-lg" style=" width: '+average_rating/5.0*100.0+'% ">'+
							'<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>'+
							'</div>'+
							'<div class="star-ratings-base space-x-2 text-lg">'+
							'<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>'+
							'</div>'+
							'<span class="average_rating">('+average_rating+')</span>'+
							'</div>'+
							'</div>'+
							'</div>'+			
							'<!-- Product actions-->'+
							'<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'+
							'<div class="text-center">'+
							'<a class="btn btn-outline-dark mt-auto position-absolute start-50 translate-middle-x" style="bottom:1rem;" href="04_Store.do04_Store.do?store_id='+store_id+'">띱 버튼</a>'+
							'</div>'+
							'</div>'+
							'</div>'+               
							'</div>';
						html = html + htmlplus;
					});				
				});
				$('.storeListcontainer').empty();
				$('.storeListcontainer').append(html);	 			
			},
			error:function(request, status, error) {
		        alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    }			
		} );
		
		
	})		
			
	// 04_Store ajax탭 이동	
	$('.left').off().on('click','.nav-link',function(){
		
		var store_id = $('#hidden_store_id').attr('class').slice(-1);
		
		$(this).addClass('selected');
		$('.nav-link').not(this).removeClass('selected');
		
		// TabReview가 히든일때만 리뷰탭 가져오는 ajax실행
		if($('.TabReview').is(':hidden')){
			
		$.ajax( {
			
			url : "04_Tabmove",
			data : {"store_id":store_id},
			type : "post",
			datatype : "json",
			success : function(reviewMap){ 
			
				var html='<div class="reviewWrite" style="cursor:pointer;">리뷰쓰기</div>';
					
				$.each(reviewMap, function(index, reviewList) { 
					$.each(reviewList, function(index, reviewList) {
						var review_id = reviewList.review_id;
						var review_content = reviewList.review_content;
						var review_rating_taste = reviewList.review_rating_taste;
						var review_rating_amount = reviewList.review_rating_amount;
						var review_rating_state = reviewList.review_rating_state;
						var review_like = reviewList.review_like;
						var customer_name = reviewList.customer_name;
						var customer_id = reviewList.customer_id;
						
				var htmlplus = 					
					'        <div class="review card-1 review_id'+review_id+'" style=" width: 490px;">' +
					'            <div class="hstack gap-3">' +
					'                <div class="me-auto">'+customer_name+'</div>' +
					'                <div>' +
					'                    <div class="edit customer_id'+customer_id+'" style="cursor:pointer;">수정</div>' +
					'                </div>' +
					'                <div>' +
					'                    <div id=review_id'+review_id+' class="delete customer_id'+customer_id+'" style="cursor:pointer;">삭제</div>' +
					'                </div>' +
					'            </div>' +
					'            <div class="hstack gap-3">' +
					'                <div class="me-auto">' +
					'                    맛★'+review_rating_taste+' 양★'+review_rating_amount+' 상태★'+review_rating_state+'' +
					'                </div>' +
//					'                <div>' +
//					'                    <div class="review_like" style="cursor:pointer;">좋아요 '+review_like+'</div>' +
//					'                </div>' +
					'            </div>' +
					'            <div class="hstack gap-3">' +
					'                <div class="me-auto">' +
					'                    '+review_content+'' +
					'                </div>' +
					'            </div>' +
					'        </div>';
				
				
				html = html + htmlplus;
					});				
				});
				$('.TabReviewdepth1').append(html);
					$('.TabReview').show();			
					$('.TabMenu').hide();											
			},
			error:function(request, status, error) {
		        alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    }					
		} );
		
		} else{
			$('.TabReviewdepth1').empty();	
			$('.TabReview').hide();	
			$('.TabMenu').show();						
		}	
			
	})	
	
	//04_Store review edit
	$('.container').off().on('click', '.edit', function() {
		alert("수정");
	});
	
	//04_Stroe review write
	$('.TabReview').off().on('click', '.reviewWrite', function() {
		$('#modal_04_write').addClass('show');
	});
	//04_Stroe review write 확인 버튼
	$('#save_btn_04_write').off().click(function(){
		var stateRating = $(".m_combo_write:eq(0)").val();
	    var tasteRating = $(".m_combo_write:eq(1)").val();
	    var amountRating = $(".m_combo_write:eq(2)").val();
	    var store_id = $("#hidden_store_id").attr("class").split("store_id")[1];
	    var customer_id = $("#hidden_customer_id").attr("class").split("customer_id")[1];
	    var reviewText = $(".area_review_write").val();

	    var review = {
	    	"customer_id":customer_id,
	    	"store_id":store_id,
		    "review_rating_state": stateRating,
		    "review_rating_taste": tasteRating,
		    "review_rating_amount": amountRating,
		    "review_content": reviewText
	    };
		$.ajax({
			anyne:true,
			type:'POST',
			data: JSON.stringify(review),
			url: "/store/reviewWrite",
			datatype : "text",
			contentType:"application/json; charset=utf-8", //개애ㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐ중요
			success: function(customerMap) {
				$('#modal_04_write').removeClass('show');		
				Swal.fire({
					  title: '리뷰 작성',
					  text: "리뷰 작성 성공",
					  icon: 'success',
					  showCancelButton: true,
					  showConfirmButton: false,
					  cancelButtonColor: '#0AC290',
					  cancelButtonText: '확인'
				})		
			},
			error: function(xhr, status, error) {
			alert("AJAX Error:", error);
			}
			
		});
	})
	////04_Store.jsp모달창 닫기
	$('#modal_04_write').on('click', '.close_btn', function () {
	 
		$('#modal_04_write').removeClass('show');			

	});
	
	//04_Store review delete
	$('.TabReviewdepth1').off().on('click', '.review .delete', function() {
		var otherClass = $(this).attr('class').split(" ")[1];
		var customerId = $('#hidden_customer_id').attr('class');
		if (customerId !== otherClass){
			Swal.fire({
				  title: '삭제 오류',
				  text: "작성한 리뷰만 삭제할 수 있습니다.",
				  icon: 'warning',
				  showCancelButton: true,
				  showConfirmButton: false,
				  cancelButtonColor: '#0AC290',
				  cancelButtonText: '확인'
				})		
		} else {
			
			var review_id = $(this).attr('id').split('review_id')[1];
			var review = {
					"review_id":review_id
					};
			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify(review),
				url: "/store/reviewDelete",
//				datatype : "text",
				contentType:"application/json; charset=utf-8", 
				success: function() {
					
					  $('.review_id'+review_id).remove(); 
					  Swal.fire({
						  title: '리뷰 삭제',
						  text: "리뷰 삭제 성공",
						  icon: 'success',
						  showCancelButton: true,
						  showConfirmButton: false,
						  cancelButtonColor: '#0AC290',
						  cancelButtonText: '확인'
						})		
				},
				error: function(xhr, status, error) {
				alert("AJAX Error:", error);
				}
				
			});
			
		}

	});
	
	
	
	//04_Store 수량 옵션
	$('._count :button').off().on({'click' : function(){
	        
	        var $count = $(this).parent('._count').find('.inp');
	        var now = parseInt($count.val());
	        var min = 0;
	        var max = 999;
	        var num = now;
	        if($(this).hasClass('minus')){
	            var type = 'm';
	        }else{
	            var type = 'p';
	        }
	        if(type=='m'){
	            if(now>min){
	                num = now - 1;
	            }
	        }else{
	            if(now<max){
	                num = now + 1;
	            }
	        }
	        if(num != now){
	            $count.val(num);
	        }
	    }
	});
	

			
	//04_Store.jsp모달창 띄우기
	// click on 라벨 추가 모달 열기
	$('.containerBtn_04').off().on('click', '#modal_btn_04', function () {
	 
	  
		var orderInfo = new Map(); // 빈 맵 객체 생성
		var html = "";
		
		var menuId = 0;
		var sum=0;
		// 테이블의 각 행에 대해 반복문 실행
		$(".TabMenu .table_content").each(function(index) {
			
			var quantity = $(this).find('.inp').val(); // 수량 추출
			if(quantity!=0){
				
				menuId++; // 메뉴 ID
				var menuName = $(this).find(".menuname").text(); // 메뉴 이름 추출
				var menuPrice = $(this).find("td:nth-child(3)").text(); // 메뉴 가격 추출	  
			
				var htmlplus = '<tr class="modal_table_content">'+
                '<th scope="row" class="modal_menuid">'+menuId+'</th>'+
                '<td class="modal_menuname">'+menuName+'</td>'+
                '<td class="modal_menuprice">'+menuPrice+'</td>'+
                '<td class="modal_quantity">'+quantity+'</td>'+
                '</tr>';
				
				html = html + htmlplus;
				sum = sum +	menuPrice*quantity;
			}
					
		});
		
		if(html==""){
			Swal.fire({
				  title: '띱 오류',
				  text: "메뉴 수량을 입력해주세요.",
				  icon: 'warning',
				  showCancelButton: true,
				  showConfirmButton: false,
				  cancelButtonColor: '#0AC290',
				  cancelButtonText: '확인'
				})		
		}else{
			$('#modal_04').addClass('show');
			$('.table_tbody').empty();
			$('.table_tbody').append(html);
			$('.menuSum').text(sum);			
		}
		
	  
	});
	
	////04_Store.jsp모달창 닫기
	$('#modal_04').on('click', '#close_btn', function () {
	 
		$('#modal_04').removeClass('show');			


	});
	
	//04_Store.jsp 이미지 선택
	$('tbody').off().on('click','.menuname',function(){
		
		var id = $(this).attr("id");
		$('.'+id).addClass('active');
		$('.carousel-item').not($('.'+id)).removeClass('active');
		
	})
	
	//04_Store.jsp 모달 확인 버튼 클릭
	$('.m_footer').off().on('click','#save_btn_04',function(){
		
		var textValue = parseInt($(".afterLogin.holdingMoney").text().split(":")[1].trim());
		var menuSum = parseInt($('.menuSum').text().trim());
		$('#menuSum').val(menuSum);
		
		console.log("textValue : "+textValue);
		console.log("menuSum : "+menuSum);
		
		if(textValue>=menuSum){
					
			$.ajax({
				  url: "get_session_id",
				  type : "post",
				  datatype : "json",
				  success: function(sessionMap) {
					  
				    var customer_id = sessionMap.customer_id;
				    if(customer_id != null){
				    	
				    	var menuList = [];
						
						const currentDate = new Date();
						const kstOffset = 9 * 60; // KST는 UTC+9
						const kstDate = new Date(currentDate.getTime() + (kstOffset * 60 * 1000));	
						
						$('.modal_table_content').each(function(index){
							var menu = {
									"order_time":kstDate,
									"menu_id": $("." + $(this).find(".modal_menuname").text()).val(),
									"menu_name":$(this).find(".modal_menuname").text(),
									"menu_price":$(this).find(".modal_menuprice").text(),
									"menu_quantity":$(this).find(".modal_quantity").text()
							};
							menuList.push(menu);
						})
	
						
						$('#menuList').val(JSON.stringify(menuList));
						$("#menuForm").submit();
				    	
				    } else {
				    	
				    	$('#modal_04').removeClass('show');			
				    	
				    	Swal.fire({
						  title: '로그인 오류',
						  text: "로그인 후 이용해주세요.",
						  icon: 'warning',
						  showCancelButton: true,
						  showConfirmButton: false,
						  cancelButtonColor: '#0AC290',
						  cancelButtonText: '확인'
						})	
				    	
				    }
				    
				  },
				  error: function(xhr, status, error) {
					alert("AJAX Error:", error);
				  }
				});
		} else {
			$('#modal_04').removeClass('show');	
			Swal.fire({
			    title: '띱머니 부족',
			    text: "띱머니를 충전하시겠습니까?",
			    icon: 'warning',
			    showCancelButton: true,
			    confirmButtonColor: '#0AC290',
			    confirmButtonText: '확인',
			    cancelButtonColor: '#d33',
			    cancelButtonText: '취소',
			    showCloseButton: true,
			}).then((result) => {
			    if (result.isConfirmed) {
			 
			    	 location.href = "../mypage/08_Payment.do";
			    	
			    }
			});
		}
		
	
		
	})
	
	//04_Store2.jsp 모달 확인 버튼 클릭
	$('.m_footer2').off().on('click','#save_btn_04_2',function(){

		$.ajax({
			  url: "get_session_id",
			  type : "post",
			  datatype : "json",
			  success: function(sessionMap) {
				  
			    var customer_id = sessionMap.customer_id;
			    if(customer_id != null){
			    	
			    	var menuList = [];
					
					const currentDate = new Date();
					const kstOffset = 9 * 60; // KST는 UTC+9
					const kstDate = new Date(currentDate.getTime() + (kstOffset * 60 * 1000));	
					
					$('.modal_table_content').each(function(index){
						var menu = {
								"order_time":kstDate,
								"menu_id": $("." + $(this).find(".modal_menuname").text()).val(),
								"menu_name":$(this).find(".modal_menuname").text(),
								"menu_price":$(this).find(".modal_menuprice").text(),
								"menu_quantity":$(this).find(".modal_quantity").text()
						};
						menuList.push(menu);
					})

					
					$('#menuList2').val(JSON.stringify(menuList));
					$("#menuForm2").submit();
			    	
			    } else {
			    	
			    	$('#modal_04').removeClass('show');			
			    	
			    	Swal.fire({
					  title: '로그인 오류',
					  text: "로그인 후 이용해주세요.",
					  icon: 'warning',
					  showCancelButton: true,
					  showConfirmButton: false,
					  cancelButtonColor: '#0AC290',
					  cancelButtonText: '확인'
					})	
			    	
			    }
			    
			  },
			  error: function(xhr, status, error) {
				alert("AJAX Error:", error);
			  }
			});
	})
	
	//05_DdipWrite.jsp 시간 선택
	$('.input-group').on('change','#time_first',function(){
		// time_first의 값을 가져와서 Date 객체로 변환합니다.
	    var timeFirstValue = new Date('1970-01-01T' + $(this).val() + ':00');
	    
	    // time_first 값에 1시간을 더한 값을 time_second에 설정합니다.
	    var timeSecondValue = new Date(timeFirstValue.getTime() - 60 * 60 * 1000);
	    var timeSecondString = timeSecondValue.toTimeString().split(' ')[0];
	    $('#time_second').val(timeSecondString);
	})
	
	//05_DdipWrite.jsp 모달창 열기
	$('.containerBtn_05').off().on('click', '#modal_btn_05', function () {
		
		function convertTimeFormat(time) {
		
			var splitTime = time.split(":");
			var hour = splitTime[0];
			var minute = splitTime[1];

			var convertedHour = (hour > 12) ? hour - 12 : hour;			
			var ampm = (hour >= 12) ? "오후 " : "오전 ";
			
			return ampm + convertedHour + ":" + minute;
		}

		
		$('.ddipPlace').val($('.place').val());
		$('.ddippCnt').val($('.form-select').val());
		$('.ddippTime1').val(convertTimeFormat($('#time_first').val()));
		$('.ddippTime2').val(convertTimeFormat($('#time_second').val()));
		$('.ddip_picture').val($('#formFile').val().split('\\').pop());
		$('.ddippMessage').val($('.message').val());
		
		$('#modal_05').addClass('show');
	
	});
	
	//05_DdipWrite.jsp모달창 닫기
	$('#modal_05').on('click', '#close_btn', function () {
		
		$('#modal_05').removeClass('show');			


	});
	
	//05_DdipWrite.jsp 모달 확인 버튼 클릭
	$('.m_footer').on('click','#save_btn_05',function(){
		
		$('#modal_05').removeClass('show');	
		$('#ddip_pickuptime').val($('.ddippTime1').val());
		$('#ddip_deadline').val($('.ddippTime2').val());
		$("#ddipFormContent").submit();

		
	})
	
//	Swal.fire({
//		  title: '띱 성공',		 
//		  icon: 'success',
//		  showCancelButton: true,
//		  showConfirmButton: false,
//		  cancelButtonColor: '#0AC290',
//		  cancelButtonText: '확인'
//		})	
		
	
	//06_DdipList.jsp ajax 메뉴 탭 이동
	$('.TabMenu').on('click','.nav-link',function(){

		$(this).addClass('selected');
		$('.nav-link').not(this).removeClass('selected');
		
	});
	
	
	//11_management 옵션 선택
	$("#combo1").change(function() {
		
		  var selectedOption = $(this).val();
		  var combo2_options;

		  if (selectedOption === "chicken") {
		    combo2_options = '<option value="none" selected>선호가게</option>' +
		                    '<option value="교촌치킨">교촌치킨</option>' +
		                    '<option value="굽네치킨">굽네치킨</option>' +
		    				'<option value="네네치킨">네네치킨</option>';
		  } else if (selectedOption === "pizza") {
		    combo2_options = '<option value="none" selected>선호가게</option>' +
		                    '<option value="도미노피자">도미노피자</option>' +
						    '<option value="미스터피자">미스터피자</option>' +
						    '<option value="파파존스">파파존스</option>';
		  } else if (selectedOption === "snack") {
		    combo2_options = '<option value="none" selected>선호가게</option>' +
				            '<option value="엽기떡볶이">엽기떡볶이</option>' +
						    '<option value="죠스떡볶이">죠스떡볶이</option>' +
						    '<option value="청년다방">청년다방</option>';
		  } else {
		    combo2_options = '<option value="none" selected>선호가게</option>';
		  }

		  $("#combo2").html(combo2_options);
		});
	
	$("#m_combo1").change(function() {
		
		  var selectedOption = $(this).val();
		  var combo2_options;

		  if (selectedOption === "chicken") {
		    combo2_options = '<option value="none" selected>선호가게</option>' +
		                    '<option value="교촌치킨">교촌치킨</option>' +
		                    '<option value="굽네치킨">굽네치킨</option>' +
		    				'<option value="네네치킨">네네치킨</option>';
		  } else if (selectedOption === "pizza") {
		    combo2_options = '<option value="none" selected>선호가게</option>' +
		                    '<option value="도미노피자">도미노피자</option>' +
						    '<option value="미스터피자">미스터피자</option>' +
						    '<option value="파파존스">파파존스</option>';
		  } else if (selectedOption === "snack") {
		    combo2_options = '<option value="none" selected>선호가게</option>' +
				            '<option value="엽기떡볶이">엽기떡볶이</option>' +
						    '<option value="죠스떡볶이">죠스떡볶이</option>' +
						    '<option value="청년다방">청년다방</option>';
		  } else {
		    combo2_options = '<option value="none" selected>선호가게</option>';
		  }

		  $("#m_combo2").html(combo2_options);
		});
	
	//11_management.jsp 조회
	$('.btnContainer2').on('click','.read',function(){
		
		var combo1_options = $('#combo1').val();
		var combo2_options = $('#combo2').val();
		var gender = $('.genderSpan input[type="radio"]:checked').attr('id');
		var startDate = $("#start_date").val();
		var endDate = $("#end_date").val();
		var categoryName = $('#category').val();
		var search = $('#search').val();
			
		var condition = {
			"combo1_options":combo1_options, // none
			"combo2_options":combo2_options, // none
			"gender":gender,
			"startDate":startDate, // null?
			"endDate":endDate, // null?
			"categoryName":categoryName, // none
			"search":search //null?
		}
		
		$.ajax({
			anyne:true,
			type:'POST',
			data: JSON.stringify(condition),
			url: "/store/get_list",
			datatype : "text",
			contentType:"application/json; charset=utf-8", //개애ㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐ중요
			success: function(customerMap) {

				var html = "";
				var i=0;
				
				$.each(customerMap, function(index,customerList){
					$.each(customerList, function(index,customerList){
						
						var customer_birthday = customerList.customer_BIRTHDAY.split(" ")[0];
						var customer_gender = customerList.customer_GENDER;
						var customer_id = customerList.customer_ID;
						var customer_name = customerList.customer_NAME;
						var customer_prefermenu = customerList.customer_PREFERMENU;
						if(customer_prefermenu ==="chicken"){
							customer_prefermenu="치킨";
						} else if(customer_prefermenu ==="snack"){
							customer_prefermenu="분식";	
						} else {
							customer_prefermenu="피자";								
						}
						var customer_preferstore = customerList.customer_PREFERSTORE;
						
						var htmlplus =
						'<div class="row">' +
						    '<div class="select">' +
						        '<div class="form-check">' +
						            '<input class="form-check-input" type="checkbox" >' +
						        '</div>' +
						    '</div>' +
						    '<div class="cell num">' + (i+1) + '</div>' +
						    '<div class="cell customerId">'+customer_id+'</div>' +
						    '<div class="cell name">' + customer_name + '</div>' +
						    '<div class="cell gender">' + customer_gender + '</div>' +
						    '<div class="cell preferFood">' + customer_prefermenu + '</div>' +
						    '<div class="cell preferStore">' + customer_preferstore + '</div>' +
						    '<div class="cell birth">' + customer_birthday + '</div>' +
						'</div>';
						i++;
						html = html + htmlplus;
					})
				})  
				
				$('.top').nextAll().remove();
				$('.top').after(html);
			},
			error: function(xhr, status, error) {
			alert("AJAX Error:", error);
			}
			
		});
		
	})
	
	// checked부여
	$('.form-check-input').on('change', function() {
		alert("click");
	  if ($(this).is(':checked')) {
		  alert("checked1");
	    $(this).prop('checked', true);
	  } else {
		  alert("checked2");
	    $(this).prop('checked', false);
	  }
	});
	
	//11_management 삭제
	$('.btnContainer2').on('click','.delete',function(){
		var customerIdAry = [];
		
		$('input.form-check-input:checked').each(function() {
			  var customerId = $(this).closest('.select').siblings('.customerId').text();
			  customerIdAry.push(customerId);
		});
		
		$.ajax({
			anyne:true,
			type:'POST',
			data: JSON.stringify(customerIdAry),
			url: "/store/delete",
			datatype : "text",
			contentType:"application/json; charset=utf-8",
			success: function() {
				
				$('input.form-check-input:checked').each(function() {
					  $(this).closest('.row').remove();
				});
				
			},
			error: function(xhr, status, error) {
			alert("AJAX Error:", error);
			}
		})
		
	})
	
	//11_management수정/ 모달show
	$('.btnContainer2').on('click','.update',function(){
		
		var checkedTags = $('.form-check-input:checked');
		console.log("checkedTags: "+checkedTags.length);
		if(checkedTags.length>1){
			alert("수정은 하나씩 가능합니다.")
		}else if(checkedTags.length<1){
			alert("수정할 컬럼을 선택해주세요.")			
		}else{
			 var customerId = $('input.form-check-input:checked').closest('.select').siblings('.customerId').text();
			 var name = $('input.form-check-input:checked').closest('.select').siblings('.name').text();
			 var gender = $('input.form-check-input:checked').closest('.select').siblings('.gender').text();
			 var preferFood = $('input.form-check-input:checked').closest('.select').siblings('.preferFood').text();
			 var preferStore = $('input.form-check-input:checked').closest('.select').siblings('.preferStore').text();
			 var birth = $('input.form-check-input:checked').closest('.select').siblings('.birth').text();
			 $('#m_customer_id').val(customerId);
			 $('#m_customer_name').val(name);
//			 $('#m_customerid').val(customerId);
			 $('#m_combo1').val(preferFood);
			 $('#m_combo2').val(preferStore);
			 $('#birth_date').val(birth);
			 $('#modal_11').show();
		}
	})
	
	$('.m_footer').on('click','#save_btn_11',function(){
		
		var customer_id = $('#m_customer_id').val();
		var customer_name = $('#m_customer_name').val();
		var customer_gender = $('.m_gender input[type="radio"]:checked').attr('id');
		var customer_prefermenu = $('#m_combo1').val();
		var customer_preferstore = $('#m_combo2').val();
		var customer_birthday = $('#birth_date').val();
		
		var customervo = {
				"customer_id_j":customer_id,
				"customer_name_j":customer_name,
				"customer_gender_j":customer_gender,
				"customer_prefermenu_j":customer_prefermenu,
				"customer_preferstore_j":customer_preferstore,
				"customer_birthday_j":customer_birthday
		}
		
		$.ajax({
			anyne:true,
			type:'POST',
			data: JSON.stringify(customervo),
			url: "/store/update",
			datatype : "text",
			contentType:"application/json; charset=utf-8", //개애ㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐ중요
			success: function(data) {
							
				
			},
			error: function(xhr, status, error) {
			alert("AJAX Error:", error);
			}
		})

	})
	
	//11_management모달 hide
	$('#modal_11').on('click','.close',function(){
		$('#modal_11').hide();
	})
	
	
	
	//11_management 엑셀
	$('.excel').on('click', function () {
		
		// 테이블 데이터 추출
		var dataContainer = document.getElementById('dataContainer');
		var rows = dataContainer.getElementsByClassName('row');

		var data = [];

		// 각 행을 반복하며 데이터 추출
		for (var i = 0; i < rows.length; i++) {
		  var row = rows[i];
		  var cells = row.getElementsByClassName('cell');
		  var rowData = [];

		  // 각 셀을 반복하며 데이터 추출
		  for (var j = 0; j < cells.length; j++) {
		    var cell = cells[j];
		    var cellData = cell.innerText;
		    rowData.push(cellData);
		  }

		  data.push(rowData);
		}

		// 엑셀 워크북 생성
		var workbook = XLSX.utils.book_new();
		var worksheet = XLSX.utils.aoa_to_sheet(data);
		XLSX.utils.book_append_sheet(workbook, worksheet, 'Sheet1');

		// 엑셀 파일 다운로드
		var workbookOptions = {
		  bookType: 'xlsx',
		  bookSST: false,
		  type: 'binary',
		};

		var workbookData = XLSX.write(workbook, workbookOptions);

		function s2ab(s) {
		  var buf = new ArrayBuffer(s.length);
		  var view = new Uint8Array(buf);
		  for (var i = 0; i < s.length; i++) {
		    view[i] = s.charCodeAt(i) & 0xff;
		  }
		  return buf;
		}
		
	  var blob = new Blob([s2ab(workbookData)], { type: 'application/octet-stream' });
	  saveAs(blob, 'data.xlsx');
	});
	
});






