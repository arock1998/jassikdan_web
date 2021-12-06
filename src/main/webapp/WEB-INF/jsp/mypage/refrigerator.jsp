<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- mypage 탭 -->
<div class="d-flex">
	<a href="#" class="bg-info w-50 text-center p-3" >냉장고 관리</a>
	<a href="/mypage/recipe_view" class="bg-success w-50 text-center p-3">내가 올린 레시피</a>
</div>
<!-- 재료 검색 -->
	<div class="ingrdSelectBox col-3">
	<!-- 검색창 -->
		<div>
			<input list="ingrdList" type="search" class="form-control" placeholder="재료이름, 분류">
		</div>
	<!-- 검색결과 --><!-- TODO: 끌어다가 냉장고에만 들어갈 수 있도록 만든다. -->
		<div class=" ingrdIconBox d-flex flex-wrap overflow-auto" >
		<c:forEach items="${ingrdList}" var="ingrd">
			<div id="${ingrd.id }" class="ingrdIcon pointer" draggable="true" ondragstart="drag(event)" >
				<img class="border" src="/static/images/ingrd/${ingrd.nameEng}.png" alt="${ingrd.name}" draggable="false" >
				<small>${ingrd.name}</small>
			</div>
		</c:forEach>
		</div>	
	</div>

<div class="d-flex mt-5">
	<!-- 냉장고 -->
	<div class="d-flex justify-content-around mb-5 " >
		<!-- 냉동실 -->
		<div id="layer1" class="refrigeratorDoor d-flex flex-wrap rounded mr-5" ondrop="drop(event)" ondragover="allowDrop(event)"> 
		<c:forEach items="${ingrdIhaveList}" var="ingrd">
			<div id="${ingrd.id }" class="card cursor ingrdIcon m-1 text-center" data-ingrd-id="${ingrd.id}" oncontextmenu='return false'> <!-- ingrd_ihave의 아이디를 가진다.(primaryKey) , oncontextmenu 우측마우스 기본동작 없애기	 -->
				<!-- 재료 영어이름의 띄어쓰기는 '_'로 등록되어있다. -->
				<img class="border" src="/static/images/ingrd/${ingrd.nameEng}.png" alt="">
				<small>${ingrd.name} <br>
				${ingrd.amount}</small>
			</div>
			</c:forEach>
		</div>
		<!-- 냉장실 -->
		<div class="refrigeratorDoor rounded d-flex align-items-end justify-content-end"> 
			<!-- 재료 추가하기 뷰로 가는 버튼 -->
			<a href="/mypage/insert_ingrd_view" type="button" class="btn" >
			 	<img src="https://w7.pngwing.com/pngs/833/426/png-transparent-black-shopping-cart-icon-for-free-black-shopping-cart-icon.png" class="w-100 h-100">
			</a>
		</div>
	</div>
</div>

<style>
#div1 {
  width: 350px;
  height: 70px;
  padding: 10px;
  border: 1px solid #aaaaaa;
}
</style>

<!-- 재료 아이콘 우측 클릭시 나타나는 레이어 창 -->
<div class="popupLayer">
	<div>
		<span class="closeLayer" onClick="closeLayer(this)" title="닫기">X</span>
	</div>
	<a class="deleteBtn" href="#">삭제하기</a>
</div>

<script>
	$(document).ready(function(){
	//ingrdIconLayter창 띄우기
 	$('.ingrdIcon').on('mousedown', function(e){
		//우측 마우스 클릭으로 레이어창 띄우기
		if ((event.button == 2) || (event.which == 3)) {
			var ingrdId = $(this).data('ingrd-id');
			$('.popupLayer').data('ingrd-id', ingrdId);
			//클릭한 곳의 위치를 잡는다.
			var pos = $(this).position(); 
			$('.popupLayer').css({
				"top": (pos.top) + 'px'
				, "left": (pos.left) + 'px'
			}).show();
		}
	}); 
	//가지고 있는 재료 삭제
	$('.deleteBtn').on('click', function(){
		var ingrdId = $(this).parent().data('ingrd-id');
 		$.ajax({
			type:'get'
			, url : '/ingrd_ihave/delete?ingrdId=' + ingrdId
			, success : function(data){
				if(data.result == 'success'){
					alert('성공');
					location.reload();
				} else {
					alert('삭제실패');
				}
			}, error : function(e){
				alert('error' + e);
			}
		}) ;
	});
});
	function closeLayer( obj ) {
		$(obj).parent().parent().hide();
	}
 	function allowDrop(e){
 		e.preventDefault();
 	}
 	function drag(e){
 		e.dataTransfer.setData("text", e.target.id);
 	}
 	function drop(e){
 		e.preventDefault();
 		var data = e.dataTransfer.getData("text");
 		e.target.appendChild(document.getElementById(data)); 	
 	}

</script>


    