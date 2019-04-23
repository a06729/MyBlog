<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>이슈사이트 - 회원정보</title>
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
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<br>
    <div class="row">
        <div class="large-12 columns">
             <form id="PsForm" action="" method="post" onsubmit="return PassCheck();">
	            <table class="unstriped" style="width: 100%">
	                <tr>
	                    <th>아이디</th>
	                    <td><span>${memberDto.userId}</span></td>
	                </tr>
	                <tr>
	                    <th>*기존 비밀번호</th>
	                    <td><input type="password" id="nowPass" name="nowPass"></td> 
	                </tr>
	                <tr>
	                	<th>비밀번호 변경</th>
	                	<td>
	                		<div>
	                			<p><label>새로운 비밀번호</label><input type="password" id="newPass" name="newPass"></p>
	                			<p>
	                				<label>비밀번호 재확인</label><input type="password" id="newPassCheck" name="newPassCheck"> 
	                				<input class="hollow button success" type="submit" value="비밀번호 변경">
	                			</p>
	                		</div>
	                	</td>
	                </tr>
	                <tr>
	                    <th>닉네임</th>
	                    <td><span>${memberDto.userName}</span></td>
	                </tr>
	                <tr>
	                    <th>가입날짜</th>
	                    <td><span>${memberDto.regdate}</span></td>
	                </tr>
	            </table>
	            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
           	</form>
        </div>
    </div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/multislider.js"></script>
	<script src="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
    	$(document).foundation();
    	
 	   	function PassCheck(e){
    		
 	   		if($("#nowPass").val()===null||$("#nowPass").val()===''){
    			$("#nowPass").focus();
    			alert("기존 비밀번호를 입력해주세요");
    			return false;
    		}
    		
    		if($("#newPassCheck").val()===null||$("#newPassCheck").val()===''){
    			$("#newPassCheck").focus();
    			alert("비밀번호 재확인 입력해주세요");
    			return false;
    		}
    		
    		if($("#newPass").val()===null||$("#newPass").val()===''){
    			$("#newPass").focus();
    			alert("변경할 비밀번호를 입력해주세요");
    			return false;
    		}
    		
    		if($("#newPass").val()!=$("#newPassCheck").val()){
    			$("#newPassCheck").focus();
    			alert("변경할 비밀번호가 일치 하지 않습니다.");
    			return false;
    		}else if($("#newPass").val()===$("#newPassCheck").val()){
    			changePass();
    			return false;
    		}
 
    	}
    	
 	   	function changePass(){
    		$.ajax({
    			data:{"nowPass":$("#nowPass").val(),
 					  "newPass":$("#newPass").val()},
 				type:"POST",
 				url:"/changePass?${_csrf.parameterName}=${_csrf.token}",
 				contentType:"application/x-www-form-urlencoded; charset=UTF-8",
 				dataType:"json",
 				success:function(data){
 					console.log(data);
 					if(data<=0){
 						alert("비밀번호가 일치 하지 않습니다.");
 					}else if(data>0){
 						alert("비밀번호가 변경되었습니다.");
 						window.location.href="/logout?${_csrf.parameterName}=${_csrf.token}";
 						let logoutForm=document.createElement("form");
 						
 						logoutForm.setAttribute("charset","UTF-8");
 						logoutForm.setAttribute("method","Post");
 						logoutForm.setAttribute("action","/logout");
 						
 						let hiddenField=document.createElement("input");
 						hiddenField.setAttribute("type","hidden");
 						hiddenField.setAttribute("name","${_csrf.parameterName}");
 						hiddenField.setAttribute("value","${_csrf.token }");
 						
 						logoutForm.appendChild(hiddenField);
 						document.body.appendChild(logoutForm);
 						logoutForm.submit();
 					}
 				}
    		});
 	   	}
 	   	
  	</script>
</body>
</html>