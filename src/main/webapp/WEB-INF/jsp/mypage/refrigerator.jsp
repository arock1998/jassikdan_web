<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- mypage 탭 -->

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
	<!-- 휴지통 -->
	<div>
		
	</div>

<div class="d-flex mt-5">
	<!-- 냉장고 -->
	<div class="d-flex justify-content-around mb-5 " >
		<!-- 냉동실 -->
		<div id="layer1" class="refrigeratorDoor d-flex flex-wrap rounded mr-5" ondrop="drop(event)" ondragover="allowDrop(event)"> 
		<c:forEach items="${ingrdIhaveList}" var="ingrd">
			<div id="${ingrd.id }" class="card cursor ingrdIcon ingrdIhave m-1 text-center pointer" 
			 data-toggle="modal" data-target="#my_modal" data-ingrd-id="${ingrd.id}" data-ingrd-name="${ingrd.name}" data-ingrd-amount="${ingrd.amount}" data-ingrd-expdate> <!-- ingrd_ihave의 아이디를 가진다.(primaryKey) , oncontextmenu 우측마우스 기본동작 없애기	 -->
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

<!-- Modal -->
<div class="modal fade" id="my_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <input type="hidden" id="modalIngrdId" />
	      <div id="modalIngrdName"></div>
	      <div class="my-2">
		      <small>남은량</small>
		      <input type="text" id="modalIngrdAmount" class="form-control"/>
	      </div>
	      <div>
		      <small>유통기한</small>
		      <input type="date" id="modalIngrdExpdate" class="form-control"/>
	      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger ingrdDelete" data-dismiss="modal">Delete</button>
        <button type="button" class="btn btn-primary ingrdUpdate">Save changes</button>
      </div>
    </div>
  </div>
</div>

<script>
	$(document).ready(function(){
	
 	//triggered when modal is about to be shown
	$('.ingrdIhave').on('click', function(e){
		var ingrdId = $(this).data('ingrd-id');
		var ingrdName = $(this).data('ingrd-name');
		var ingrdAmount = $(this).data('ingrd-amount');
		var ingrdExpdate = $(this).data('ingrd-expdate');
		
		$('.modal-body #modalIngrdId').val(ingrdId);
		$('.modal-body #modalIngrdName').text(ingrdName);
		$('.modal-body #modalIngrdAmount').val(ingrdAmount);
		//TODO: 구매날짜로 변경해야함 //등록안되어있는 값이 많다.
		$('.modal-body #modalIngrdExpdate').val(ingrdExpdate);
	});
	
 	//재료 삭제
	$('.ingrdDelete').on('click', function(e){
		var ingrdIhaveId = $(this).parent().siblings('.modal-body').children('#modalIngrdId').val();
 		$.ajax({
			type:'post'
			, url : '/ingrd_ihave/delete'
			, data : {'ingrdIhaveId' : ingrdIhaveId }
			, success : function(data){
				if(data.result == 'success'){
					//alert('성공');
					location.reload();
				} else {
					alert('삭제실패');
				}
			}, error : function(e){
				alert('error' + e);
			}
		}) ;
	});
	
	//재료 정보 수정
	$('.ingrdUpdate').on('click', function(e){
		var $modalBody = $(this).parent().siblings('.modal-body');
		var ingrdIhaveId = $modalBody.children('#modalIngrdId').val();
		var ingrdAmount = $modalBody.find('#modalIngrdAmount').val();
		var ingrdExpdate = $modalBody.find('#modalIngrdExpdate').val();
		
 		$.ajax({
			type:'post'
			, url : '/ingrd_ihave/update'
			, data : {'ingrdIhaveId' : ingrdIhaveId, 'ingrdAmount': ingrdAmount, 'ingrdExpdate': ingrdExpdate }
			, success : function(data){
				if(data.result == 'success'){
					//alert('성공');
					location.reload();
				} else {
					alert('');
				}
			}, error : function(e){
				alert('error' + e);
			}
		}) ; 
	});
});
	//Drag and Drop// 
 	function allowDrop(e){
 		e.preventDefault();
 		e.dataTransfer.effectAllowed = 'copy';
 	}
 	function drag(e){
 		e.dataTransfer.setData("text", e.target.id);
 	}
 	function drop(e){
 		e.preventDefault();
 		var data = e.dataTransfer.getData("text");
 		e.target.appendChild(document.getElementById(data));
 		e.dataTransfer.dropEffect = "copy"
 		insertIngrdIhave(data);
 	}
 	function insertIngrdIhave(ingrdId){
 		$.ajax({
 			type:'post'
 			, url: '/ingrd_ihave/insert'
 			, data: {'ingrdId': ingrdId }
 			, success : function(data){
 				if(data.result="success"){
 					location.reload();
 				} else {
 					alert('실패 다시 시도해주세요');
 				}
 			}
 			, error : function(e){
 				alert('관리자에게 문의해주세요' + e);
 			}
 		});
 	}
</script>
    