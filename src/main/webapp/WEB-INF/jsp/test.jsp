<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>
	<h1>test.jsp</h1>
	<c:forEach items="${testData}" var="test">
		<h5>${test.name}</h5>
	</c:forEach>
</body>
</html>