<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- /timeline/timeline -->
<div class="d-flex justify-content-center mt-4 mb-3 w-100">
	<div class="w-50">
		<!-- 검색창 -->
		<div class=" d-flex mb-2">
			<div class="input-group">
				<input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요">
				 <div class="input-group-append">
				    <button id="searchBtn" class="btn btn-outline-secondary" type="submit">Search</button>
				</div>
			</div>
		</div>
		<!-- 샾검색어 상자 -->
		<div class="sharpKeyWordBox">
			<label for="onlyIngrdRefrigerator" class="mx-2">#냉장고 속 재료로만 검색 <input type="checkbox" id="onlyIngrdRefrigerator" class=""></label> 
			<c:forEach items="${sharpList}" var="sharp">
			<c:if test="${sharp ne ''}">
				<span class="mx-2 deleteSpan">#<span class="sharpKeyWord">${sharp.keyword}</span><a href="#" class="sharpKeyWordDelete" data-sharp-id=${sharp.id}>X</a></span	>
			</c:if>
			</c:forEach>
		</div>
	</div>
</div>

<!-- 레시피 담는 곳 -->
<div class="d-flex flex-wrap">
	<c:forEach items="${contentList}" var="content">
	<div class="recipeBox mr-2 mb-2 " data-reicpe-id="${content.recipe.id}">
		<div class="recipeImg goCourseBtn pointer">
			<img src="${content.recipe.image}">
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
		//해시태그 추가
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
		
		//해시태그 삭제
		$('.sharpKeyWordDelete').on('click', function(e){
			e.preventDefault();
			var  sharpId = $(this).data('sharp-id');
			$.ajax({
				type : "post"
				, url : "/sharp/delete"
				, data : {"sharpId" : sharpId}
				, success : function(data){
					if(data.result == 'success'){
						location.reload();
					} else {
						alert("관리자에게 문의해주세요");
					}
				}
				, error : function(e){
					alert("error: " + e);
				}
			});
		});
		
		//조리과정 view 로 이동
		$('.goCourseBtn').on('click', function(){
			var recipeId = $(this).data('recipe-id');
			location.href="/recipe/detail_view?recipeId=" + recipeId;
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
