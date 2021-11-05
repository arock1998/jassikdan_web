<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="pt-3">
	<a href="/mypage/refrigerator_view" class="h1 font-weight-bold text-dark text-center">JASSiKDAN</a>
	<div class="float-right ml-2 mt-4">
		<c:choose>
			<c:when test="${fn:startsWith(viewName , 'timeline')}">
				<a href="/mypage/refrigerator_view" class="">냉장고 보러가기</a>
			</c:when>
			<c:when test="${fn:startsWith(viewName , 'user')}">
			<!-- 아무것도 표시하지 않음 -->
			</c:when>
			<c:otherwise>
			<a href="/timeline/timeline" class="">레시피 보러기기</a>
			</c:otherwise>
		</c:choose>
	</div>
	<div>
		<c:if test="${not empty userId}">
			<span class="font-weight-bold">${userName}님 안녕하세요</span> 
			<a href="/user/sign_out" class="font-weight-bold ml-3">로그아웃</a>
		</c:if>
	</div>
</div>