<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8" dir="ltr">
<title>게시판 글쓰기</title>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style type="text/css">
html {
	font-size: 16px;
	font-family: Arial, sans-serif;
	color: #333;
}

body {
	margin: 0;
	padding: 0;
}

form {
	max-width: 800px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}

.card-header {
	background-color: #f8f9fa;
	padding: 10px 20px;
	border-radius: 10px 10px 0 0;
}

.card-header h5 {
	margin: 0;
}

.card-body {
	padding: 20px;
}

.card-body input[type="email"], .card-body input[type="text"] {
	width: 150%;
	padding: 10px;
	margin-bottom: 20px;
	border: none;
	background-color: #f8f9fa;
	border-radius: 5px;
}

.card-body textarea {
	width: 150%;
	padding: 10px;
	margin-bottom: 20px;
	border: none;
	background-color: #f8f9fa;
	border-radius: 5px;
	height: 300px;
}

.card-footer {
	border-top: 1px solid #dee2e6;
	padding: 10px 20px;
	border-radius: 0 0 10px 10px;
	display: flex;
	justify-content: space-between;
}
button{
padding: 5px;
}
.btn_send {
	padding: 8px 20px;
	border-radius: 5px;
	font-size: 16px;
	font-weight: 600;
	border: none;
	cursor: pointer;
}

.btn_send {
	color: #fff;
	background-color: #007bff;
}

.btn_send:hover {
	background-color: #0069d9;
}



.cursor-pointer {
	cursor: pointer;
}

.d-flex {
	display: flex;
}

.align-items-center {
	align-items: center;
}
.note-editable{
height: 600px;

}



</style>
<script type="text/javascript">

$(document).ready(function() {
  $('#summernote').summernote();
});
</script>

</head>

<body>
<%@ include file="/header.jsp" %>  
	
		<div class="card-header bg-light">
			<h5 class="mb-0">게시판 글쓰기</h5>
		</div>
	<form class="card" action="" method="post">
		<div class="card-body p-0">
			<div class="border border-top-0 border-200">
				<input class="form-control border-0 rounded-0 outline-none px-x1"
					id="BOARD_TITLE" type="email" aria-describedby="email-to"
					placeholder="제목" style="width: 720px;"/>
			</div>		
			<div class="border border-y-0 border-200">
				<textarea id="summernote" name="BOARD_CONTENT"  ></textarea>
			</div>
			<div class="min-vh-50">
				
			</div>

		</div>
		<div
			class="card-footer border-top border-200 d-flex flex-between-center">
			<div class="d-flex align-items-center">
				<button class="btn_send" type="submit" >작성완료</button>
				<input class="d-none" id="email-attachment" type="file" />
			</div>
			<div class="d-flex align-items-center">
				<div class="dropdown font-sans-serif me-2 btn-reveal-trigger">
				</div>
			</div>
		</div>
	</form>


</body>

</html>