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
	
	// ajax탭 css
	$('.TabMenu').on('click','.nav-link',function(){
		
		$(this).addClass('selected');
		$('.nav-link').not(this).removeClass('selected');
		
	})
	
	// 04_store ajax탭 이동	
	$('.TabMenuReview').on('click','.nav-link',function(){
		
		$(this).addClass('selected');
		$('.nav-link').not(this).removeClass('selected');
		
		$.ajax( {
			url : "/store/ajaxtest",
//			data : inputData,
			type : "post",
//			dataType : 'json',
			success : function(ajaxData){ 
				
				if($('.TabReview').is(':hidden')){
					$('.TabReview').show();			
					$('.TabMenu').hide();					
				} else{
					$('.TabReview').hide();	
					$('.TabMenu').show();						
				}			
			},
			error : function(){ 
				alert('실패');
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
	
	
});