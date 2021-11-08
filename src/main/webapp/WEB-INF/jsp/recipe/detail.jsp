<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="d-flex courseContent justify-content-around mb-3" data-recipe-id="${recipeId}" data-count="${count}" data-num="${cookingNo}">
	<!-- 이전버튼 -->
	<div class="arrowBox mb-3 d-flex align-items-center ">
		<a href="/recipe_course/detail_view?recipeId=${recipeId}&cookingNo=${cookingNo-1}" class="prev"><img src="/static/images/icon/prev.png" class="w-100" ></a>
	</div>
	<!-- 레시피 정보를 보여준다. -->
    <div class="courseBox bg-light center-block">
	    <img src="${course.image}" class="bg-dark" alt="요리 정보" >
	    <div class="p-2">${course.description}</div>
	</div>	
	<!-- 다음 버튼 -->
	<div class="arrowBox d-flex align-items-center">
		<a href="/recipe_course/detail_view?recipeId=${recipeId}&cookingNo=${cookingNo+1}" class="next"><img src="/static/images/icon/next.png" ></a>
	</div>
	
</div>
<button type="button" class="btn btn-primary w-100 mb-5">이 레시피 사용하기</button>

<script>
	$(document).ready(function(){
		//이전버튼을 눌렀을 경우
		$('.prev').on('click', function(e){
			e.preventDefault();
			var num = $('.courseContent').data('num');
			var url = $(this).attr('href');
			alert('한번 막았습니다.');
			if(num <= 1){
				return false;
			}
			location.href= url;
		});
		
		//다음 버튼을 눌렸을 때
		$('.next').on('click', function(e){
			e.preventDefault();
			var num = $('.courseContent').data('num');
			var count = $('.courseContent').data('count');
			var url = $(this).attr('href');
			alert('한번 막았습니다.');
			if(num > count){
				return false;
			}
			location.href=url;
		});
	});
</script>