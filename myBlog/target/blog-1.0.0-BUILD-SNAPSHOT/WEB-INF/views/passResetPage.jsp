<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 초기화</title>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/flexboxgrid/6.3.1/flexboxgrid.min.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Lato:100,300,400'>
<link rel="stylesheet" href="css/customCss/loginPage.css">
<link rel="shortcut icon" type="image/x-icon" href="./image/logoIco.png" >
</head>
<body>
 <div class="container">
	<div class="row">
		<div class="col-md-8 col-md-offset-2 col-sm-12">	
			<div class="form">
				<form method="post" action="/passReset" onsubmit="return formCheck();">
					<h1>비밀번호 초기화</h1>
					<div class="input-group col-md-8 col-md-offset-2">
						<input type="password" id="userPw" name="userPw" class="input password">
						<label>변경할 비밀번호</label>
					</div>
					<div class="input-group col-md-8 col-md-offset-2">
						<input type="password" id="userPw2" name="userPw2" class="input password">
						<label>변경할 비밀번호 확인</label>
					</div>
					<div class="input-group">
						<div class="col-md-4 col-md-offset-4">
							<button type="submit">
								비밀번호 변경
							</button>							
						</div>
					</div>
					<input type="hidden" name="username" value="${username}">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>
			</div>
		</div>
	</div>
</div>
<script src="js/customJs/loginPage.js"></script>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
	function formCheck(){
		let userpw=document.querySelector("#userPw");
		let userpw2=document.querySelector("#userPw2");
		
		if(userpw.value===''||userpw.value===null){
			alter("비밀번호를 입력해주세요");
			return false;
		}
		if (userpw.value===userpw2.value){
			return true;
		}else if(userpw.value!=userpw2.value){
			userpw2.focus();
			alert("비밀번호가 다릅니다");
			return false;
		}
	}
</script>
</body>
</html>