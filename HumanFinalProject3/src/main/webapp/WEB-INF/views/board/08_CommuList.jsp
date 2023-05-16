<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- <link rel="stylesheet" href="style.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>

<title>게시판 목록</title>

<!-- CSS 영역 -->

<style type="text/css">
 .body { 
	font-size: 9pt; 
 } 
 
p {
	width: 600px;
	text-align: right;
}

table thead tr th {
	background-color: gray;
}
/* 전체 스타일 */
.body {
/*   background-color: #f2f2f2; */
  font-family: 'Nanum Gothic', sans-serif;

   max-width: 800px; 
  margin: 0 auto; /* 가운데 정렬 */

}

/* 게시판 목록 스타일 */
table {
  border-collapse: collapse;
  width: 100%;
  margin: 30px auto;
  background-color: white;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

caption {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 20px;
}

thead {
  background-color: #343a40;
  color: white;
}

th,
td {
  text-align: center;
  padding: 10px;
}

tbody tr:nth-child(even) {
  background-color: #f2f2f2;
}

tbody tr:hover {
  background-color: #dcdcdc;
}

tfoot td {
  padding: 15px;
  font-weight: bold;
}

/* 검색 폼 스타일 */
form {
  margin: 30px auto;
  text-align: center;
}

form select,
form input[type="text"],
form input[type="submit"] {
  height: 30px;
  font-size: 14px;
  border-radius: 15px;
  border: none;
  margin: 0px 10px;
  padding: 5px 15px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

form input[type="submit"] {
  background-color: #343a40;
  color: white;
  cursor: pointer;
  transition: all 0.3s ease-in-out;
}

form input[type="submit"]:hover {
  background-color: #212529;
}

/* 버튼 스타일 */
p {
  text-align: center;
  margin: 30px auto;
}

input[type="button"] {
  height: 30px;
  font-size: 14px;
  border-radius: 15px;
  border: none;
  margin: 0px 10px;
  padding: 5px 15px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

input[type="button"]:nth-child(1) {
  background-color: #dc3545;
  color: white;
}

input[type="button"]:nth-child(2) {
  background-color: #007bff;
  color: white;
}

input[type="button"]:hover {
  background-color: rgba(0, 0, 0, 0.1);
}

</style>

<!-- //CSS 영역 -->

<!-- 자바스크립트 영역 -->

<script type="text/javascript">
	function goUrl(url) {

// 		location.href = ;

	}
</script>

<!-- //자바스크립트 영역 -->

</head>

<body>
	<%@ include file="/header.jsp" %>  
                      
	<!-- 검색 폼 영역 -->
	<div class="body">
	<form name="searchForm" action="" method="get">

		<p>

			<select name="searchType">

				<option value="ALL" id="">전체검색</option>

				<option value="SUBJECT" id="">제목</option>

				<option value="WRITER" id="">작성자</option>

				<option value="CONTENTS" id="">내용</option>

			</select> <input type="text" name="searchText" value="" /> <input
				type="submit" value="검색" />

		</p>

	</form>

	<!-- //검색 폼 영역 -->

	<!-- 게시판 목록 영역 -->

	<table border="1" summary="게시판 목록">

		<caption>게시판 목록</caption>

		<colgroup>

			<col width="50" />

			<col width="300" />

			<col width="80" />

			<col width="100" />


		</colgroup>

		<thead>

			<tr>

				<th >번호</th>

				<th id="">제목</th>

				<th id="">작성자</th>

				<th >등록 일시</th>

			</tr>

		</thead>

		<tbody>

			<tr>

				<td align="center" colspan="5">등록된 게시물이 없습니다.</td>

			</tr>

			<tr>

				<td align="center" name="BOARD_ID">1</td>

				<td name="BOARD_TITLE">동해물과 백두산이 마르고 닳도록 하...<span>{이미지}</span><span>{댓글}</span></td>

				<td align="center" name="commu_Writer">김연석</td>

				<td align="center" name="BOARD_DATA">2013.06.24</td>

			</tr>

		</tbody>

		<tfoot>

			<tr>

				<td align="center" colspan="5">1</td>

			</tr>

		</tfoot>

	</table>

	<!-- //게시판 목록 영역 -->

	<!-- 버튼 영역 -->

	<p>

		<input type="button" value="목록" onclick="goUrl('boardList.jsp');" />

		<input type="button" value="글쓰기"
			onclick="goUrl('boardWriteForm.jsp');" />

	</p>

	<!-- //버튼 영역 -->
	</div>

</body>

</html>

