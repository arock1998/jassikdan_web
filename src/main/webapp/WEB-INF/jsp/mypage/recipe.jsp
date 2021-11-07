<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- mypage 탭 -->
<div class="d-flex">
	<a href="/mypage/refrigerator_view" class="bg-info w-50 text-center p-3" >냉장고 관리</a>
	<a href="#" class="bg-success w-50 text-center p-3">내가 올린 레시피</a>
</div>

<!-- 레시피 화면 -->
<div>
	<a href="/recipe/create_view" class="btn btn-secondary text-center w-100 mt-2">레시피 등록하기</a>
	<c:forEach items="${contentList}" var="content">
		<div class="recipeBox bg-light mt-3 d-flex">
			<div class="mx-5 my-3">
				<h3>${content.recipe.name}</h3>
				<div class="d-flex">
					<div class="mr-5">
						<a href="/recipe_course/detail_view?recipeId=${content.recipe.id}"><img src="${content.recipe.image}" class="mt-2" width="400px" height="400px"></a>
					</div>
					<div class="mt-1">
						<!-- 레시피 설명 부분 -->
						<div class="h-75">
							${content.recipe.description}
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>









