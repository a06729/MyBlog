<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>홈페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
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
</style>
<style>
#mixedSlider {
	position: relative;
}

#mixedSlider .MS-content {
	white-space: nowrap;
	overflow: hidden;
	margin: 0 5%;
}

#mixedSlider .MS-content .item {
	display: inline-block;
	width: 33.3333%;
	position: relative;
	vertical-align: top;
	overflow: hidden;
	height: 100%;
	white-space: normal;
	padding: 0 10px;
}

@media ( max-width : 991px) {
	#mixedSlider .MS-content .item {
		width: 50%;
	}
}

@media ( max-width : 767px) {
	#mixedSlider .MS-content .item {
		width: 100%;
	}
}

#mixedSlider .MS-content .item .imgTitle {
	position: relative;
}

#mixedSlider .MS-content .item .imgTitle .blogTitle {
	margin: 0;
	text-align: left;
	letter-spacing: 2px;
	color: #252525;
	font-style: italic;
	position: absolute;
	background-color: rgba(255, 255, 255, 0.5);
	width: 100%;
	bottom: 0;
	font-weight: bold;
	padding: 0 0 2px 10px;
}

#mixedSlider .MS-content .item .imgTitle img {
	height: auto;
	width: 100%;
}

#mixedSlider .MS-content .item p {
	font-size: 16px;
	margin: 2px 10px 0 5px;
	text-indent: 15px;
}

#mixedSlider .MS-content .item a {
	float: right;
	margin: 0 20px 0 0;
	font-size: 16px;
	font-style: italic;
	color: rgba(173, 0, 0, 0.82);
	font-weight: bold;
	letter-spacing: 1px;
	transition: linear 0.1s;
}

#mixedSlider .MS-content .item a:hover {
	text-shadow: 0 0 1px grey;
}

#mixedSlider .MS-controls button {
	position: absolute;
	border: none;
	background-color: transparent;
	outline: 0;
	font-size: 50px;
	top: 95px;
	color: rgba(0, 0, 0, 0.4);
	transition: 0.15s linear;
}

#mixedSlider .MS-controls button:hover {
	color: rgba(0, 0, 0, 0.8);
}

@media ( max-width : 992px) {
	#mixedSlider .MS-controls button {
		font-size: 30px;
	}
}

@media ( max-width : 767px) {
	#mixedSlider .MS-controls button {
		font-size: 20px;
	}
}

#mixedSlider .MS-controls .MS-left {
	left: 0px;
}

@media ( max-width : 767px) {
	#mixedSlider .MS-controls .MS-left {
		left: -10px;
	}
}

#mixedSlider .MS-controls .MS-right {
	right: 0px;
}

@media ( max-width : 767px) {
	#mixedSlider .MS-controls .MS-right {
		right: -10px;
	}
}

#basicSlider {
	position: relative;
}

#basicSlider .MS-content {
	white-space: nowrap;
	overflow: hidden;
	margin: 0 2%;
	height: 50px;
}

#basicSlider .MS-content .item {
	display: inline-block;
	width: 20%;
	position: relative;
	vertical-align: top;
	overflow: hidden;
	height: 100%;
	white-space: normal;
	line-height: 50px;
	vertical-align: middle;
}

@media ( max-width : 991px) {
	#basicSlider .MS-content .item {
		width: 25%;
	}
}

@media ( max-width : 767px) {
	#basicSlider .MS-content .item {
		width: 35%;
	}
}

@media ( max-width : 500px) {
	#basicSlider .MS-content .item {
		width: 50%;
	}
}

#basicSlider .MS-content .item a {
	line-height: 50px;
	vertical-align: middle;
}

#basicSlider .MS-controls button {
	position: absolute;
}

#basicSlider .MS-controls .MS-left {
	top: 35px;
	left: 10px;
}

#basicSlider .MS-controls .MS-right {
	top: 35px;
	right: 10px;
}
</style>
<body>
	<header>
		<div class="title-bar" data-responsive-toggle="example-menu"
			data-hide-for="medium">
			<button class="menu-icon" type="button" data-toggle="example-menu"></button>
			<div class="title-bar-title">Menu</div>
		</div>

		<div class="top-bar" id="example-menu">
			<div class="top-bar-left">
				<ul class="dropdown menu" data-dropdown-menu>
					<li class="menu-text">이슈사이트</li>
					<li class="has-submenu"><a href="#0">One</a>
						<ul class="submenu menu vertical" data-submenu>
							<li><a href="#0">One</a></li>
							<li><a href="#0">Two</a></li>
							<li><a href="#0">Three</a></li>
						</ul></li>
					<li><a href="#0">Two</a></li>
					<li><a href="#0">Three</a></li>
				</ul>
			</div>
			<div class="top-bar-right">
				<ul class="menu">
					<li><input type="search" placeholder="Search"></li>
					<li><button type="button" class="button">Search</button></li>
				</ul>
			</div>
		</div>
	</header>
	<br>
	<div class="row">
		<div id="mixedSlider" class="medium-12 columns">
			<div class="MS-content">
				<div class="item">
					<div class="imgTitle">
						<h2 class="blogTitle">Animals</h2>
						<img src="https://placeimg.com/500/300/animals" alt="" />
					</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Vestibulum ac tellus ex. Integer eu fringilla nisi. Donec id
						dapibus mauris, eget dignissim turpis ...</p>
					<a href="#">Read More</a>
				</div>
				<div class="item">
					<div class="imgTitle">
						<h2 class="blogTitle">Arch</h2>
						<img src="https://placeimg.com/500/300/arch" alt="" />
					</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Vestibulum ac tellus ex. Integer eu fringilla nisi. Donec id
						dapibus mauris, eget dignissim turpis ...</p>
					<a href="#">Read More</a>
				</div>
				<div class="item">
					<div class="imgTitle">
						<h2 class="blogTitle">Nature</h2>
						<img src="https://placeimg.com/500/300/nature" alt="" />
					</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Vestibulum ac tellus ex. Integer eu fringilla nisi. Donec id
						dapibus mauris, eget dignissim turpis ...</p>
					<a href="#">Read More</a>
				</div>
				<div class="item">
					<div class="imgTitle">
						<h2 class="blogTitle">People</h2>
						<img src="https://placeimg.com/500/300/people" alt="" />
					</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Vestibulum ac tellus ex. Integer eu fringilla nisi. Donec id
						dapibus mauris, eget dignissim turpis ...</p>
					<a href="#">Read More</a>
				</div>
				<div class="item">
					<div class="imgTitle">
						<h2 class="blogTitle">Tech</h2>
						<img src="https://placeimg.com/500/300/tech" alt="" />
					</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Vestibulum ac tellus ex. Integer eu fringilla nisi. Donec id
						dapibus mauris, eget dignissim turpis ...</p>
					<a href="#">Read More</a>
				</div>

			</div>
			<div class="MS-controls">
				<button class="MS-left">
					<i class="fa fa-angle-left" aria-hidden="true"></i>
				</button>
				<button class="MS-right">
					<i class="fa fa-angle-right" aria-hidden="true"></i>
				</button>
			</div>
		</div>
	</div>
	<hr>
	<div class="row column">
		<h4 style="margin: 0;" class="text-center">LATEST STORIES</h4>
	</div>
	<hr>
	<div class="row">
		<div class="large-8 columns" style="border-right: 1px solid #E3E5E8;">
			<article>
				<div class="row">
					<div class="large-6 columns">
						<p>
							<img src="https://placehold.it/600x370&text=Look at me!"
								alt="image for article" alt="article preview image">
						</p>
					</div>
					<div class="large-6 columns">
						<h5>
							<a href="#">'Death Star' Vaporizes Its Own Planet</a>
						</h5>
						<p>
							<span><i class="fi-torso"> By Thadeus &nbsp;&nbsp;</i></span> <span><i
								class="fi-calendar"> 11/23/16 &nbsp;&nbsp;</i></span> <span><i
								class="fi-comments"> 6 comments</i></span>
						</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Recusandae impedit beatae, ipsum delectus aperiam nesciunt magni
							facilis ullam.</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="large-6 columns">
						<p>
							<img src="https://placehold.it/600x370&text=Look at me!"
								alt="image for article" alt="article preview image">
						</p>
					</div>
					<div class="large-6 columns">
						<h5>
							<a href="#">NASA's SLS Rocket Sheds Saturn V Color Scheme in
								Design Review</a>
						</h5>
						<p>
							<span><i class="fi-torso"> By Thadeus &nbsp;&nbsp;</i></span> <span><i
								class="fi-calendar"> 11/23/16 &nbsp;&nbsp;</i></span> <span><i
								class="fi-comments"> 6 comments</i></span>
						</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Recusandae impedit beatae, ipsum delectus aperiam nesciunt magni
							facilis ullam.</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="large-6 columns">
						<p>
							<img src="https://placehold.it/600x370&text=Look at me!"
								alt="image for article" alt="article preview image">
						</p>
					</div>
					<div class="large-6 columns">
						<h5>
							<a href="#">Ingredients for Life Were Always Present on
								Earth, Comet Suggests</a>
						</h5>
						<p>
							<span><i class="fi-torso"> By Thadeus &nbsp;&nbsp;</i></span> <span><i
								class="fi-calendar"> 11/23/16 &nbsp;&nbsp;</i></span> <span><i
								class="fi-comments"> 6 comments</i></span>
						</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Recusandae impedit beatae, ipsum delectus aperiam nesciunt magni
							facilis ullam.</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="large-6 columns">
						<p>
							<img src="https://placehold.it/600x370&text=Look at me!"
								alt="image for article" alt="article preview image">
						</p>
					</div>
					<div class="large-6 columns">
						<h5>
							<a href="#">Astronaut's Watch Worn on the Moon Sells for
								Record $1.6 Million</a>
						</h5>
						<p>
							<span><i class="fi-torso"> By Thadeus &nbsp;&nbsp;</i></span> <span><i
								class="fi-calendar"> 11/23/16 &nbsp;&nbsp;</i></span> <span><i
								class="fi-comments"> 6 comments</i></span>
						</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Recusandae impedit beatae, ipsum delectus aperiam nesciunt magni
							facilis ullam.</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="large-6 columns">
						<p>
							<img src="https://placehold.it/600x370&text=Look at me!"
								alt="image for article" alt="article preview image">
						</p>
					</div>
					<div class="large-6 columns">
						<h5>
							<a href="#">Interstellar Dust on the Galaxy's Magnetic Field
								| Space Wallpaper</a>
						</h5>
						<p>
							<span><i class="fi-torso"> By Thadeus &nbsp;&nbsp;</i></span> <span><i
								class="fi-calendar"> 11/23/16 &nbsp;&nbsp;</i></span> <span><i
								class="fi-comments"> 6 comments</i></span>
						</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Recusandae impedit beatae, ipsum delectus aperiam nesciunt magni
							facilis ullam.</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="large-6 columns">
						<p>
							<img src="https://placehold.it/600x370&text=Look at me!"
								alt="image for article" alt="article preview image">
						</p>
					</div>
					<div class="large-6 columns">
						<h5>
							<a href="#">Explore the Moon (Virtually) with These Awesome
								Global Maps</a>
						</h5>
						<p>
							<span><i class="fi-torso"> By Thadeus &nbsp;&nbsp;</i></span> <span><i
								class="fi-calendar"> 11/23/16 &nbsp;&nbsp;</i></span> <span><i
								class="fi-comments"> 6 comments</i></span>
						</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Recusandae impedit beatae, ipsum delectus aperiam nesciunt magni
							facilis ullam.</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="large-6 columns">
						<p>
							<img src="https://placehold.it/600x370&text=Look at me!"
								alt="image for article" alt="article preview image">
						</p>
					</div>
					<div class="large-6 columns">
						<h5>
							<a href="#">Best Space Books and Sci-Fi: A Space.com Reading
								List</a>
						</h5>
						<p>
							<span><i class="fi-torso"> By Thadeus &nbsp;&nbsp;</i></span> <span><i
								class="fi-calendar"> 11/23/16 &nbsp;&nbsp;</i></span> <span><i
								class="fi-comments"> 6 comments</i></span>
						</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Recusandae impedit beatae, ipsum delectus aperiam nesciunt magni
							facilis ullam.</p>
					</div>
				</div>
				<hr>
				<ul class="pagination" role="navigation" aria-label="Pagination">
					<li class="disabled">Previous <span class="show-for-sr">page</span></li>
					<li class="current"><span class="show-for-sr">You're on
							page</span> 1</li>
					<li><a href="#" aria-label="Page 2">2</a></li>
					<li><a href="#" aria-label="Page 3">3</a></li>
					<li><a href="#" aria-label="Page 4">4</a></li>
					<li><a href="#" aria-label="Next page">Next <span
							class="show-for-sr">page</span></a></li>
				</ul>
			</article>
		</div>
		<div class="large-4 columns">
			<aside>
				<div class="row small-up-3">
					<div class="column text-center">
						<i class="fi-social-facebook"></i>
						<h6>56,009</h6>
						<p>
							<small>FOLLOWERS</small>
						</p>
						<br>
					</div>
					<div class="column text-center">
						<i class="fi-social-twitter"></i>
						<h6>76,905</h6>
						<p>
							<small>FOLLOWERS</small>
						</p>
						<br>
					</div>
					<div class="column text-center">
						<i class="fi-social-instagram"></i>
						<h6>34,099</h6>
						<p>
							<small>FOLLOWERS</small>
						</p>
						<br>
					</div>
					<div class="column text-center">
						<i class="fi-social-tumblr"></i>
						<h6>13,765</h6>
						<p>
							<small>FOLLOWERS</small>
						</p>
					</div>
					<div class="column text-center">
						<i class="fi-social-pinterest"></i>
						<h6>9,283</h6>
						<p>
							<small>FOLLOWERS</small>
						</p>
					</div>
					<div class="column text-center">
						<i class="fi-social-youtube"></i>
						<h6>99,000</h6>
						<p>
							<small>FOLLOWERS</small>
						</p>
					</div>
				</div>
				<br>
				<div class="row column">
					<p class="lead">FROM OUR FRIENDS</p>
					<p>
						<img src="https://placehold.it/400x300&text=Buy Me!"
							alt="advertisement of ShamWow">
					</p>
				</div>
				<br>
				<div class="row column">
					<p class="lead">TRENDING POSTS</p>
					<div class="media-object">
						<div class="media-object-section">
							<img class="thumbnail" src="https://placehold.it/100">
						</div>
						<div class="media-object-section">
							<h5>All I need is a space suit and I'm ready to go.</h5>
						</div>
					</div>
					<div class="media-object">
						<div class="media-object-section">
							<img class="thumbnail" src="https://placehold.it/100">
						</div>
						<div class="media-object-section">
							<h5>Are the stars out tonight? I don't know if it's cloudy
								or bright.</h5>
						</div>
					</div>
					<div class="media-object">
						<div class="media-object-section">
							<img class="thumbnail" src="https://placehold.it/100">
						</div>
						<div class="media-object-section">
							<h5>And the world keeps spinning.</h5>
						</div>
					</div>
					<div class="media-object">
						<div class="media-object-section">
							<img class="thumbnail" src="https://placehold.it/100">
						</div>
						<div class="media-object-section">
							<h5>Cold hearted orb that rules the night.</h5>
						</div>
					</div>
				</div>
			</aside>
		</div>
	</div>
	<footer>
		<div class="row expanded callout secondary">
			<div class="medium-12 columns">
				<ul class="menu align-right">
					<li class="menu-text">Copyright © 2019</li>
				</ul>
			</div>
		</div>
	</footer>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/multislider.js"></script>
	<script src="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
	        $('#basicSlider').multislider({
	            continuous: true,
	            duration: 2000
	        });
	        $('#mixedSlider').multislider({
	            duration: 750,
	            interval: 3000
	        });
	</script>
	<script>
    	$(document).foundation();
  	</script>
</body>
</html>