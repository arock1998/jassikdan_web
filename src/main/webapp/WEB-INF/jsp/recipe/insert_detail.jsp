<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- 넘어오는 주소 //recipe/insert_detail_view?cookingNo=1 --> 
<div class="d-flex courseContent justify-content-around mb-3" data-cooking-no="${cookingNo}">
	<!-- 이전버튼 -->
	<div class="arrowBox mb-3 d-flex align-items-center ">
		<a href="/recipe/create_detail_view?cookingNo=${cookingNo-1}" class="prev"><img src="/static/images/icon/prev.png" class="w-100" ></a>
	</div>
	<!-- 레시피 정보를 등록할 수 있다. -->
 	<div>
 		<c:if test="${recipe ne null}">
			<input class="form-control courseImage" type="file"><!-- 사진 파일 등록이 요소는 아니지만 필수로 받기로 하자 -->
			<!-- recipe 정보가 있을 경우 레시피 정보를 보여준다 img src를 사용해서 -->
			<input class="form-control courseText" name="description" type="text" placeholder="음식설명" value="${recipe.description }">
		</c:if>
		<c:if test="${recipe eq null }">
			<input class="form-control courseImage" type="file"><!-- 사진 파일 등록이 요소는 아니지만 필수로 받기로 하자 -->
			<!-- recipe 정보가 있을 경우 레시피 정보를 보여준다 img src를 사용해서 -->
			<input class="form-control courseText" name="description" type="text" placeholder="음식설명" >
		</c:if>
	</div>		
	<!-- 다음 버튼 -->
	<div class="arrowBox d-flex align-items-center">
		<a href="/recipe/create_detail_view?cookingNo=${cookingNo+1}" class="next"><img src="/static/images/icon/next.png"></a>
	</div>
</div>
<button type="button" class="btn btn-primary w-100 mb-5" data-toggle="modal" data-target="#courseModal">저장하기</button>


<script>
	$(document).ready(function(){
		var cookingNo = $('.courseContent').data('cooking-no');
		//이전버튼을 눌렀을 경우
		$('.prev').on('click', function(e){
			e.preventDefault();
			var num = $('.courseContent').data('num');
			var url = $(this).attr('href');
			if(num <= 1){
				return false;
			}
			$.ajax({
				type:'post'
				, url:'/recipe/insert_detail'
				, data : {'cookingNo': cookingNo, 'image': courseImage, 'description': courseText }
				, success : function(data){
					if(data.result == 'success'){
						location.href=url;
					}
				}
				, error : function(e){
					alert('error:' + e);
				}
			});
		});
		
		//다음 버튼을 눌렸을 때
		$('.next').on('click', function(e){
			e.preventDefault();
			var courseImage = $('.courseImage').val().trim();
			var courseText = $('.courseText').val().trim();
			if(courseImage == ''){
				alert('이미지를 등록해주세요');
				return false;
			}
			if(courseText == ''){
				alert('설명을 등록해주세요');
				return false;
			}
			var num = $('.courseContent').data('num');
			var count = $('.courseContent').data('count');
			var url = $(this).attr('href');
			if(num >= count){
				return false;
			}
			
			$.ajax({
				type:'post'
				, url:'/recipe/insert_detail'
				, data : {'cookingNo': cookingNo, 'description': courseText }
				, success : function(data){
					if(data.result == 'success'){
						location.href=url;
					}
				}
				, error : function(e){
					alert('error:' + e);
				}
			});
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
					alert('errpr:' + e);
				}
			});
		});
	});
</script>