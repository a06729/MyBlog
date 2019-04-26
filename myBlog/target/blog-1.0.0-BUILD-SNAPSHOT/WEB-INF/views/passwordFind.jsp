<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/flexboxgrid/6.3.1/flexboxgrid.min.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Lato:100,300,400'>
<link rel="stylesheet" href="css/customCss/loginPage.css">
<link rel="shortcut icon" type="image/x-icon" href="./image/logoIco.png" >
<style type="text/css" >
.wrap-loading { /*화면 전체를 어둡게 합니다.*/
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	background: rgba(0, 0, 0, 0.2); /*not in ie */
	filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',
		endColorstr='#20000000'); /* ie */
}

.wrap-loading div { /*로딩 이미지*/
	position: fixed;
	top: 50%;
	left: 50%;
	margin-left: -21px;
	margin-top: -21px;
}

.display-none { /*감추기*/
	display: none;
}
</style>
</head>
<body>
 <div class="container">
	<div class="row">
		<div class="col-md-8 col-md-offset-2 col-sm-12">	
			<div class="form">
		
				<form method="post">

					<h1>비밀번호 찾기</h1>

					<div class="input-group col-md-8 col-md-offset-2">
						<input type="text" id="username" name="username" class="input email">
						<label>가입시 등록한 이메일 주소</label>
					</div>
					<div class="input-group">
						<div class="col-md-4 col-md-offset-4">
							<button type="submit">
								비밀번호 찾기
							</button>							
						</div>
					</div>
<%-- 					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
				</form>
			</div>
			<div class="wrap-loading display-none">
			    <div><img src="./image/loding.gif" /></div>
			</div>
		</div>
	</div>
</div>
<script src="js/customJs/loginPage.js"></script>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$("button[type='submit']").on("click",function(e){
		e.preventDefault();
		let username=$('#username').val();
		console.log("username:"+username);
		$.ajax({
			data:{"username":username},
			type:"POST",
			url:'/passFind?${_csrf.parameterName}=${_csrf.token}',
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        dataType : "json",
	    	success:function(data){
	    		if(data<0){
	    			console.log("data:"+data);
	    			alert("잘못된 이메일 입니다.");
	    		}else if(data>0){
	    			console.log("data:"+data);
	    			alert("이메일을 전송했습니다 확인해주세요.");
	    			window.location.href="/";
	    		}
	    	},beforeSend:function(){
	    		$('.wrap-loading').removeClass('display-none');
	    	},complete:function(){
				$('.wrap-loading').addClass('display-none');
	    	}
		});	
	});

</script>
</body>
</html>