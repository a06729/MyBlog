<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.5.3/dist/css/foundation.min.css" integrity="sha256-xpOKVlYXzQ3P03j397+jWFZLMBXLES3IiryeClgU5og= sha384-gP4DhqyoT9b1vaikoHi9XQ8If7UNLO73JFOOlQV1RATrA7D0O7TjJZifac6NwPps sha512-AKwIib1E+xDeXe0tCgbc9uSvPwVYl6Awj7xl0FoaPFostZHOuDQ1abnDNCYtxL/HWEnVOMrFyf91TDgLPi9pNg==" crossorigin="anonymous">
        <title>관리자 페이지</title>
        <style>
            .topbar-responsive {
                background: #2c3840;
                padding: 1rem 1.5rem;
            }
        
            .topbar-responsive .topbar-responsive-logo {
                color: #fefefe;
                vertical-align: middle;
            }
        
            .topbar-responsive .menu {
                background: #2c3840;
            }
        
            .topbar-responsive .menu li:last-of-type {
                margin-right: 0;
            }
        
            .topbar-responsive .menu a {
                color: #fefefe;
                transition: color 0.15s ease-in;
            }
        
            .topbar-responsive .menu a:hover {
                color: #c6d1d8;
            }
        
            @media screen and (max-width: 39.9375em) {
                .topbar-responsive .menu a {
                    padding: 0.875rem 0;
                }
            }
        
            .topbar-responsive .menu .topbar-responsive-button {
                color: #fefefe;
                border-color: #fefefe;
                border-radius: 5000px;
                transition: color 0.15s ease-in, border-color 0.15s ease-in;
            }
        
            .topbar-responsive .menu .topbar-responsive-button:hover {
                color: #c6d1d8;
                border-color: #c6d1d8;
            }
        
            @media screen and (max-width: 39.9375em) {
                .topbar-responsive .menu .topbar-responsive-button {
                    width: 100%;
                    margin: 0.875rem 0;
                }
            }
        
            @media screen and (max-width: 39.9375em) {
                .topbar-responsive {
                    padding: 0.75rem;
                }
        
                .topbar-responsive .top-bar-title {
                    position: relative;
                    width: 100%;
                }
        
                .topbar-responsive .top-bar-title span {
                    position: absolute;
                    right: 0;
                    border: 1px solid #fefefe;
                    border-radius: 5px;
                    padding: 0.25rem 0.45rem;
                    top: 50%;
                    -webkit-transform: translateY(-50%);
                    -ms-transform: translateY(-50%);
                    transform: translateY(-50%);
                }
        
                .topbar-responsive .top-bar-title span .menu-icon {
                    margin-bottom: 4px;
                }
            }
        
            @-webkit-keyframes fadeIn {
                from {
                    opacity: 0;
                }
        
                to {
                    opacity: 1;
                }
            }
        
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
        
                to {
                    opacity: 1;
                }
            }
        
            @-webkit-keyframes slideDown {
                0% {
                    -webkit-transform: translateY(-100%);
                    transform: translateY(-100%);
                }
        
                100% {
                    -webkit-transform: translateY(0%);
                    transform: translateY(0%);
                }
            }
        
            @keyframes slideDown {
                0% {
                    -webkit-transform: translateY(-100%);
                    transform: translateY(-100%);
                }
        
                100% {
                    -webkit-transform: translateY(0%);
                    transform: translateY(0%);
                }
            }
        
            @media screen and (max-width: 39.9375em) {
                .topbar-responsive-links {
                    -webkit-animation-fill-mode: both;
                    animation-fill-mode: both;
                    -webkit-animation-duration: 0.5s;
                    animation-duration: 0.5s;
                    width: 100%;
                    -webkit-animation: fadeIn 1s ease-in;
                    animation: fadeIn 1s ease-in;
                }
            }
        </style>
    </head>
    <body>
    <nav class="top-bar topbar-responsive">
        <div class="top-bar-title">
            <span data-responsive-toggle="topbar-responsive" data-hide-for="medium">
                <button class="menu-icon" type="button" data-toggle></button>
            </span>
            <a class="topbar-responsive-logo" href="/"><strong>홈페이지</strong></a>
        </div>
        <div id="topbar-responsive" class="topbar-responsive-links">
            <div class="top-bar-right">
                <ul class="menu simple vertical medium-horizontal">
                    <li><a href="/admin/boardList">게시글 목록</a></li>
                    <li><a href="/admin/IdListPage">아이디 관리</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <table>
        <thead>
            <tr>
                <th width="200">아이디</th>
                <th>닉네임</th>
                <th width="150">가입 날짜</th>
                <th width="150">정보 수정날짜</th>
                <th width="150">권한</th>
                <th width="150">계정삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="list" items="${idList}">
            <tr>
                <td>${list.userId}</td>
                <td>${list.userName}</td>
                <td>${list.regdate}</td>
                <td>${list.updateDate}</td>
                <td>
	              	<form name="ChangeAuth" action="">
		              	<c:forEach var="authList" items="${list.authList}">
			          		<select id="auth" name="auth">
								<option value="ROLE_MEMBER" <c:out value="${authList.auth eq 'ROLE_MEMBER' ?'selected':''}"/>>유저</option>
								<option value="ROLE_ADMIN" <c:out value="${authList.auth eq 'ROLE_ADMIN' ?'selected':''}"/>>관리자</option>
			          		</select>
		               </c:forEach>
		               <input id="userId" name="userId" type="hidden" value="${list.userId}">
		               <input name="ChangeAuthButton" type="submit" value="권한변경" class="hollow button success">
	               </form>
                </td>
                <td>
	               	<form name="DelectForm" action="">
		               	<input name="DelectButton" type="submit" value="계정삭제" class="alert button">
		               	<input id="userId" name="userId" type="hidden" value="${list.userId}">
	               	</form>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    
	<form id="searchForm" action="/admin/IdListPage" method="get">
	   <div class="grid-x">
	       <div class="cell small-2">
	           <select name="type">
				<option <c:out value="${pageMaker.cri.type==null?'selected':''}"/> ></option> 
				<option value="I" <c:out value="${pageMaker.cri.type eq 'I' ?'selected':''}"/>>아이디</option>
				<option value="N" <c:out value="${pageMaker.cri.type eq 'N' ?'selected':''}"/>>닉네임</option>
	          </select>
	       </div>
	       <div class="cell small-8">    
	        <input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'/>
			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"></c:out>'>
			<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"></c:out>'>
	       </div>
	       <div class="cell small-2">
<!-- 	    <input type="button" > -->
	       	<button class="hollow button">검색</button>
	       </div>
	   </div>
	</form>
	<form id="actionForm" action="/admin/IdListPage" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"></c:out>'>
		<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
	</form>
    <div class="row">
        <div class="columns">
            <nav aria-label="Pagination">
                    <ul class="pagination text-center">
                        <c:if test="${pageMaker.prev}">
                        	<li class="paginate_button pagination-previous">
                        	<a href="${pageMaker.startPage-1}">Previous</a>
                        	</li>
                        </c:if>
                        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                        	<li class="paginate_button ${pageMaker.cri.pageNum==num ?"current":""}"><a href="${num}" aria-label="Page ${num}">${num}</a></li>
                        </c:forEach>
                         <c:if test="${pageMaker.next}">
                         	<li class="paginate_button pagination-next"><a href="${pageMaker.endPage+1}" aria-label="Next page">Next</a></li>
                         	
                         </c:if>    
                    </ul>
            </nav>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/what-input/4.2.0/what-input.min.js" integrity="sha256-7wGy9IEPmo9Jk/I86siWbZFPeclfjFitAAfmvxBUc7k=" crossorigin="anonymous"></script> -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.1/js/foundation.min.js" integrity="sha256-Nd2xznOkrE9HkrAMi4xWy/hXkQraXioBg9iYsBrcFrs=" crossorigin="anonymous"></script>   -->
    <script src="https://cdn.jsdelivr.net/npm/foundation-sites@6.5.3/dist/js/foundation.min.js" integrity="sha256-/PFxCnsMh+nTuM0k3VJCRch1gwnCfKjaP8rJNq5SoBg= sha384-9ksAFjQjZnpqt6VtpjMjlp2S0qrGbcwF/rvrLUg2vciMhwc1UJJeAAOLuJ96w+Nj sha512-UMSn6RHqqJeJcIfV1eS2tPKCjzaHkU/KqgAnQ7Nzn0mLicFxaVhm9vq7zG5+0LALt15j1ljlg8Fp9PT1VGNmDw==" crossorigin="anonymous"></script>
    <script>
        $(document).foundation();
        
        let actionForm=$("#actionForm");
        
        let searchForm=$('#searchForm');
        
        $(".paginate_button a").on("click",function(e){
        	e.preventDefault();
        	
        	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
        	
        	console.log("actionForm.find().val():"+actionForm.find("input[name='pageNum']").val());
        	console.log("$(this).attr():"+$(this).attr("href"));//$(this).attr("href");는 .paginate_button a의 a태그의 href값을 return한다.
        	
        	actionForm.submit();
        });
        
        $("#searchForm button").on('click',function(e){
        	e.preventDefault();
        	
    		if(!searchForm.find('option:selected').val()&&searchForm.find('option:selected').val()==""){
    			alert("검색종류를 선택하세요");
    			return false;
    		}
    		if(!searchForm.find("input[name='keyword']").val()&&searchForm.find("input[name='keyword']").val()==""){
    			alert("키워들르 입력하세요. ");
    			return false;
    		}
    		searchForm.find("input[name='pageNum']").val("1");
    		
    		searchForm.submit();
    	});
        
      	$("form[name='DelectForm']").on("submit",function(e){
        	e.preventDefault();
        	let pageNum=$("input[name='pageNum']").val();
        	let amount=$("input[name='amount']").val();
        	let type=$("input[name='type']").val();
        	let keyword=$("input[name='keyword']").val();
        	
        	$.ajax({
        		data:{"userId":$(this).find("input[name='userId']").val()},
        		type:"POST",
        		url:'/admin/IdDelete?${_csrf.parameterName}=${_csrf.token}',
        		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        		dataType:"json",
        		success:function(data){
        			alert(data+"계정 삭제");
        			window.location.href="/admin/IdListPage?pageNum="+pageNum+"&amount="+amount+"&type="+type+"&keyword="+keyword+""
        		}
        	});
        });
      	
      	$("form[name='ChangeAuth']").on("submit",function(e){
      		e.preventDefault();
      		
        	let pageNum=$("input[name='pageNum']").val();
        	let amount=$("input[name='amount']").val();
        	let type=$("input[name='type']").val();
        	let keyword=$("input[name='keyword']").val();
        	
        	$.ajax({
        		data:{"userId":$(this).find("input[name='userId']").val(),
        			  "auth":$(this).find("#auth option:selected").val()},
        		type:"POST",
        		url:'/admin/AuthChange?${_csrf.parameterName}=${_csrf.token}',
        		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        		dataType:"json",
        		success:function(data){
        			if(data.auth=='ROLE_MEMBER'){
        				alert("유저로 권한 변경");
        			}else if(data.auth=='ROLE_ADMIN'){
        				alert("관리자로 권한 변경");
        			}
        			
        			window.location.href="/admin/IdListPage?pageNum="+pageNum+"&amount="+amount+"&type="+type+"&keyword="+keyword+""
        		}
        	});
      	
      	});
        
    </script>
    </body>
</html>


