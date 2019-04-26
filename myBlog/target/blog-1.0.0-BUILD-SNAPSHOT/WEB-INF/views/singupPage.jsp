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
<link rel="shortcut icon" type="image/x-icon" href="./image/logoIco.png" >
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
						
						<div class="input-group col-md-4 col-md-offset-2">
							<button id="emailCheck">이메일 중복확인</button>
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
						
						<div class="input-group col-md-4 col-md-offset-2">
							<button id="nameCheck">닉네임 중복확인</button>
						</div>
						
						<div class="input-group">
							<div class="col-md-4 col-md-offset-4">
								<button id="singUpBtn" type="submit" class="singupBtn">
									SingUp
								</button>							
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<div id="Check">
							<input type="hidden" id=userNameCheck name="userNameCheck" value=''>
							<input type="hidden" id=userIdCheck name="userIdCheck" value=''>
						</div>
					</form>
				</div>
			</div>
		</div>
</div>
  
  

<script src="js/customJs/loginPage.js"></script>
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script>
	function formCheck(){
		let userId=document.querySelector("#userId");
		let userpw=document.querySelector("#userPw");
		let userpw2=document.querySelector("#userPw2");
		let userName=document.querySelector("#userName");
		
		console.log("userId.value:"+userId.value);
		console.log("userpw.value:"+userpw.value);
		
		if(userId.value===''||userId.value===null){
			alert("아이디를 입력해주세요");
			return false;
		}else if(userpw.value===''||userpw.value===null){
			alert("비밀번호를 입력해주세요");
			return false;
		}else if(userName.value===''||userName.value===null){
			alert("닉네임을 입력해주세요");
			return false;
		}else if($("#userIdCheck").val()>0||$("#userIdCheck").val()==''){
			alert("아이디 중복확인을 해주세요.");
			return false;
		}else if($("#userNameCheck").val()>0||$("#userNameCheck").val()==''){
			alert("닉네임 중복확인을 해주세요.");
			return false;
		}

		if (userpw.value===userpw2.value){
			return true;
		}else if(userpw.value!=userpw2.value){
			userpw2.focus();
			alert("비밀번호가 다릅니다");
			return false;
		}
		
// 		if($("#userIdCheck").val()<=0){
// 			return true;
// 		}
		
// 		if($("#userNameCheck").val()<=0){
// 			return true;
// 		}
		
	}
	$("#nameCheck").on("click",function(e){
		e.preventDefault();
		
		$.ajax({
			data:{"userName":$("#userName").val()},
			type:"POST",
			url:'/userNameCheck?${_csrf.parameterName}=${_csrf.token}',
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			dataType:"json",
			success:function(data){
				console.log(data);
				console.log($("#userName").val());
				if(data<=0){
					let userIdCheck='';
					alert("사용가능한 닉네임 입니다");
					userNameCheck='<input type="hidden" id=userNameCheck name="userNameCheck" value='+data+'>';
					$("#Check #userNameCheck").remove();
					$("#Check").append(userNameCheck);
				}else if(data>0){
					alert("중복된 닉네임 입니다.");
				}
			}
		});
	});
	$("#emailCheck").on("click",function(e){
		e.preventDefault();
		
		$.ajax({
			data:{"userId":$("#userId").val()},
			type:"POST",
			url:'/emailCheck?${_csrf.parameterName}=${_csrf.token}',
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			dataType:"json",
			success:function(data){
				console.log(data);
				console.log($("#userId").val());
				if(data<=0){
					let userIdCheck='';
					alert("사용가능한 이메일 입니다.");
					userIdCheck='<input type="hidden" id=userIdCheck name="userIdCheck" value='+data+'>';
					$("#Check #userIdCheck").remove();
					$("#Check").append(userIdCheck);
				}else if(data>0){
					alert("이미 가입된 이메일 입니다.");
				}
			}
		});
	});
</script>
</body>

</html>