<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>${boardDto.boardTitle}</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="robots" content="ALL">
<meta name = keywords" content="${boardDto.boardTitle}">
<meta name ="description" content="${boardDto.boardTitle}">
<meta name ="author" content="이슈저장소"> 
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
<link rel="shortcut icon" type="image/x-icon" href="./image/logoIco.png" >
</head>
<style>
/*icon styles*/
.fi-social-facebook {
	color: dodgerblue;
	font-size: 2rem;
}

.fi-social-youtube {
	color: red;
	font-size: 2rem;
}

.fi-social-pinterest {
	color: darkred;
	font-size: 2rem;
}

i.fi-social-instagram {
	color: brown;
	font-size: 2rem;
}

i.fi-social-tumblr {
	color: navy;
	font-size: 2rem;
}

.fi-social-twitter {
	color: skyblue;
	font-size: 2rem;
}
iframe{
	width: 100%;
	height: 360px;
}
</style>
<body>
<!-- 	<header> -->
<!-- 		<div class="title-bar" data-responsive-toggle="example-menu" -->
<!-- 			data-hide-for="medium"> -->
<!-- 			<button class="menu-icon" type="button" data-toggle="example-menu"></button> -->
<!-- 			<div class="title-bar-title">Menu</div> -->
<!-- 		</div> -->

<!-- 		<div class="top-bar" id="example-menu"> -->
<!-- 			<div class="top-bar-left"> -->
<!-- 				<ul class="dropdown menu" data-dropdown-menu> -->
<!-- 					<li class="menu-text">이슈사이트</li> -->
<!-- 					<li class="has-submenu"><a href="#0">One</a> -->
<!-- 						<ul class="submenu menu vertical" data-submenu> -->
<!-- 							<li><a href="#0">One</a></li> -->
<!-- 							<li><a href="#0">Two</a></li> -->
<!-- 							<li><a href="#0">Three</a></li> -->
<!-- 						</ul></li> -->
<!-- 					<li><a href="#0">Two</a></li> -->
<!-- 					<li><a href="#0">Three</a></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 			<div class="top-bar-right"> -->
<!-- 				<ul class="menu"> -->
<!-- 					<li><input type="search" placeholder="Search"></li> -->
<!-- 					<li><button type="button" class="button">Search</button></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</header> -->
	<jsp:include page="navbar.jsp"></jsp:include>
	<hr>
	<div class="row column">
		<h4 style="margin: 0;" class="text-center">${boardDto.boardTitle}</h4>
	</div>
	<hr>
	<div class="row">
		<div class="large-8 columns" style="border-right: 1px solid #E3E5E8;">
			<article>
				<div class="row">
					<div class="large-12 columns">
						${boardDto.boardContent}
					</div>
					
					<div class="row align-center">
						<c:if test="${boardDto.userId==userId}">
							<form action="/boardDelete" method="post">
								<div class="column small-4">
									<input type="hidden" name="pageNum" value="${cri.pageNum}">
									<input type="hidden" name="amount" value="${cri.amount}">
									<input id="boardNum" name="boardNum" type="hidden" value='<c:out value="${boardDto.boardNum}"></c:out>'>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									<input type="submit" class="hollow button alert" value="삭제">
								</div>
							</form>
						</c:if>
						<c:if test="${boardDto.userId==userId}">
							<form action="/boardEditPage" method="get">
								<div class="column small-4">
									<input type="hidden" name="pageNum" value="${cri.pageNum}">
									<input type="hidden" name="amount" value="${cri.amount}">
									<input id="boardNum" name="boardNum" type="hidden" value='<c:out value="${boardDto.boardNum}"></c:out>'>
									<input class="hollow button warning" type="submit" value="수정">
								</div>
							</form>
						</c:if>
						<form action="/" method="get">
							<div class="column small-4">
								<input type="hidden" name="pageNum" value="${cri.pageNum}">
								<input type="hidden" name="amount" value="${cri.amount}">
								<input class="hollow button success" type="submit" value="목록">
							</div>
						</form>
					</div>
				</div>
				<hr>
<!-- 				<ul class="pagination" role="navigation" aria-label="Pagination"> -->
<%-- 					<c:if test="${pageMaker.prev}"> --%>
<%-- 						<li class="paginate_button pagination-previous"><a href="${pageMaker.starPage-1}">Previous <span class="show-for-sr">page</span></a></li> --%>
<%-- 					</c:if> --%>
				
<%-- 					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}"> --%>
<%-- 						<li class="paginate_button  ${pageMaker.cri.pageNum==num ? "active":""}"> --%>
<%-- 							<a href="${num}">${num}</a> --%>
<!-- 						</li> -->
<%-- 					</c:forEach> --%>
<!-- 					<li class="current">1</li> -->
<!-- 					<li><a href="#" aria-label="Page 2">2</a></li> -->
<!-- 					<li><a href="#" aria-label="Page 3">3</a></li> -->
<!-- 					<li><a href="#" aria-label="Page 4">4</a></li> -->
<%-- 					<c:if test="${pageMaker.next}"> --%>
<%-- 						<li class="paginate_button pagination-next"><a href="${pageMaker.endPage+1}" aria-label="Next page">Next <span class="show-for-sr">page</span></a></li> --%>
<%-- 					</c:if> --%>
<!-- 				</ul> -->
			</article>
<!-- 			<form id="actionForm" action="/" method="get"> -->
<%-- 				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> --%>
<%-- 				<input type="hidden" name="amount" value="${pageMaker.cri.amount}"> --%>
<!-- 			</form> -->
		</div>
<!-- 		<div class="large-4 columns"> -->
<!-- 			<aside> -->
<!-- 				<div class="row small-up-3"> -->
<!-- 					<div class="column text-center"> -->
<!-- 						<i class="fi-social-facebook"></i> -->
<!-- 						<h6>56,009</h6> -->
<!-- 						<p> -->
<!-- 							<small>FOLLOWERS</small> -->
<!-- 						</p> -->
<!-- 						<br> -->
<!-- 					</div> -->
<!-- 					<div class="column text-center"> -->
<!-- 						<i class="fi-social-twitter"></i> -->
<!-- 						<h6>76,905</h6> -->
<!-- 						<p> -->
<!-- 							<small>FOLLOWERS</small> -->
<!-- 						</p> -->
<!-- 						<br> -->
<!-- 					</div> -->
<!-- 					<div class="column text-center"> -->
<!-- 						<i class="fi-social-instagram"></i> -->
<!-- 						<h6>34,099</h6> -->
<!-- 						<p> -->
<!-- 							<small>FOLLOWERS</small> -->
<!-- 						</p> -->
<!-- 						<br> -->
<!-- 					</div> -->
<!-- 					<div class="column text-center"> -->
<!-- 						<i class="fi-social-tumblr"></i> -->
<!-- 						<h6>13,765</h6> -->
<!-- 						<p> -->
<!-- 							<small>FOLLOWERS</small> -->
<!-- 						</p> -->
<!-- 					</div> -->
<!-- 					<div class="column text-center"> -->
<!-- 						<i class="fi-social-pinterest"></i> -->
<!-- 						<h6>9,283</h6> -->
<!-- 						<p> -->
<!-- 							<small>FOLLOWERS</small> -->
<!-- 						</p> -->
<!-- 					</div> -->
<!-- 					<div class="column text-center"> -->
<!-- 						<i class="fi-social-youtube"></i> -->
<!-- 						<h6>99,000</h6> -->
<!-- 						<p> -->
<!-- 							<small>FOLLOWERS</small> -->
<!-- 						</p> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<br> -->
<!-- 				<div class="row column"> -->
<!-- 					<p class="lead">FROM OUR FRIENDS</p> -->
<!-- 					<p> -->
<!-- 						<img src="https://placehold.it/400x300&text=Buy Me!" -->
<!-- 							alt="advertisement of ShamWow"> -->
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 				<br> -->
<!-- 				<div class="row column"> -->
<!-- 					<p class="lead">TRENDING POSTS</p> -->
<!-- 					<div class="media-object"> -->
<!-- 						<div class="media-object-section"> -->
<!-- 							<img class="thumbnail" src="https://placehold.it/100"> -->
<!-- 						</div> -->
<!-- 						<div class="media-object-section"> -->
<!-- 							<h5>All I need is a space suit and I'm ready to go.</h5> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="media-object"> -->
<!-- 						<div class="media-object-section"> -->
<!-- 							<img class="thumbnail" src="https://placehold.it/100"> -->
<!-- 						</div> -->
<!-- 						<div class="media-object-section"> -->
<!-- 							<h5>Are the stars out tonight? I don't know if it's cloudy -->
<!-- 								or bright.</h5> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="media-object"> -->
<!-- 						<div class="media-object-section"> -->
<!-- 							<img class="thumbnail" src="https://placehold.it/100"> -->
<!-- 						</div> -->
<!-- 						<div class="media-object-section"> -->
<!-- 							<h5>And the world keeps spinning.</h5> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="media-object"> -->
<!-- 						<div class="media-object-section"> -->
<!-- 							<img class="thumbnail" src="https://placehold.it/100"> -->
<!-- 						</div> -->
<!-- 						<div class="media-object-section"> -->
<!-- 							<h5>Cold hearted orb that rules the night.</h5> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</aside> -->
<!-- 		</div> -->
		<jsp:include page="aside.jsp"></jsp:include>
		<input type="hidden" name="boardNum" id="boardNum" value="${boardDto.boardNum}">
		<div class="large-12 columns">
			<article>
				<div id="disqus_thread"></div>
			</article>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
<!-- 	<footer> -->
<!-- 		<div class="row expanded callout secondary"> -->
<!-- 			<div class="medium-12 columns"> -->
<!-- 				<ul class="menu align-right"> -->
<!-- 					<li class="menu-text">Copyright © 2019</li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</footer> -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
    	$(document).foundation();
    	let actionForm=$("#actionForm");
    	$(".paginate_button a").on("click",function(e){
    		e.preventDefault();
    		
    		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    		
    		actionForm.submit();
    	});
  	</script>
  	
  	<script>
	let boardNum=document.querySelector("#boardNum");
	/**
	*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
	*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
	/*	*/
	var disqus_config = function () {
	var num=boardNum.value;
	var href=location.href;
	console.log("href:"+href);
//	this.page.url = '/contentPage?boardNum='+num;  // Replace PAGE_URL with your page's canonical URL variable
	this.page.identifier = "\{\{"+href+" }}"; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
	
	};

	(function() { // DON'T EDIT BELOW THIS LINE
	var d = document, s = d.createElement('script');
	s.src = 'https://test-4zksygpoh9.disqus.com/embed.js';
	s.setAttribute('data-timestamp', +new Date());
	(d.head || d.body).appendChild(s);
	})();
	</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
</body>
</html>