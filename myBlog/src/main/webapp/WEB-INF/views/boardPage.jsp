<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>글쓰기</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/inputTempl.css">
        <link rel="stylesheet" href="css/select.css">
        <link rel="stylesheet" href="css/button.css">
    </head>
    <style>
        .wrapper{
            display: grid;
        }
        /* div{
            grid-area: div;
            grid-template-columns:1fr;
            grid-template-rows: 1fr;
        } */
        .contentArea{
            display: grid;
            grid-column-start: 1;
            grid-column-end: 1;
            grid-row-start: 1;
            grid-row-end: 3;
        }
        .userInput{
            display: grid;
            grid-row-start: 1;
            grid-row-end: 1;
        }
        .editorArea{
            grid-row-start: 2;
            grid-row-end: 2;
        }
        .submitArea{
            grid-row-start: 3;
            grid-row-end: 3;
        }
    </style>
        
    <style>
        
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
        <form action="/boardWrite" method="post">
		       <div class="wrapper">
			        <div class="contentArea">
			            <div class="userInput">
			                <input name="boardTitle" type="text" placeholder="제목">
			                <select name="category" class="select-css" style="margin-top: 10px; margin-bottom: 10px;">
			                    <option>This is a native select element</option>
			                    <option>Apples</option>
			                    <option>Bananas</option>
			                    <option>Grapes</option>
			                    <option>Oranges</option>
			                </select>
			            </div>
			            <div name="boardContent" class="editorArea">
			                <textarea name="editor1" rows="10" cols="80"></textarea>
			            </div>
			            <div class="submitArea">
			                <button type="submit" style="margin-top: 10px; float: right;" class="outline white-blue">글쓰기</button>
			            </div>
			        </div>
		    </div>
        </form>
        <footer>asdasdasd</footer>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
        <script src="js/bootstrap.min.js"></script>
        <script src="ckeditor/ckeditor.js"></script>
        <script>
        	
            $(function(){
                CKEDITOR.replace('editor1',{
                	filebrowserUploadUrl:"/imageFile?${_csrf.parameterName}=${_csrf.token}"
                });
                window.parent.CKEDITOR.tools.callFunction({"filename" : "${fileMap.filename}", "uploaded" : "${fileMap.uploaded}", "url":"${fileMap.url}"});
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