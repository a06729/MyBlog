<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/flexboxgrid/6.3.1/flexboxgrid.min.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Lato:100,300,400'>
<link rel="stylesheet" href="css/customCss/loginPage.css">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
</head>
<body>
 <div class="container">
	<div class="row">
		<div class="col-md-8 col-md-offset-2 col-sm-12">	
			<div class="form">
		
				<form method="post" action="/login">

					<h1>login Page</h1>
					<c:if test="${not empty errormsg}">
						<p>${errormsg}</p>
					</c:if>
					<div class="input-group col-md-8 col-md-offset-2">
						<input type="text" name="username" class="input email">
						<label>이메일</label>
					</div>
				
					<div class="input-group col-md-8 col-md-offset-2">
						<input type="password" name="password" class="input password">
						<label>비밀번호</label>
					</div>
			
					<div class="input-group">
						<div class="col-md-4 col-md-offset-4">
							<button type="submit">
								로그인
							</button>							
						</div>
					</div>
					<div class="forgot">
						<a href="/passFindPage">비밀번호 찾기</a>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>
			</div>
		</div>
	</div>
</div>
<script src="js/customJs/loginPage.js"></script>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</body>

</html>