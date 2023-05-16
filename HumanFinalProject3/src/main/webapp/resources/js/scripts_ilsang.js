
$(function(){
	// 사용자의 자료 입력여부를 검사하는 함수
	$('#confirm').click(function(){
    	if( $.trim($("#CUSTOMER_LOGINID").val()) == '' ){ // trim 이 공백이면 입력을 해주세요.
            alert("아이디를 입력해 주세요.");
            $("#CUSTOMER_LOGINID").focus();
            return;
        }
    	
    	if($.trim($('#CUSTOMER_PASSWORD').val())==''){
    		alert("비번입력해주세요.");
    		$('#CUSTOMER_PASSWORD').focus();
    		return;
    	}
    	
    	if($.trim($('#CUSTOMER_PASSWORD').val()) != $.trim($('#userPass_in').val())){
    		alert("비밀번호가 일치하지 않습니다..");
    		$('#userPass_in').focus();
    		return;
    	}
    	
    	
    	if($.trim($('#CUSTOMER_NAME').val())==''){
    		alert("이름입력해주세요.");
    		$('#CUSTOMER_NAME').foucs();
    		return;
    	}
    	
    	if($.trim($('#CUSTOMER_NICKNAME').val())==''){
    		alert("닉네임을입력해주세요.");
    		$('#CUSTOMER_NICKNAME').foucs();
    		return;
    	}
    	
    	if($.trim($('#CUSTOMER_BIRTHDAY').val())==''){
    		alert("생년월일을입력해주세요.");
    		$('#CUSTOMER_BIRTHDAY').foucs();
    		return;
    	}
    	
    	if($.trim($('#CUSTOMER_EMAIL').val())==''){
    		alert("이메일을입력해주세요.");
    		$('#CUSTOMER_EMAIL').foucs();
    		return;
    	}
    	
    	if($.trim($('#CUSTOMER_ADDRESS2').val())==''){
    		alert("주소를 입력해주세요.");
    		$('#CUSTOMER_ADDRESS2').foucs();
    		return;
    	}
    	
    	if($.trim($('#CUSTOMER_PREFERSTORE').val())==''){
    		alert("선호가게를 입력해주세요.");
    		$('#CUSTOMER_PREFERSTORE').foucs();
    		return;
    	}
    	
    	if($.trim($('#CUSTOMER_PREFERMENU').val())==''){
    		alert("메뉴를 입력해주세요.");
    		$('#CUSTOMER_PREFERMENU').foucs();
    		return;
    	}
    	
    	 	
       
        // 자료를 전송합니다.
        document.userinput.submit();
	});
	
	//아이디 중복체크
	// id가 userId인 태그에서 키보드가 올라갈때
	$('#CUSTOMER_LOGINID').keyup(function(){ 
        
		// 화면상에서 사용자가 입력한 값을 가지고 DB에 가서 select문을 통해 결과를 화면에 공유
	   var id = $('#CUSTOMER_LOGINID').val(); // 화면상에서 사용자가 입력한 값
       console.log(id);
       
       // 비동기통신 : 요청에 대한 응답을 데이터로 받을 예정 
       // MVC 패턴이니까 요청할 페이지이름이 .do일것
       $.ajax({
    	 type : 'post',
    	 url : 'idCheck.do', 		//  action > controller 맵핑이 존재해야합니다.
    	 data :{ 'CUSTOMER_LOGINID' : id},		// 맵핑된 controller의 메소드의 파라미터와 규칙을 정의  
    	 // 'CUSTOMER_LOGINID'가 controller와 vo에 전달해준다. 
    	 contentType : 'application/x-www-form-urlencoded;charset=UTF-8', 
    	 // contentType : 전송데이터의 형태
    	 dataType : 'text',    // 문자로 받을꺼니까 text
    	 success : function(resultData) {
//			alert(resultData);
    		 console.log( resultData ); 
    		 if( id == null){
    			 $('#idCheckResult').addClass("j");
    		 }
    		 $('#idCheckResult').html(resultData);
    		 
    		 // 태그도 생성하고, trtd
		},
		error : function(err) {
			alert("오류");
		}
    	   
       });
       
       // contentType : url 로 요청할때의 데이터 형식
       // dataType : 요청이 완료되고 성공시 응답할때 받아오는 형식
       
       
	});
	
$('#CUSTOMER_EMAIL').keyup(function(){ 
        
		// 화면상에서 사용자가 입력한 값을 가지고 DB에 가서 select문을 통해 결과를 화면에 공유
	   var id = $('#CUSTOMER_EMAIL').val(); // 화면상에서 사용자가 입력한 값
       console.log(id);
       // 비동기통신 : 요청에 대한 응답을 데이터로 받을 예정 
       // MVC 패턴이니까 요청할 페이지이름이 .do일것
       $.ajax({
    	 type : 'post',
    	 url : 'emailCheck.do', 		//  action > controller 맵핑이 존재해야합니다.
    	 data :{ 'CUSTOMER_EMAIL' : id},		// 맵핑된 controller의 메소드의 파라미터와 규칙을 정의  
    	 // 'CUSTOMER_EMAIL'가 controller와 vo에 전달해준다. 
    	 contentType : 'application/x-www-form-urlencoded;charset=UTF-8', 
    	 // contentType : 전송데이터의 형태
    	 dataType : 'text',    // 문자로 받을꺼니까 text
    	 success : function(resultData) {
//			alert(resultData);
    		 console.log( resultData ); 
    		 if( id == null){
    			 $('#emailCheckResult').addClass("j");
    		 }
    		 $('#emailCheckResult').html(resultData);
    		 
    		 // 태그도 생성하고, trtd
		},
		error : function(err) {
			alert("오류");
		}
    	   
       });
       
       // contentType : url 로 요청할때의 데이터 형식
       // dataType : 요청이 완료되고 성공시 응답할때 받아오는 형식
       
       
	});
});
	
	
	
	
	
	
	
	
	