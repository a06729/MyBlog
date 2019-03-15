<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    </head>
    <style>
        .wrapper{
            display: grid;
            grid-gap: 3rem;
            grid-template-areas: "div div"
                                 "section section"
                                 "footer footer";
            padding-right: 10px;
            padding-left: 10px;
        }
        div{
            grid-area: div;
            grid-template-columns:1fr 1fr;
        }
        .item2{
            grid-area: div;
            grid-column: 2;
        }
        section{
            grid-area: section;
        }
        footer{
            grid-area: footer
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
	  @media (max-width: 991px) {
	    #mixedSlider .MS-content .item {
	      width: 50%;
	    }
	  }
	  @media (max-width: 767px) {
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
	  @media (max-width: 992px) {
	    #mixedSlider .MS-controls button {
	      font-size: 30px;
	    }
	  }
	  @media (max-width: 767px) {
	    #mixedSlider .MS-controls button {
	      font-size: 20px;
	    }
	  }
	  #mixedSlider .MS-controls .MS-left {
	    left: 0px;
	  }
	  @media (max-width: 767px) {
	    #mixedSlider .MS-controls .MS-left {
	      left: -10px;
	    }
	  }
	  #mixedSlider .MS-controls .MS-right {
	    right: 0px;
	  }
	  @media (max-width: 767px) {
	    #mixedSlider .MS-controls .MS-right {
	      right: -10px;
	    }
	  }
	  #basicSlider { position: relative; }
	
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
	  @media (max-width: 991px) {
	
	  #basicSlider .MS-content .item { width: 25%; }
	  }
	  @media (max-width: 767px) {
	
	  #basicSlider .MS-content .item { width: 35%; }
	  }
	  @media (max-width: 500px) {
	
	  #basicSlider .MS-content .item { width: 50%; }
	  }
	
	  #basicSlider .MS-content .item a {
	    line-height: 50px;
	    vertical-align: middle;
	  }
	
	  #basicSlider .MS-controls button { position: absolute; }
	
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
        <nav class="navbar navbar-default">
            <div class="container-fluid">
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">이슈저장소</a>
              </div>
          
              <!-- Collect the nav links, forms, and other content for toggling -->
              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                  <li><a href="#">Link <span class="sr-only">(current)</span></a></li>
                  <li><a href="#">Link</a></li>
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="#">Action</a></li>
                      <li><a href="#">Another action</a></li>
                      <li><a href="#">Something else here</a></li>
                      <li class="divider"></li>
                      <li><a href="#">Separated link</a></li>
                      <li class="divider"></li>
                      <li><a href="#">One more separated link</a></li>
                    </ul>
                  </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                </ul>
              </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
          </nav>
          <div class="wrapper">
                <div id="mixedSlider">
                        <div class="MS-content">
                            <div class="item">
                                <div class="imgTitle">
                                    <h2 class="blogTitle">Animals</h2>
                                    <img src="https://placeimg.com/500/300/animals" alt="" />
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac tellus ex. Integer eu fringilla nisi. Donec id dapibus mauris, eget dignissim turpis ...</p>
                                <a href="#">Read More</a>
                            </div>
                            <div class="item">
                                <div class="imgTitle">
                                    <h2 class="blogTitle">Arch</h2>
                                    <img src="https://placeimg.com/500/300/arch" alt="" />
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac tellus ex. Integer eu fringilla nisi. Donec id dapibus mauris, eget dignissim turpis ...</p>
                                <a href="#">Read More</a>
                            </div>
                            <div class="item">
                                <div class="imgTitle">
                                    <h2 class="blogTitle">Nature</h2>
                                    <img src="https://placeimg.com/500/300/nature" alt="" />
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac tellus ex. Integer eu fringilla nisi. Donec id dapibus mauris, eget dignissim turpis ...</p>
                                <a href="#">Read More</a>
                            </div>
                            <div class="item">
                                <div class="imgTitle">
                                    <h2 class="blogTitle">People</h2>
                                    <img src="https://placeimg.com/500/300/people" alt="" />
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac tellus ex. Integer eu fringilla nisi. Donec id dapibus mauris, eget dignissim turpis ...</p>
                                <a href="#">Read More</a>
                            </div>
                            <div class="item">
                                <div class="imgTitle">
                                    <h2 class="blogTitle">Tech</h2>
                                    <img src="https://placeimg.com/500/300/tech" alt="" />
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac tellus ex. Integer eu fringilla nisi. Donec id dapibus mauris, eget dignissim turpis ...</p>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                        <div class="MS-controls">
                                <button class="MS-left"><i class="fa fa-angle-left" aria-hidden="true"></i></button>
                                <button class="MS-right"><i class="fa fa-angle-right" aria-hidden="true"></i></button>
                        </div>
                    </div>
            <section>
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src=http://placehold.it/350x150 />
                            <div class="caption">
                                <h3>Thumbnail label</h3>
                                <p>...</p>
                                <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img src=http://placehold.it/350x150 />
                                <div class="caption">
                                    <h3>Thumbnail label</h3>
                                    <p>...</p>
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                                </div>
                            </div>
                    </div>
                    <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img src=http://placehold.it/350x150 />
                                <div class="caption">
                                    <h3>Thumbnail label</h3>
                                    <p>...</p>
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                                </div>
                            </div>
                    </div>
                    <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img src=http://placehold.it/350x150 />
                                <div class="caption">
                                    <h3>Thumbnail label</h3>
                                    <p>...</p>
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                                </div>
                            </div>
                    </div>
                </div>
            </section>
            <footer>asdasdasd</footer>
          </div>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
        <script src="js/bootstrap.min.js"></script>
        <script src="js/multislider.js"></script>
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
            //클릭한 메뉴에서 클릭한거만 active 클래스를 추가하고 나머지는 삭제
            function clickTag(event){
                const target= console.dir(event.target.parentNode);
                const li_Tag=event.target.parentNode;  
                const all_li=document.querySelectorAll('li');
                if(li_Tag.className=='active'){
                    li_Tag.classList.remove('active');
                }else{
                    all_li.forEach(function(e){
                        e.classList.remove('active');
                    });
                    li_Tag.classList.add('active');
                }
            }
            function init (){
                addEventListener("click",clickTag);
            }
            init();
        </script>
    </body>
</html>