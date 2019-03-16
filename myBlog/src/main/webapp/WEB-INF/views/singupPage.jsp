<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/flexboxgrid/6.3.1/flexboxgrid.min.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Lato:100,300,400'>
<link rel="stylesheet" href="css/customCss/loginPage.css">
<style type="text/css">
.username{
	padding-left: 40px;
	background: url("../image/icon/user-icon.png") left center no-repeat;
}
</style>
</head>

<body>

<div class="container">
	<div class="row">
		<div class="col-md-8 col-md-offset-2 col-sm-12">	
			<div class="form">
				<form action="/sing" method="post" onsubmit="return formCheck();">
		
						<h1>singUp</h1>
		
						<div class="input-group col-md-8 col-md-offset-2">
								<input type="email" id="userId" name="userId" class="input email" autocomplete="email">
								<label>이메일</label>
						</div>
					
						<div class="input-group col-md-8 col-md-offset-2">
							<input type="password" id="userPw" name="userPw" class="input password">
							<label>비밀번호</label>
						</div>
		
						<div class="input-group col-md-8 col-md-offset-2">
							<input type="password" id="userPw2" name="userPw2" class="input password">
							<label>비밀번호 확인</label>
						</div>
						
						<div class="input-group col-md-8 col-md-offset-2">
							<input type="text" id="userName" name="userName" class="input username">
							<label>닉네임</label>
						</div>
		
						<div class="input-group">
							<div class="col-md-4 col-md-offset-4">
								<button id="singUpBtn" type="submit" class="singupBtn">
									SingUp
								</button>							
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>
				</div>
			</div>
		</div>
</div>
  
  

<script src="js/customJs/loginPage.js"></script>
<script>
	function formCheck(){
		let userId=document.querySelector("#userId");
		let userpw=document.querySelector("#userPw");
		let userpw2=document.querySelector("#userPw2");
		let userName=document.querySelector("#userName");

		if(userId.value===''||userId.value===null){
			alert("아이디를 입력해주세요");
			return false;
		}else if(userpw.value===''||userpw.value===null){
			alter("비밀번호를 입력해주세요");
			return false;
		}else if(userName.value===''||userName.value===null){
			alter("닉네임을 입력해주세요");
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