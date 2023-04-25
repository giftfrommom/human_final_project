<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>가게 리스트</title>
	<!-- ajax -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.js"></script>
	<script src="/resources/js/scripts_junsang.js"></script>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="/resources/css/styles.css" rel="stylesheet" />
<style>
	@font-face {
	    font-family: 'gwangyang';
	    src: url('/resources/fonts/GwangyangSunshineBold.ttf') format('truetype');
	}
	*{
		font-family: 'gwangyang';
	}
	.btn {
	  color: #60646A;
	  background-color: #DFDFDF;
	  border-color: #DFDFDF;
	}
	.btn:hover {
	  color: white;
	  background-color: #0AC290;
	  border-color: #0AC290;
	}
	/* ajax탭 버튼 */
	.nav-link.selected{
	  color: #0AC290;
	  background-color: white;
	  border-color: white;
	}
	.nav-link {
	  color: black;
	  background-color: white;
	  border-color: white;
	}
	.nav-link:hover {
	  color: #0AC290;
	  background-color: white;
	  border-color: white;
	}
	
   	.card-img-top{
   		height: 250px;
   	}
   	.card-body{
   		height: 100px;
   	}
   	.progress{
   		width: 260px;
   	}
   	.title{
   		font-size: 15px;
   	}
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    .b-example-divider {
      height: 3rem;
      background-color: rgba(0, 0, 0, .1);
      border: solid rgba(0, 0, 0, .15);
      border-width: 1px 0;
      box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
    }

    .b-example-vr {
      flex-shrink: 0;
      width: 1.5rem;
      height: 100vh;
    }

    .bi {
      vertical-align: -.125em;
      fill: currentColor;
    }

    .nav-scroller {
      position: relative;
      z-index: 2;
      height: 2.75rem;
      overflow-y: hidden;
    }

    .nav-scroller .nav {
      display: flex;
      flex-wrap: nowrap;
      padding-bottom: 1rem;
      margin-top: -1px;
      overflow-x: auto;
      text-align: center;
      white-space: nowrap;
      -webkit-overflow-scrolling: touch;
    }
    
    .outer {
	  border: 6px solid royalblue;
	  width: 300px;
	  height: 200px;
	  margin: 0 auto;
	  overflow-x: hidden;
	}

	.inner-list {
	  display: flex;
	  transition: .3s ease-out;
	  height: 100%;
	}

	.inner {
	  border: 6px solid olive;
	  padding: 0 16px;
	}
	
	.button-list {
	  text-align: center;
	}
	
	@keyframes tonext {
	  75% {
	    left: 0;
	  }
	  95% {
	    left: 100%;
	  }
	  98% {
	    left: 100%;
	  }
	  99% {
	    left: 0;
	  }
	}
	
	@keyframes tostart {
	  75% {
	    left: 0;
	  }
	  95% {
	    left: -300%;
	  }
	  98% {
	    left: -300%;
	  }
	  99% {
	    left: 0;
	  }
	}
	
	@keyframes snap {
	  96% {
	    scroll-snap-align: center;
	  }
	  97% {
	    scroll-snap-align: none;
	  }
	  99% {
	    scroll-snap-align: none;
	  }
	  100% {
	    scroll-snap-align: center;
	  }
	}
</style>
</head>
<body>

<div class="container">
    <header class="d-flex justify-content-center py-3">
      <ul class="nav nav-pills">
        <li class="nav-item"><a href="#" class="nav-link selected">전체</a></li>
        <li class="nav-item"><a href="#" class="nav-link">치킨</a></li>
        <li class="nav-item"><a href="#" class="nav-link">피자</a></li>
        <li class="nav-item"><a href="#" class="nav-link">중식</a></li>
        <li class="nav-item"><a href="#" class="nav-link">페스트푸드</a></li>
      </ul>
    </header>
</div>

<section>
   <div class="container px-lg-5">
       <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
           <div class="col mb-5">
               <div class="card h-100">      
                	<!-- Product image-->
                  <img class="card-img-top" src="https://www.bhc.co.kr/images/menu/newNbest/img_best_210713_2.jpg" alt="..." />
                  <!-- Product details-->
                  <div class="card-body p-4">
                      <div class="text-center">
                          <!-- Product name-->
                          <div class="title fw-bolder"> 교촌치킨</div>
                          <!-- Product reviews-->
                          <div class="d-flex justify-content-center small text-warning mb-2">
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                          </div>                             									
                      </div>
                  </div>
                 
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                      <div class="text-center">
                      <a class="btn btn-outline-dark mt-auto position-absolute start-50 translate-middle-x" style="bottom:2rem;" href="#">띱 버튼</a></div>
                  </div>					
              </div>                   
          </div>
         <div class="col mb-5">
              <div class="card h-100">                      
                  <!-- Product image-->
                  <img class="card-img-top" src="http://www.kyochon.com/uploadFiles/TB_ITEM/%EB%B8%94%EB%9E%99%EC%8B%9C%ED%81%AC%EB%A6%BF-%EC%98%A4%EB%A6%AC%EC%A7%80%EB%82%A0_list(1).png" alt="..." />
                  <!-- Product details-->
                  <div class="card-body p-4">
                      <div class="text-center">
                          <!-- Product name-->
                          <h5 class="title fw-bolder">자담치킨</h5>
                          <!-- Product reviews-->
                          <div class="d-flex justify-content-center small text-warning mb-2">
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                          </div>
                          <!-- Product price-->
                           <!--$40.00 - $80.00 -->

                      </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                      <div class="text-center">
                      <a class="btn btn-outline-dark mt-auto position-absolute start-50 translate-middle-x" style="bottom:2rem;" href="#">띱 버튼</a></div>
                  </div>
              </div>                   
          </div>
          <div class="col mb-5">
              <div class="card h-100">
                  <!-- Sale badge-->
                  <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                  <!-- Product image-->
                  <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                  <!-- Product details-->
                  <div class="card-body p-4">
                      <div class="text-center">
                          <!-- Product name-->
                          <h5 class="fw-bolder">Sale Item</h5>
                          <!-- Product price-->
                          <span class="text-muted text-decoration-line-through">$50.00</span>
                          $25.00
                      </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                      <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                  </div>
              </div>
          </div>
          <div class="col mb-5">
              <div class="card h-100">
                  <!-- Product image-->
                  <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                  <!-- Product details-->
                  <div class="card-body p-4">
                      <div class="text-center">
                          <!-- Product name-->
                          <h5 class="fw-bolder">Popular Item</h5>
                          <!-- Product reviews-->
                          <div class="d-flex justify-content-center small text-warning mb-2">
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                          </div>
                          <!-- Product price-->
                          $40.00
                      </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                      <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                  </div>
              </div>
          </div>
          <div class="col mb-5">
              <div class="card h-100">
                  <!-- Sale badge-->
                  <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                  <!-- Product image-->
                  <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                  <!-- Product details-->
                  <div class="card-body p-4">
                      <div class="text-center">
                          <!-- Product name-->
                          <h5 class="fw-bolder">Sale Item</h5>
                          <!-- Product price-->
                          <span class="text-muted text-decoration-line-through">$50.00</span>
                          $25.00
                      </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                      <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                  </div>
              </div>
          </div>
          <div class="col mb-5">
              <div class="card h-100">
                  <!-- Product image-->
                  <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                  <!-- Product details-->
                  <div class="card-body p-4">
                      <div class="text-center">
                          <!-- Product name-->
                          <h5 class="fw-bolder">Fancy Product</h5>
                          <!-- Product price-->
                          $120.00 - $280.00
                      </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                      <div class="text-center">
                      <a class="btn btn-outline-dark mt-auto" href="#">View options</a>
                      </div>
                  </div>
              </div>
          </div>
          <div class="col mb-5">
              <div class="card h-100">
                  <!-- Sale badge-->
                  <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                  <!-- Product image-->
                  <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                  <!-- Product details-->
                  <div class="card-body p-4">
                      <div class="text-center">
                          <!-- Product name-->
                          <h5 class="fw-bolder">Special Item</h5>
                          <!-- Product reviews-->
                          <div class="d-flex justify-content-center small text-warning mb-2">
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                          </div>
                          <!-- Product price-->
                          <span class="text-muted text-decoration-line-through">$20.00</span>
                          $18.00
                      </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                      <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                  </div>
              </div>
          </div>
          <div class="col mb-5">
              <div class="card h-100">
                  <!-- Product image-->
                  <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                  <!-- Product details-->
                  <div class="card-body p-4">
                      <div class="text-center">
                          <!-- Product name-->
                          <h5 class="fw-bolder">Popular Item</h5>
                          <!-- Product reviews-->
                          <div class="d-flex justify-content-center small text-warning mb-2">
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                              <div class="bi-star-fill"></div>
                          </div>
                          <!-- Product price-->
                          $40.00
                      </div>
                  </div>
                  <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Core theme JS-->
<script src="/resources/js/scripts.js"></script>


</body>
</html>
