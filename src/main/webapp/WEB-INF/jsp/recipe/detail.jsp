<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- recipe/detail_view -->
<div id="recipeDetailContainer" class="w-100">
	<div class="my-3 text-center">
		<div class="mb-1">
			<img src="${recipe.image}" width="400px">
		</div>
		<div >
			<h1 class="">${recipe.name}</h1>
		</div>
	</div>
	<!-- 재료목록 들어가는 곳 -->
	<div class="">
		<div class="d-flex flex-wrap">
			<table class="table w-50">
				<thead>
					<tr>
						<th>재료</th><th>필요한 량</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${recipeIngrdList}" var="ingrd">
					<tr>
						<td>${ingrd.name}</td><td>${ingrd.amount} + ${ingrd.unit}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 조리과정 들어가는 곳 -->
	<div class="bg-whitegreen mb-5 p-5">
		<div class="text-green font-weight-bold">Recipe</div> <br>
		<c:forEach items="${courseList}" var="course" >
		<div class="mb-3">
			<div class="bg-green smallCircle text-white text-center font-weight-bold mb-1">${course.cookingNo}</div>
			<div class="mb-1">
				<img src="${course.image}" alt="${course.cookingNo}" width="300px">
			</div>
			<div>
				<span>
					${course.description}
				</span>
			</div>
		</div>
		</c:forEach>
	</div>
	<button type="button" class="btn btn-primary w-100 mb-5" data-toggle="modal" data-target="#courseModal">이 레시피 사용하기</button>
</div>

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