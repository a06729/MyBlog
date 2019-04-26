<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./image/logoIco.png" >
<title>접근에러</title>
</head>
<body>
<h2><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"></c:out></h2>
<h2><c:out value="${msg}"></c:out></h2>

</body>
</html>