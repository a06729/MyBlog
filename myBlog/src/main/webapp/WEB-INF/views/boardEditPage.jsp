<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>글수정</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/inputTempl.css">
        <link rel="stylesheet" href="css/select.css">
        <link rel="stylesheet" href="css/button.css">
        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
		<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
        <link rel="stylesheet" href="summernote/dist/summernote.css">
		<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
		<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
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
<!--   <header> -->
<!--     <div class="title-bar" data-responsive-toggle="example-menu" data-hide-for="medium"> -->
<!--       <button class="menu-icon" type="button" data-toggle="example-menu"></button> -->
<!--       <div class="title-bar-title">Menu</div> -->
<!--     </div> -->

<!--     <div class="top-bar" id="example-menu"> -->
<!--       <div class="top-bar-left"> -->
<!--         <ul class="dropdown menu" data-dropdown-menu> -->
<!--           <li class="menu-text">Site Title</li> -->
<!--           <li class="has-submenu"> -->
<!--             <a href="#0">One</a> -->
<!--             <ul class="submenu menu vertical" data-submenu> -->
<!--               <li><a href="#0">One</a></li> -->
<!--               <li><a href="#0">Two</a></li> -->
<!--               <li><a href="#0">Three</a></li> -->
<!--             </ul> -->
<!--           </li> -->
<!--           <li><a href="#0">Two</a></li> -->
<!--           <li><a href="#0">Three</a></li> -->
<!--         </ul> -->
<!--       </div> -->
<!--       <div class="top-bar-right"> -->
<!--         <ul class="menu"> -->
<!--           <li><input type="search" placeholder="Search"></li> -->
<!--           <li><button type="button" class="button">Search</button></li> -->
<!--         </ul> -->
<!--       </div> -->
<!--     </div> -->
<!--   </header> -->
		<jsp:include page="navbar.jsp"></jsp:include>
        <form id="boardFrom" name="boardFrom" action="/boardModify" method="post" role="form"> 
			<div class="wrapper">
				<div class="contentArea">
					<div class="userInput">
						<input name="boardTitle" type="text" placeholder="제목" value="${boardDto.boardTitle}"> 
						<input name="sideTitle" type="text" placeholder="부제목" value="${boardDto.sideTitle}"> 
						<select
							name="category" class="select-css"
							style="margin-top: 10px; margin-bottom: 10px;">
							<option selected disabled hidden>${boardDto.category}</option>
							<option>정치/사회</option>
							<option>경제</option>
							<option>페미니즘</option>
						</select>
					</div>
					<div class="editorArea">
						<textarea id="summernote" name="boardContent">${boardDto.boardContent}</textarea>
					</div>
					<div class="submitArea">
						<button type="submit" style="margin-top: 10px; float: right;"
							class="outline white-blue">글쓰기</button>
<!-- 						<input type="button" style="margin-top: 10px; float: right;" -->
<!-- 						class="outline white-blue" value="글쓰기"> -->
					</div>
				</div>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="boardNum" value="${boardDto.boardNum}">
	</form>
	<div id="uploadResult">
<%-- 		<c:forEach var="item" items="${attachFile}"> --%>
<%-- 			<input type="hidden" id="url" name="url" value='${item.url}'> --%>
<%-- 			<input type="hidden" id="original_File_Name" name="original_File_Name" value='${item.original_File_Name}'> --%>
<%-- 			<input type="hidden" id="stored_File_Name" name="stored_File_Name" value='${item.stored_File_Name}'> --%>
<%-- 			<input type="hidden" id="file_Size" name="file_Size" value='${item.file_Size}'> --%>
<%-- 			<input type="hidden" id="filePath" name="filePath" value='${item.filePath}'> --%>
<%-- 		</c:forEach> --%>
	</div>
<!--         <footer> -->
<!-- 			<div class="row expanded callout secondary"> -->
<!-- 				<div class="medium-12 columns"> -->
<!-- 					<ul class="menu align-right"> -->
<!-- 						<li class="menu-text">Copyright © 2019</li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</footer> -->
		<jsp:include page="footer.jsp"></jsp:include>
<!-- 	   	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script> -->
<!--         <script src="/js/jquery-3.3.1.min.js"></script>  -->
		<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
        <script src="summernote/dist/summernote.js"></script>
        <script src="summernote/dist/summernote.min.js"></script>
        <script src="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
		<script>
		$(document).foundation();
		</script>
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
			        },
		            onMediaDelete : function(target) {
		                console.log(target[0].src); 
		                deleteFile(target[0].src);
		            }
				}
				
			});
	
		});
		
		function deleteFile(src){
			$.ajax({
				data:{src:src},
				type:"POST",
				url:"/deleteFile?src="+src+"&${_csrf.parameterName}=${_csrf.token}",
				cache:false,
	        	async : true,
	        	contentType: false,
	        	processData: false,
				success:function(res){
					//이미지 삭제후 hidden값도 삭제
					let hiddenUrl=document.querySelectorAll('#url');
					let hiddenOriginal_File_Name=document.querySelectorAll('#original_File_Name');
					let hiddenStored_File_Name=document.querySelectorAll('#stored_File_Name');
					let hiddenFile_Size=document.querySelectorAll('#file_Size');
					let hiddenFilePath=document.querySelectorAll('#filePath');
					
					console.log("res:"+res);
					console.dir("res:"+res);
					for(var i=0; i<hiddenUrl.length; i++){
						let item=hiddenUrl.item(i);
						let value=item.value;
						if(res.url==item.value){
							$('#url').remove();
						}
					}
					for(var i=0; i<hiddenStored_File_Name.length; i++){
						let item=hiddenStored_File_Name.item(i);
						let value=item.value;
						if(res.stored_File_Name==item.value){
							$('#stored_File_Name').remove();
						}
					}
					for(var i=0; i<hiddenFile_Size.length; i++){
						let item=hiddenFile_Size.item(i);
						let value=item.value;
						if(res.file_Size==item.value){
							$('#file_Size').remove();
						}
					}
					for(var i=0; i<hiddenOriginal_File_Name.length; i++){
						let item=hiddenOriginal_File_Name.item(i);
						let value=item.value;
						if(res.original_File_Name==item.value){
							$('#original_File_Name').remove();
						}
					}
					for(var i=0; i<hiddenFilePath.length; i++){
						let item=hiddenFilePath.item(i);
						let value=item.value;
						if(res.filePath==item.value){
							$('#filePath').remove();
						}
					}
				}
			});
		}
		
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
	        		let original_File_Name="";
	        		let stored_File_Name="";
	        		let file_Size="";
	        		let filePate=""
	        		let url="";
	        		//hidden값으로 saveUrl을 숨겨서 나중에 form으로 넘겨준다.
	        		url='<input type="hidden" id=url name="url" value='+img_name.url+'>';
	        		original_File_Nam='<input type="hidden" id=original_File_Name name="original_File_Name" value='+img_name.original_File_Name+'>';
	        		stored_File_Name='<input type="hidden" id=stored_File_Name name="stored_File_Name" value='+img_name.stored_File_Name+'>';
	        		file_Size='<input type="hidden" id=file_Size name="file_Size" value='+img_name.file_Size+'>';
	        		filePate='<input type="hidden" id=filePath name="filePath" value='+img_name.filePath+'>';
	        		
	        		$('#uploadResult').append(url);
	        		$('#uploadResult').append(original_File_Nam);
	        		$('#uploadResult').append(stored_File_Name);
	        		$('#uploadResult').append(file_Size);
	        		$('#uploadResult').append(filePate);

	        	}
	      	});
	    }
		$(document).ready(function(){ 
			var formObj=$("form[role='form']");	
			$("button[type='submit']").on("click",function(e){
						e.preventDefault();
						console.log("submit clicke");
						var str="";
						
						let hiddenUrl=document.querySelectorAll('#url');
						let hiddenOriginal_File_Name=document.querySelectorAll('#original_File_Name');
						let hiddenStored_File_Name=document.querySelectorAll('#stored_File_Name');
						let hiddenFile_Size=document.querySelectorAll('#file_Size');
						let hiddenFilePath=document.querySelectorAll('#filePath');
						
						for(var i=0; i<hiddenUrl.length; i++){
							let item=hiddenUrl.item(i);
							let value=item.value;
							str+='<input type="hidden" name="attachList['+i+'].url" value='+value+'>';
						}
						for(var i=0; i<hiddenOriginal_File_Name.length; i++){
							let item=hiddenOriginal_File_Name.item(i);
							let value=item.value;
							str+='<input type="hidden" name="attachList['+i+'].original_File_Name" value='+value+'>';
						}
						for(var i=0; i<hiddenStored_File_Name.length; i++){
							let item=hiddenStored_File_Name.item(i);
							let value=item.value;
							str+='<input type="hidden" name="attachList['+i+'].stored_File_Name" value='+value+'>';
						}
						for(var i=0; i<hiddenFile_Size.length; i++){
							let item=hiddenFile_Size.item(i);
							let value=item.value;
							str+='<input type="hidden" name="attachList['+i+'].file_Size" value='+value+'>';
						}
						for(var i=0; i<hiddenFilePath.length; i++){
							let item=hiddenFilePath.item(i);
							let value=item.value;
							str+='<input type="hidden" name="attachList['+i+'].filePath" value='+value+'>';
						}
						str+='<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">'
						console.log("str:"+str);
						console.dir(str);
						formObj.append(str).submit();
				});
		});

        </script>
    </body>
</html>