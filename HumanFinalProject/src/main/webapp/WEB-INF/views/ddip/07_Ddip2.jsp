<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>공구 게시물 페이지</title>
    <!-- ajax -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="../resources/js/scripts_junsang.js"></script>
	
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/styles.css" rel="stylesheet" />
    <!-- 카카오맵 api -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4373ab24c40cd64e624852567a5db0a&libraries=services"></script>
	
<style>
	.star-rating {
	  display: flex;
	  flex-direction: row-reverse;
	  font-size: 2.25rem;
	  line-height: 2.5rem;
	  justify-content: space-around;
	  padding: 0 0.2em;
	  text-align: center;
	  width: 5em;
	}
	 
	.star-rating input {
	  display: none;
	}
	 
	.star-rating label {
	  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
	  -webkit-text-stroke-width: 2.3px;
	  -webkit-text-stroke-color: #2b2a29;
	  cursor: pointer;
	}
	 
	.star-rating :checked ~ label {
	  -webkit-text-fill-color: gold;
	}
	 
	.star-rating label:hover,
	.star-rating label:hover ~ label {
	  -webkit-text-fill-color: #fff58c;
	}
	
	
	.star-ratings {
	  color: #aaa9a9; 
	  position: relative;
	  unicode-bidi: bidi-override;
	  width: max-content;
	  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
	  -webkit-text-stroke-width: 1.3px;
	  -webkit-text-stroke-color: #2b2a29;
	}
	 
	.star-ratings-fill {
	  color: #fff58c;
	  padding: 0;
	  position: absolute;
	  z-index: 1;
	  display: flex;
	  top: 0;
	  left: 0;
	  overflow: hidden;
	  -webkit-text-fill-color: gold;
	}
	 
	.star-ratings-base {
	  z-index: 0;
	  padding: 0;
	}
</style>
</head>
	<body>    
		<div class="star-rating space-x-4 mx-auto">
			<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
			<label for="5-stars" class="star pr-4">★</label>
			<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
			<label for="4-stars" class="star">★</label>
			<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
			<label for="3-stars" class="star">★</label>
			<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
			<label for="2-stars" class="star">★</label>
			<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
			<label for="1-star" class="star">★</label>
		</div>
		<div class="star-ratings">
			<div class="star-ratings-fill space-x-2 text-lg" style=" width: 0% ">
				<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
			</div>
			<div class="star-ratings-base space-x-2 text-lg">
				<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
			</div>
		</div>
	</body>
</html>