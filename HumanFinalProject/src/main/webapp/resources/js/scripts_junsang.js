// 주소값
// if문으로 주소값이 가게리스트면 가게리스트에 selected 클래스 추가


$(function() {
  
//	// 타이머
//	// 마감시간 설정
//	const deadline = new Date("2023-04-25T20:00:00Z");
//	
//	// 1초마다 업데이트 
//	const timer = setInterval(function() {
//	  // 현재 시간과 마감시간의 차이 계산
//	  const now = new Date().getTime();
//	  const diff = deadline.getTime() - now;
//	
//	  // 남은 시간 계산
//	  const days = Math.floor(diff / (1000 * 60 * 60 * 24));
//	  const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
//	  const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
//	  const seconds = Math.floor((diff % (1000 * 60)) / 1000);
//	
//	  // 텍스트 업데이트
//	  document.getElementById("countdown").innerHTML = hours + "시간 " + minutes + "분 " + seconds + "초";
//	
//	  // 마감시간이 지났을 경우 타이머 정지
//	  if (diff < 0) {
//	    clearInterval(timer);
//	    document.getElementById("countdown").innerHTML = "마감되었습니다.";
//	  }
//	}, 1000);
	
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
	
	// 04_store ajax탭 이동	
	$('.TabMenuReview').off().on('click','.nav-link',function(){
		var store_id = $('#hidden_store_id').attr('class');
		$(this).addClass('selected');
		$('.nav-link').not(this).removeClass('selected');
		
		$.ajax( {
			
			url : "04_Tabmove",
			data : {"store_id":store_id},
			type : "post",
			datatype : "json",
			success : function(reviewMap){ 
				var html=
					'<div class="container TabReview" style="display:none">' +
					'    <div style="overflow:auto; width:500px; height:445px;">';
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
				htmlplus = 
					'    </div>' +
					'</div>';
				html = html + htmlplus;
				$('.hrline').append(html);
				if($('.TabReview').is(':hidden')){
					$('.TabReview').show();			
					$('.TabMenu').hide();					
				} else{
					$('.TabReview').hide();	
					$('.TabMenu').show();						
				}			
			},
			error:function(request, status, error) {
		        alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    }					
		} );
			
	})
	
	//04_store.jsp모달창 띄우기
	$('.containerBtn').on('click','.ddip',function(){
		alert("1")
		$('#testModal').modal("show");
		
	})
	
	$('#testBtn').click(function(){

		$('#testModal').modal();
	});
	
	//04_store.jsp 이미지 선택
	$('tbody').off().on('click','td',function(){
		
		var id = $(this).attr("id");
		$('.'+id).addClass('active');
		$('.carousel-item').not($('.'+id)).removeClass('active');
		
	})
	
	//06_DdipList.jsp ajax 메뉴 탭 이동
	$('.TabMenu').on('click','.nav-link',function(){

		$(this).addClass('selected');
		$('.nav-link').not(this).removeClass('selected');
		
	});
	
});