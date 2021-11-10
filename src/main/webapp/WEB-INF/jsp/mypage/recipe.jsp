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
						<a href="/recipe/detail_view?recipeId=${content.recipe.id}"><img src="${content.recipe.image}" class="mt-2" width="400px" height="400px"></a>
					</div>
					<div class="mt-1">
						<!-- 레시피 설명 부분 -->
						<div class="h-75">
							${content.recipe.description}
						</div>
						<!-- 좋아요 버튼 -->
						<div>
							<a href="#" data-recipe-id=${content.recipe.id} data-like-yn="${content.likeYn}" class="likeBtn"> 
							<c:choose>
							<c:when test="${content.likeYn eq true}">
								<img src="/static/images/icon/fillheart.png">
							</c:when>
							<c:otherwise>
								<img src="/static/images/icon/binheart.png">
							</c:otherwise> 
							</c:choose>
							</a>
							<small class="text-secondary">${content.countLike}개</small>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<script>
	$(document).ready(function(){
		//좋아요 버튼 클릭
		$('.likeBtn').on('click', function(e){
			e.preventDefault();
			var recipeId = $(this).data('recipe-id');
			var likeYn = $(this).data('like-yn');
			 if(likeYn == true){
					var url = '/recipe_like/delete';
				} else if(likeYn == false){
					var url = '/recipe_like/create';
				}
			$.ajax({
				type : 'post'
				, url : url
				, data : {
					'recipeId' : recipeId,
				}
				, success : function(data) {
					if (data.result == 'success') {
						location.reload();
					}
				}
				, error : function(e) {
					alert('error:' + e + "관리자에게 문의해주세요");
				}
			});
		});
	});
</script>
