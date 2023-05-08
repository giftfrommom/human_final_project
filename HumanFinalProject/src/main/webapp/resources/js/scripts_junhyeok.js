$(function() {

	
	//03_StoreList.jsp ajax 메뉴 탭 이동
	$('.sidebar-body').on('click','.tab_move',function(){
		
		alert("1");
		
		
		$.ajax( {
			
			url : "02_Tabmove",
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
})
	