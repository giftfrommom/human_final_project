$(function() {
	
	//전역변수
	var mapContainer;
	var map;
	var marker;
	var markers;
	var marker_click;
	
	var store_id = $('#hidden_store_id').attr('class').slice(-1);		
	
	// 지도 만들기
	$.ajax( {
		
		url : "05_MapInfo",
		data : {"store_id":store_id},
		type : "post",
		datatype : "json",
		success : function(mapInfoMap){ 
				
			mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(mapInfoMap.mapInfo[0].center_addressx,mapInfoMap.mapInfo[0].center_addressy), // 지도의 중심좌표
		        level: 3
		    };
		
			map = new kakao.maps.Map(mapContainer, mapOption);
				
			// 추천 마커를 표시할 위치와 title객체 배열
			var positions = [];
			$.each(mapInfoMap, function(index, mapInfoList) { 
				$.each(mapInfoList, function(index, mapInfoList) {
					positions.push({
						title: mapInfoList.bestplace_title,
						latlng: new kakao.maps.LatLng(mapInfoList.bestplace_addressx,mapInfoList.bestplace_addressy)
					})
				});
			});
						
			var imageSrc = "/resources/img/285659_marker_map_icon.png";
			    
			markers = [];
			
			for (var i = 0; i < positions.length; i ++) {
			    
			    var imageSize = new kakao.maps.Size(35, 35); 
			      
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커 생성
			    marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			    markers.push(marker); 		   
			}
						
			
			function searchDetailAddrFromCoords(coords, callback) {
			    // 좌표 to 주소 정보
			    var geocoder = new kakao.maps.services.Geocoder();
			    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
			}

			marker_click = new kakao.maps.Marker({			    
			    map: map
			});
			
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) { 
				marker_click.setMap(map);
			    // 클릭한 위치에 마커를 표시합니다 
			    marker_click.setPosition(mouseEvent.latLng);
			    var latlng = mouseEvent.latLng; // 위도 경도 합			   
			    
			    // 클릭한 위치의 주소 정보를 가져옵니다			
			    searchDetailAddrFromCoords(latlng, function(result, status) {				   
			        if (status === kakao.maps.services.Status.OK) {				       
			            var address = result[0].address.address_name;				            
			            $('.place').val(address);
			        }   
			    });
			});
			
			for (var i = 0; i < markers.length; i++) {
				kakao.maps.event.addListener(markers[i], 'click', function() {
					var geocoder = new kakao.maps.services.Geocoder();
				
					geocoder.coord2Address(this.getPosition().getLng(), this.getPosition().getLat(), function(result, status) {
						if (status === kakao.maps.services.Status.OK) {
							var address = result[0].address.address_name;
							$('.place').val(address);
						}
					});
					marker_click.setMap(null);
				});		
			}
			
			
		},
		error:function(request, status, error) {
	        alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	    }					
	} );

});






