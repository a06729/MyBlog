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
        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
		<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
        <link rel="stylesheet" href="summernote/dist/summernote.css">
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
        <form id="boardFrom" action="/boardWrite" method="post">
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
			            	<textarea id="summernote"></textarea>
			            </div>
			            <div class="submitArea">
			                <button type="submit" style="margin-top: 10px; float: right;" class="outline white-blue">글쓰기</button>
			            </div>
			            <div id="uploadResult">
			            </div>
			        </div>
			        
		    </div>
        </form>
        <footer>asdasdasd</footer>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
<!--         <script src="ckeditor/ckeditor.js"></script> -->
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
        <script src="summernote/dist/summernote.js"></script>
        <script src="summernote/dist/summernote.min.js"></script>
        <script>
		$(function(){
			$('#summernote').summernote({
				height: 600,
				fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
				fontNamesIgnoreCheck : [ '맑은고딕' ],
				focus: true,
				dialogsInBody: false,
				dialogsFade: true,
				callbacks: {
					onImageUpload: function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {
			            	sendFile(files[i], this);
			            }
			        }
				}
				
			});
	
		});
		
		function sendFile(file, el) {
			var form_data = new FormData();
	      	form_data.append('file', file);
	      	$.ajax({
	        	data: form_data,
	        	type: "POST",
	        	url: '/imageFile?${_csrf.parameterName}=${_csrf.token}',
	        	cache: false,
	        	enctype: 'multipart/form-data',
	        	async : true,
	        	contentType: false,
	        	processData: false,
	        	success: function(img_name) {
	          		$(el).summernote('editor.insertImage', img_name.url);
	        		console.log(img_name);
	        		let urlInput="";
	        		let imgurl=JSON.stringify(img_name.url);
	        		//hidden값으로 saveUrl을 숨겨서 나중에 form으로 넘겨준다.
	        		urlInput='<input type="hidden" id=savaUrl name="saveUrl" value='+imgurl+'>';
	        		$('#boardFrom').append(urlInput);

	        	}
	      	});
	    }
        </script>

    </body>
</html>