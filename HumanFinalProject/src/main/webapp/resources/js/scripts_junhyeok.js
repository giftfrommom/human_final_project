$(function() {

	
	//03_StoreList.jsp ajax 메뉴 탭 이동
	$('.sidebar-body').on('click','.09_Orderdetails1',function(){
		
		
		$.ajax( {
			
			url : "09_Orderdetails1",
//			data : {"inputData":$(this).attr('id')},
			type : "post",
			datatype : "json",
			success : function(storeMap){ 
				var html=
					'<div class="card">' +
					    '<h4 style="float: right; color: #BDBDBD;">#123456</h4>' +
					    '<h4>2023.05.03 주문</h4>' +
					    '<h2>주문완료</h2>' +
					    '<p>교촌치킨 <br><span>₩18,000</span></p>' +
					    '<div class="card-footer">' +
					        '<button class="cancel-btn">삭제</button>' +
					    '</div>' +
					'</div>' +
					'<div class="card">' +
					    '<h4 style="float: right; color: #BDBDBD;">#123457</h4>' +
					    '<h4>2023.05.02 주문</h4>' +
					    '<h2>주문완료</h2>' +
					    '<p>도미노피자 <br><span>₩28,000</span></p>' +
					    '<div class="card-footer">' +
					        '<button class="cancel-btn">삭제</button>' +
					    '</div>' +
					'</div>' +
					'<div class="card">' +
					    '<h4 style="float: right; color: #BDBDBD;">#123457</h4>' +
					    '<h4>2023.05.02 주문</h4>' +
					    '<h2>주문완료</h2>' +
					    '<p>도미노피자 <br><span>₩28,000</span></p>' +
					    '<div class="card-footer">' +
					        '<button class="cancel-btn">삭제</button>' +
					    '</div>' +
					'</div>' +
					'<div class="card">' +
					    '<h4 style="float: right; color: #BDBDBD;">#123457</h4>' +
					    '<h4>2023.05.02 주문</h4>' +
					    '<h2>주문완료</h2>' +
					    '<p>도미노피자 <br><span>₩28,000</span></p>' +
					    '<div class="card-footer">' +
					        '<button class="cancel-btn">삭제</button>' +
					    '</div>' +
					'</div>' +
					'<div class="card">' +
					    '<h4 style="float: right; color: #BDBDBD;">#123457</h4>' +
					    '<h4>2023.05.02 주문</h4>' +
					    '<h2>주문완료</h2>' +
					    '<p>도미노피자 <br><span>₩28,000</span></p>' +
					    '<div class="card-footer">' +
					        '<button class="cancel-btn">삭제</button>' +
					    '</div>' +
					'</div>';		
				$('.container').empty();
				$('.container').append(html);	 			
			},
			error:function(request, status, error) {
		        alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    }			
		} );
		
		
	})
})
	