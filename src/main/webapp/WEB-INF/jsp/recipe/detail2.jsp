<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- /recipeCourse/detail_view -->
<h1>${isNull}</h1>

<div class="d-flex courseContent justify-content-around mb-3" data-recipe-id="${recipeId}" data-count="${count}" data-num="${cookingNo}">
	<!-- 이전버튼 -->
	<div class="arrowBox mb-3 d-flex align-items-center" >
		<a href="/recipe/detail_view?recipeId=${recipeId}&cookingNo=${cookingNo-1}" class="prev"><img src="/static/images/icon/prev.png" class="w-100" ></a>
	</div>
	<!-- 레시피 정보를 보여준다. -->
    <div class="courseBox bg-light center-block">
     	<div class="mb-2 p-3 h-50">
			<img src="${course.image}" class="w-100 h-100"><br>
		</div>
	    <div class="p-2 h-25">${course.description}</div>
	    <div class="p-2">${cookingNo}/${count}</div>
	</div>	
	<!-- 다음 버튼 -->
	<div class="arrowBox mb-3 d-flex align-items-center" >
		<a href="/recipe/detail_view?recipeId=${recipeId}&cookingNo=${cookingNo+1}" class="next"><img src="/static/images/icon/next.png" ></a>
	</div>
</div>




<script>
	$(document).ready(function(){
		//이전버튼을 눌렀을 경우
		$('.prev').on('click', function(e){
			e.preventDefault();
			var num = $('.courseContent').data('num');
			var url = $(this).attr('href');
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
			if(num >= count){
				return false;
			}
			location.href=url;
		});
		
		//재료 사용하여 레시피 만들기
		$('#useRecipeBtn').on('click', function(){
			var recipeId = $('.courseContent').data('recipeId');
			$.ajax({
				type:'post'
				, url:'/mypage/use_recipe'
				, data : {'recipeId': recipeId}
				, success : function(data){
					if(data.result == 'success'){
						alert('이 레시피를 사용하셨습니다.');
					}
				}, error : function(e){
					alert('error:' + e);
				}
			});
		});
	});
</script>