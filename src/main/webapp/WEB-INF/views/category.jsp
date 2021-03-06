<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="nav" value="shop" scope="request"/>
<c:set var="title" value="category" scope="request"/>
<jsp:include page="include/header.jsp"/>
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shop Category</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="/">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Shop Category</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->


	<!-- ================ category section start ================= -->		  
  <section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
        <div class="col-xl-3 col-lg-4 col-md-5">
          <div class="sidebar-categories">
            <div class="head">Browse Categories</div>
            <ul class="main-categories">
              <li class="common-filter">
                <form action="/shop/category" method="get" onchange="javascrip:this.submit()">
                	<input type="hidden" name="keyfield" value="all">
                	<input type="hidden" name="keyword" value="">
                	<input type="hidden" name="start" value="0">
                  <ul>
                  	<li class="filter-list">
                    	<input class="pixel-radio" type="radio" id="all" name="category" value="all" ${ category eq 'all' ? "checked" : "" }>
                    	<label for="all">전체
                    		<span> (<fmt:formatNumber pattern="#,###"> ${ allCount }</fmt:formatNumber>)</span>
                    	</label>
                    </li>
                  <c:forEach var="categorys" items="${ categories }">
                    <li class="filter-list">
                    	<input class="pixel-radio" type="radio" id="${ categorys.categoryName }" name="category" value="${ categorys.categoryName }"
                    		${ category eq categorys.categoryName ? "checked" : "" }>
                    	<label for="${ categorys.categoryName }">${ categorys.categoryName }
                    		<span> (<fmt:formatNumber pattern="#,###"> ${ categorys.categoryCnt }</fmt:formatNumber>)</span>
                    	</label>
                    </li>
                  </c:forEach>
                  </ul>
                </form>
              </li>
            </ul>
          </div>
          <%-- <div class="sidebar-filter">
            <div class="top-filter-head">Product Filters</div>
            
            <div class="common-filter">
              <div class="head">Color</div>
              <form action="#">
                <ul>
                <c:forEach var="color" items="${ colors }">
                <li class="filter-list">
                	<input class="pixel-radio" type="radio" id="${ color }" name="color">
                	<label for="${ color }">${ color.colorName }
                		<span>(<fmt:formatNumber pattern="#,###"> ${ color.colorCnt }</fmt:formatNumber>)</span>
                	</label>
                </li>
                </c:forEach>
                </ul>
              </form>
            </div>
            <div class="common-filter">
              <div class="head">Price</div>
              <div class="price-range-area">
                <div id="price-range"></div>
                <div class="value-wrapper d-flex">
                  <div class="price">Price:</div>
                  <span>$</span>
                  <div id="lower-value"></div>
                  <div class="to">to</div>
                  <span>$</span>
                  <div id="upper-value"></div>
                </div>
              </div>
            </div>
          </div> --%>
        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
			<form action="/shop/category" method="GET">
			
                	<input type="hidden" name="category" value="${category}">
					<!-- Start Filter Bar -->
					<div class="filter-bar d-flex flex-wrap align-items-center">
						<div class="sorting mr-auto">
							<select name="sorting">
								<option value="regDate">최신순</option>
								<option value="price">가격순</option>
							</select>
						</div>
						<div class="sorting">
							<select name="keyfield">
								<option value="title" ${ keyfield eq 'title' ? "selected" : "" }>제목</option>
								<option value="productName" ${ keyfield eq 'productName' ? "selected" : "" }>상품명</option>
								<option value="content" ${ keyfield eq 'content' ? "selected" : "" }>내용</option>
							</select>
						</div>
						<div>
							<div class="input-group filter-bar-search">
								<input type="text" placeholder="Search" name="keyword" value="${ keyword }">
								<div class="input-group-append">
									<button type="submit"><i class="ti-search"></i></button>
								</div>
							</div>
						</div>
					</div>
				</form>
				<!-- End Filter Bar -->
	          <!-- Start Best Seller -->
	          <section class="lattest-product-area pb-40 category-list">
	            <div class="row">
	            <c:forEach var="product" items="${ products }">
	              <div class="col-md-6 col-lg-4">
	                <div class="card text-center card-product">
	                  <div class="card-product__img">
	                    <a href="/shop/single-product/${ product.productNo }">
		                    <img class="card-img" src="/shop/resources/files/product-files/${ product.file.fileName }" alt="">
						</a>
	                  </div>
	                  <div class="card-body">
	                    <h4 class="card-product__title"><a href="/shop/single-product/${ product.productNo }">${ product.title }</a></h4>
	                    <p class="card-product__price"><fmt:formatNumber pattern="#,###￦" >${ product.price }</fmt:formatNumber></p>
	                  </div>
	                </div>
	              </div>
				</c:forEach>
	            </div>
	          </section>
	          <!-- End Best Seller -->
        		<div id="pager" class="text-center">
		       		<button id="first" class="btn" data-pageno="-1" onclick="javascript:" disabled><<</button>
		       		<button id="prev" class="btn" data-pageno="-1" onclick="javascript:" disabled><</button>
			        <c:forEach var="idx" begin="1" end="${ lastPage }">
			        	<button class="pageno btn" 
			        		data-pageno="${ idx }" onclick='javascript:'>${ idx }</button>
			        </c:forEach>
		       		<button id="next" class="btn " data-pageno="-1" onclick="javascript:" disabled>></button>
		       		<button id="last" class="btn " data-pageno="-1" onclick="javascript:" disabled>>></button>
			    </div>
			    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

				
				 <script type="text/javascript">
						function recalc() {
							var page1 = Math.floor( ${ productsCount } / pageSize );
							var page2 = (${ productsCount } % pageSize) > 0 ? 1 : 0;
							lastPage = page1 + page2;
						}
					    
						var currentPage = 1;
						var pagerSize = recalc();
						var pageSize = 3;
						var productsCount = ${ productsCount };	
						var lastPage = recalc();
						
					    function loadComments() {
							$(".category-list").load('/shop/product-list', 
													{ "category" : '${category}',
														"sorting" : '${sorting}',
														"keyfield" : '${keyfield}',
														"keyword" : '${keyword}',
														"lastPage" : lastPage,
														"pageNo": currentPage },
													function() {});
						}
					    $(function() {
					    	
					    	var pageOne = $('#pager button.pageno:first');
					    	pageOne.css('background-color','blue');
					    	pageOne.css('color','white');
					    	
					    	$('#pager #first').on('click', function(event) {
					    		if (currentPage == 1) {
					    			return;
					    		}
					    		
					    		currentPage = 1;
					    		$('#pager .pageno').each(function(idx, item) {
					    			$(this).attr('data-pageno', idx + 1);
					    			$(this).text( (idx + 1));
					    		});
					    		
					    		loadComments();
					    	});
					    	
					    	$('#pager #prev').on('click', function(event) {
					    		if (currentPage == 1) {
					    			return;
					    		}
					    		
					    		var pageNo = $('#pager .pageno:first').attr("data-pageno");
					    		if (currentPage == pageNo) {
					    			$('#pager .pageno').each(function(idx, item) {
						    			$(this).attr('data-pageno', currentPage - (pagerSize - idx));
						    			$(this).text( (currentPage - (pagerSize - idx) ));
						    		});
					    		}
					    		
					    		currentPage--;	
					    		
					    		loadComments();
					    	});
					    	
					    	$('#pager .pageno').on('click', function(event) {
					    		var pageNo = $(this).attr('data-pageno');
					    		if (pageNo == currentPage) {
					    			return;
					    		}
					    		
					    		$(this).css('background-color','blue');
					    		$(this).css('color','white');
					    		var tmp = $("#pager button[data-pageno=" + currentPage +"]");
					    		tmp.css('background-color','#DDDDDD');
					    		tmp.css('color','black');
					    		currentPage = parseInt(pageNo);
					    		
					    		loadComments();
					    	});
					    	
					    	$('#pager #last').on('click', function(event) {
					    		if (currentPage == lastPage) {
					    			return;
					    		}
					    		
					    		currentPage = lastPage;
					    		var firstItem = lastPage - (lastPage % pagerSize) + 1;
					    		$('#pager .pageno').each(function(idx, item) {
					    			// $(this).attr('data-pageno', lastPage - (pagerSize - idx) + 1);
					    			// $(this).text( (lastPage - (pagerSize - idx) + 1 ));
					    			if (firstItem + idx <= lastPage) {
						    			$(this).attr('data-pageno', firstItem + idx);
						    			$(this).text(firstItem + idx);
					    			} else {
					    				$(this).attr('data-pageno', -1);
						    			$(this).text("");
					    			}
					    		});
					    		
					    		loadComments();
					    	});
					    	
					    	$('#pager #next').on('click', function(event) {
					    		if (currentPage == lastPage) {
					    			return;
					    		}
					    		
					    		var pageNo = $('#pager .pageno:last').attr("data-pageno");
					    		if (currentPage == pageNo) {
					    			$('#pager .pageno').each(function(idx, item) {
					    				if ((currentPage + idx + 1) <= lastPage) {
							    			$(this).attr('data-pageno', (currentPage + idx + 1));
							    			$(this).text((currentPage + idx + 1));
					    				} else {
					    					$(this).attr('data-pageno', -1);
							    			$(this).text("");
					    				}
						    		});
					    		}
					    		
					    		currentPage++;
					    		
					    		loadComments();
					    	});
					    });
				    </script>
        </div>
      </div>
    </div>
  </section>
	<!-- ================ category section end ================= -->		  

	<!-- ================ top product area start ================= -->	
	<section class="related-product-area">
		<div class="container">
			<div class="section-intro pb-60px">
        <p>Popular Item in the market</p>
        <h2>Top <span class="section-intro__style">Product</span></h2>
      </div>
			<div class="row mt-30">
        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="/shop/resources/img/product/product-sm-1.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="/shop/resources/img/product/product-sm-2.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="/shop/resources/img/product/product-sm-3.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="/shop/resources/img/product/product-sm-4.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="/shop/resources/img/product/product-sm-5.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="/shop/resources/img/product/product-sm-6.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="/shop/resources/img/product/product-sm-7.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="/shop/resources/img/product/product-sm-8.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="/shop/resources/img/product/product-sm-9.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="/shop/resources/img/product/product-sm-1.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="/shop/resources/img/product/product-sm-2.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="/shop/resources/img/product/product-sm-3.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>
      </div>
		</div>
	</section>
	<!-- ================ top product area end ================= -->		

	<!-- ================ Subscribe section start ================= -->		  
  <section class="subscribe-position">
    <div class="container">
      <div class="subscribe text-center">
        <h3 class="subscribe__title">Get Update From Anywhere</h3>
        <p>Bearing Void gathering light light his eavening unto dont afraid</p>
        <div id="mc_embed_signup">
          <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscribe-form form-inline mt-5 pt-1">
            <div class="form-group ml-sm-auto">
              <input class="form-control mb-1" type="email" name="EMAIL" placeholder="Enter your email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email Address '" >
              <div class="info"></div>
            </div>
            <button class="button button-subscribe mr-auto mb-1" type="submit">Subscribe Now</button>
            <div style="position: absolute; left: -5000px;">
              <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
            </div>

          </form>
        </div>
        
      </div>
    </div>
  </section>
	<!-- ================ Subscribe section end ================= -->
<jsp:include page="include/footer.jsp"/>