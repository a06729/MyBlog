<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<a href="/"><img alt="" src="/image/logo.png"></a>
<header>
	<div class="title-bar" data-responsive-toggle="example-menu" data-hide-for="medium">
	  <div class="top-bar-right">
	      <button class="menu-icon" type="button" data-toggle="example-menu"></button>
	  </div>
	</div>
	
	<div class="top-bar" id="example-menu">
		<div class="top-bar-left">
			<ul class="dropdown menu" data-dropdown-menu>
<!-- 				<li class="menu-text"><a href="/">이슈사이트</a></li> -->
				<li class="has-submenu"><a href="#">카테고리</a>
					<ul class="submenu menu vertical" data-submenu>
						<li><a href="/tagPage?category=정치/사회">정치/사회</a></li>
						<li><a href="/tagPage?category=경제">경제</a></li>
						<li><a href="/tagPage?category=페미니즘">페미니즘</a></li>
					</ul></li>
<!-- 				<li><a href="#0">Two</a></li> -->
<!-- 				<li><a href="#0">Three</a></li> -->
			</ul>
		</div>
		<div class="top-bar-right">
			<ul class="menu">
				<sec:authorize access="isAnonymous()">
					<li><a href="/loginPage">로그인</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li>
						<form action="/userInfo" method="get">
							<input class="hollow button" style="width: auto;" type="submit" value="회원정보 ">
						</form>
					</li>
					<li>
						<form action="/logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
							<input class="hollow button alert" type="submit" style="width: auto;" value="로그아웃">
						</form>
					</li>
				</sec:authorize>
			</ul>
		</div>
	</div>
</header>