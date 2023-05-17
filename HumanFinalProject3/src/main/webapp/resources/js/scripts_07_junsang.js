$(function() {
	
	var hiddenDiv = $("#hidden_ddip_id");
	var classValue = hiddenDiv.attr("class");
	var ddip_id = classValue.substring(classValue.indexOf("ddip_id") + 7);
	
	$.ajax({
		
			url: "get_ddip",
			type : "post",
			data : {"ddip_id":ddip_id},
			datatype : "json",
			success: function(ddipvo) {
				  
			var ddip_pickuptime = ddipvo.ddipvo.ddip_pickuptime;
			var ddip_currentcnt = ddipvo.ddipvo.ddip_currentcnt;
			var ddip_totalcnt = ddipvo.ddipvo.ddip_totalcnt;
			var ddip_pickupplace = ddipvo.ddipvo.ddip_pickupplace;
		  
			/////////////시간
			var ddip_deadline = ddipvo.ddipvo.ddip_deadline;
			var ddip_deadlineTarget = $('.ddip_deadline');
			
			var timeParts = ddip_deadline.split(" ")[1].split(":");
			var hours = parseInt(timeParts[0]);
			var minutes = parseInt(timeParts[1]);
			
			if (ddip_deadline.includes("오후") && hours < 12) {
			  hours += 12;
			}	

			var deadlineDate = new Date();
			deadlineDate.setHours(hours, minutes, 0, 0);
	
			function updateCountdown() {
			  var currentTime = new Date();
			  var remainingTime = deadlineDate - currentTime;
			
			  if (remainingTime <= 0) { 
				  countdownElement.text("마감되었습니다.");
				  return;
			  }
			
			  var hours = Math.floor(remainingTime / (1000 * 60 * 60));
			  var minutes = Math.floor((remainingTime % (1000 * 60 * 60)) / (1000 * 60));
			  var seconds = Math.floor((remainingTime % (1000 * 60)) / 1000);
			
			  var formattedHours = padNumber(hours);
			  var formattedMinutes = padNumber(minutes);
			  var formattedSeconds = padNumber(seconds);
			
			  var countdownText = formattedHours + "시간 " + formattedMinutes + "분 " + formattedSeconds + "초";
			
			  ddip_deadlineTarget.text(countdownText);
			}
			
			function padNumber(number) {
			  return String(number).padStart(2, '0');
			}
			
			updateCountdown();
			setInterval(updateCountdown, 1000); 
			
			////////////지도
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
			geocoder.addressSearch(ddip_pickupplace, function(result, status) {
	
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
	
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
	
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			
			////////띱 현황
			var ddip_currentcnt = ddipvo.ddipvo.ddip_currentcnt; 1
			var ddip_totalcnt = ddipvo.ddipvo.ddip_totalcnt; 5
			
			// ddip_currentcnt 만큼
			// <img src="/resources/assets/참여.png" alt="..." /> 반복
			// ddip_totalcnt - ddip_currentcnt 만큼
			// 	<img src="/resources/assets/미참여.png" alt="..." /> 반복
			var html = "";
			for (var i=0; i<ddip_currentcnt; i++){
				html+= '<img class="parti" src="/resources/assets/참여.png" alt="..." />';
			}
			for (var i=0; i<ddip_totalcnt-ddip_currentcnt; i++){
				html+= '<img class="non_parti hover" src="/resources/assets/미참여.png" alt="..." />';
			}
			$('.party2').append(html)
		 
		  },
		  error: function(xhr, status, error) {
			alert("AJAX Error:", error);
		  }
	});
	
	$('.party2').on('click','.non_parti',function(){
		
		var hiddenDiv = $("#hidden_ddip_id");
		var classValue = hiddenDiv.attr("class");
		var ddip_id = classValue.substring(classValue.indexOf("ddip_id") + 7);
		
		$.ajax({
			url: "ddip_chk",
			type : "post",
			data : {"ddip_id":ddip_id},
			datatype : "json",
			success: function(ddip_chk) {
				
				if(ddip_chk == -1){
					
					Swal.fire({
					  title: '로그인 오류',
					  text: "로그인 후 이용해주세요.",
					  icon: 'warning',
					  showCancelButton: true,
					  showConfirmButton: false,
					  cancelButtonColor: '#0AC290',
					  cancelButtonText: '확인'
					})	
						
				} else if(ddip_chk == 1){
					
					Swal.fire({
					  title: '띱 오류',
					  text: "이미 참여한 띱 입니다.",
					  icon: 'warning',
					  showCancelButton: true,
					  showConfirmButton: false,
					  cancelButtonColor: '#0AC290',
					  cancelButtonText: '확인'
					})	
					
				} else {
					
					Swal.fire({
					  title: '띱 성공',		 
					  icon: 'success',
					  showCancelButton: true,
					  showConfirmButton: false,
					  cancelButtonColor: '#0AC290',
					  cancelButtonText: '확인'
					})	
					$("#ddipFormContent").submit();
				}
			
			},
			 error: function(xhr, status, error) {
				 alert("AJAX Error:", error);
			 }
		});
		
	})
	
});






