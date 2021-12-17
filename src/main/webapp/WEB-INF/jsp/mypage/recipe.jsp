<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- /mypage/recipe_view -->
<!-- 레시피 화면 -->
<div class="mt-3 d-flex flex-wrap justify-content-around">
	<c:forEach items="${contentList}" var="content">
	<div class="recipeBox mr-2 mb-3 " data-recipe-id="${content.recipe.id}">
		<div class="recipeImg goCourseBtn pointer">
			<img src="${content.recipe.image}" class="w-100 h-100">
		</div>
		<div class="p-1">
			<div class="goCourseBtn pointer">
				${content.recipe.name}
			</div>
			<div>
				<c:forEach items="${content.sharp}" var="sharp">
					<a href="#" class="text-primary"><small>#</small><small>${sharp}</small></a>
				</c:forEach>
			</div>
			<div class="d-flex align-items-center">
				<!-- 좋아요 -->
				<div class="d-flex mr-3 align-items-center">			
					<div class="likeBtn mr-1" data-recipe-id="${content.recipe.id}" data-like-yn="${content.likeYn}">
						<c:if test="${content.likeYn eq true }">
							<img src="/static/images/icon/fillheart.png" width="30px">
						</c:if>
						<c:if test="${content.likeYn eq false }">
							<img src="/static/images/icon/binheart.png" width="30px">
						</c:if>
					</div>
					<div class="font-size-10">
						${content.countLike}
					</div>
				</div>
				<!-- 리뷰 -->
				<div class="">
					<div class="font-size-10">
						리뷰개수
					</div>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>
</div>

<script>
	$(document).ready(function(){
		//조리과정 view로 이동
		$('.goCourseBtn').on('click', function(){
			var recipeId = $(this).parents('.recipeBox').data('recipe-id');
			location.href="/recipe/detail_view?recipeId=" + recipeId; 
		});
		
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
