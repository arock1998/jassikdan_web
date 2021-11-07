<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- mypage 탭 -->
<div class="d-flex">
	<a href="#" class="bg-info w-50 text-center p-3" >냉장고 관리</a>
	<a href="/mypage/recipe_view" class="bg-success w-50 text-center p-3">내가 올린 레시피</a>
</div>
<!-- 냉장고 -->
<div class="d-flex justify-content-around mt-4 mb-5">
	<!-- 냉동실 -->
	<div class="refrigeratorDoor d-flex flex-wrap rounded"> 
	<c:forEach items="${ingrdList}" var="ingrd">
		<div class="card cursor ingrdIcon m-1 text-center" data-ingredient-id="${ingrd.id}" >
			<!-- 재료 영어이름의 띄어쓰기는 '_'로 등록되어있다. -->
			<img class="border" src="/static/images/ingrd/${ingrd.nameEng}.png" alt="" >
			<small>${ingrd.name} <br>
			${ingrd.amount}</small>
		</div>
		</c:forEach>
	</div>
	<!-- 냉장실 -->
	<div class="refrigeratorDoor rounded d-flex align-items-end justify-content-end"> 
		<a href="/mypage/insert_ingrd_view" type="button" class="btn btn-primary" >
		 	plus plus plus
		</a>
	</div>
</div>
    