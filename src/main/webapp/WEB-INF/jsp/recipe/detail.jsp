<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="d-flex courseContent justify-content-around mb-3" data-recipe-id="${recipeId}" data-count="${count}" data-num="${cookingNo}">
	<!-- 이전버튼 -->
	<div class="arrowBox mb-3 d-flex align-items-center ">
		<a href="/recipe/detail_view?recipeId=${recipeId}&cookingNo=${cookingNo-1}" class="prev"><img src="/static/images/icon/prev.png" class="w-100" ></a>
	</div>
	<!-- 레시피 정보를 보여준다. -->
    <div class="courseBox bg-light center-block">
	    <img src="${course.image}" class="bg-dark mb-2" alt="요리 정보" >
	    <div class="p-2 h-25">${course.description}</div>
	    <div class="p-2">${cookingNo}/${count}</div>
	</div>	
	<!-- 다음 버튼 -->
	<div class="arrowBox d-flex align-items-center">
		<a href="/recipe/detail_view?recipeId=${recipeId}&cookingNo=${cookingNo+1}" class="next"><img src="/static/images/icon/next.png" ></a>
	</div>
</div>
<button type="button" class="btn btn-primary w-100 mb-5" data-toggle="modal" data-target="#courseModal">이 레시피 사용하기</button>

<!-- Modal -->
<div class="modal fade" id="courseModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">필요한 재료</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <!-- modal body -->
      <div class="modal-body">
		<table class="table text-center">
			<thead>
				<tr>
					<th>재료명</th><th>필요한 량</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${recipeIngrdList}" var="ingrd">
				<tr>
					<td>${ingrd.ingrdName}</td><td>${ingrd.amount}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
      </div>
      <div class="modal-footer">
		<c:if test="${isEnough eq false}">
		<button class="w-50 btn btn-danger text-white courseModalBtn"><small>재료가 부족합니다.</small><br><b>장보러가기</b></button>
		</c:if>
		<button id="useRecipeBtn" class="w-50 btn btn-primary text-white courseModalBtn"><b>재료 사용하여 레시피 만들기</b></button>
      </div>
    </div>
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