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
						//평점을 나타내는 변수
						var DBrating = 3.2;
						  
						//평점을 백분율 값으로 변환
						var DBratingToPercent = (DBrating / 5) * 100;
						  
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
							'<div class="star-ratings-fill space-x-2 text-lg" style=" width: '+DBratingToPercent+'% ">'+
							'<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>'+
							'</div>'+
							'<div class="star-ratings-base space-x-2 text-lg">'+
							'<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>'+
							'</div>'+
							'</div>'+
							'</div>'+
							'</div>'+			
							'<!-- Product actions-->'+
							'<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'+
							'<div class="text-center">'+
							'<a class="btn btn-outline-dark mt-auto position-absolute start-50 translate-middle-x" style="bottom:2rem;" href="04_Store.do04_Store.do?id='+store_id+'">띱 버튼</a>'+
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
	$('.TabMenuReview').off().on('click','.nav-link',function(){
		
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
			
				var html="";
					
				$.each(reviewMap, function(index, reviewList) { 
					$.each(reviewList, function(index, reviewList) {
						var review_id = reviewList.review_id;
						var review_content = reviewList.review_content;
						var review_rating_taste = reviewList.review_rating_taste;
						var review_rating_amount = reviewList.review_rating_amount;
						var review_rating_state = reviewList.review_rating_state;
						var review_like = reviewList.review_like;
				var htmlplus = 
					'        <div class="review card-1">' +
					'            <div class="hstack gap-3">' +
					'                <div class="me-auto">' +
					'                    아이디' +
					'                </div>' +
					'                <div>' +
					'                    <a href="#">수정</a>' +
					'                </div>' +
					'                <div>' +
					'                    <a href="#">삭제</a>' +
					'                </div>' +
					'            </div>' +
					'            <div class="hstack gap-3">' +
					'                <div class="me-auto">' +
					'                    맛★'+review_rating_taste+' 양★'+review_rating_amount+' 상태★'+review_rating_state+'' +
					'                </div>' +
					'                <div>' +
					'                    <a href="#">좋아요 '+review_like+'</a>' +
					'                </div>' +
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
	
	//11_management.jsp 조회
	$('.btnContainer2').on('click','.read',function(){
		
		var combo1_options = $('#combo1').val();
		var combo2_options = $('#combo2').val();
		var gender = $('.genderSpan input[type="radio"]:checked').attr('id');
		var startDate = $("#start_date").val();
		var endDate = $("#end_date").val();
		var categoryName = $('#category').val();
		var search = $('#search').val();
		
		console.log("combo1_options: "+combo1_options); // none
		console.log("combo2_options: "+combo2_options); // none
		console.log("gender: "+gender);
		console.log("startDate: "+startDate); // null?
		console.log("endDate:"+endDate); // null?
		console.log("categoryName: "+categoryName); // none
		console.log("search: "+search); //null?
		
		var condition = {
			"combo1_options":combo1_options, // none
			"combo2_options":combo2_options, // none
			"gender":gender,
			"startDate":startDate, // null?
			"endDate":endDate, // null?
			"categoryName":categoryName, // none
			"search":search //null?
		}
		
		console.log(condition);
		
		$.ajax({
			anyne:true,
			type:'POST',
			data: JSON.stringify(condition),
			url: "/store/get_list",
			datatype : "text",
			contentType:"application/json; charset=utf-8", //개애ㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐ중요
			success: function(data) {
				  
			},
			error: function(xhr, status, error) {
			alert("AJAX Error:", error);
			}
			
		});
		
	})
	
});






