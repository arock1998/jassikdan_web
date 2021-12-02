<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 검색창 -->
<div class="input-group mb-3">
	<input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요">
	 <div class="input-group-append">
	    <button id="searchBtn" class="btn btn-outline-secondary" type="submit">Search</button>
	</div>
</div>
<!-- 샾검색어 상자 -->
<div class="sharpKeyWordBox">
	<label for="onlyIngrdRefrigerator" class="mx-2">#냉장고 속 재료로만 검색 <input type="checkbox" id="onlyIngrdRefrigerator" class=""></label> 
	<c:forEach items="${sharpList}" var="sharp">
	<c:if test="${sharp ne ''}">
		<span class="mx-2 deleteSpan">#<span class="sharpKeyWord">${sharp.keyword}</span><a href="#" class="sharpKeyWordDelete" data-sharp-id=${sharp.id }>X</a></span	>
	</c:if>
	</c:forEach>
</div>
<!-- 검색결과를 보여준다. -->
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
					<div class="h-50">
						${content.recipe.description}
					</div>
					<!-- sharp -->
					<div class="h-25">
						<c:forEach items="${content.sharp}" var="sharp">
							<a href="#" class="text-primary"><span>#</span>${sharp}  </a>
						</c:forEach>
					</div>
					<!-- 좋아요 버튼 -->
					<div>
						<a href="#" data-recipe-id=${content.recipe.id } data-like-yn="${content.likeYn}" class="likeBtn"> 
						<c:if test="${content.likeYn eq true }">
							<img src="/static/images/icon/fillheart.png">
						</c:if>
						<c:if test="${content.likeYn eq false}">
							<img src="/static/images/icon/binheart.png">
						</c:if> 
						</a>
						<small class="text-secondary">${content.countLike}개</small>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<script>
	$(document).ready(function(){
		//검색어 추가
		$('#searchBtn').on('click', function(e){
			var keyword = $('#keyword').val().trim();
			if(keyword == ''){
				return false;
			}
			$.ajax({
				type:'get'
				, url : '/sharp/insert'
				, data : {'keyword': keyword}
				, success : function(data){
					location.reload();
				}
				, error : function(e){
					alert('error:' + e);
				}
			})			
		});	
		
		//좋아요 버튼 클릭
		$('.likeBtn').on('click', function(e){
			e.preventDefault();
			var recipeId = $(this).data('recipe-id');
			var likeYn = $(this).data('like-yn');
			 if(likeYn){
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
