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
		
		var inputData = "1";
		
		$.ajax( {
			url : "/store/ajaxtest",
//			data : inputData,
			type : "post",
//			dataType : 'json',
			success : function(ajaxData){ 
				alert(ajaxData);		
				console.log(ajaxData);
				
				$('.TabMenu').remove();
				// 태그를 만드는 작업 (*)기존태그는 지우고
				let tagHtml = "<tr>"+
		              "<td>1</td> "+
		              "<td>제목2</td> "+
		              "<td>감독2</td> "+
		              "<td>날짜2</td> "+
		              "<td>상태2</td> "+
		            "</tr>"
				$('hr').append(tagHtml);
			},
			error : function(){ 
				alert('실패');
			}				
		} );
		
	})
	
	
	
	
	
});