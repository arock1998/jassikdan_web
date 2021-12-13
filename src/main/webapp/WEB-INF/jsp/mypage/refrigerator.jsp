<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="container bg-lightgray">
<!-- 재료 검색 -->
	<div class="ingrdSelectBox pt-3">
		<div class="d-flex mb-2">
			<div class="d-flex input-group col-6">
				<input list="ingrdList" type="search" class="form-control" placeholder="재료를 입력하세요.">
				<div class="input-group-append searchIconBox bg-ligthgray">
					<a href="#" class="form-control"><img src="/static/images/icon/search.png" class="w-100 h-100"></a>
				</div>
			</div>
			<div class="form-control col-2" ondrop="drop_handler(event)" ondragover="dragover_handler(event)" ><img src="/static/images/icon/trashcan.png" width="25px" class="mr-1 pb-1"><span class="pt-2">정리하기</span></div>
		</div>
	<!-- 검색결과 -->
		<div class="ingrdIconBox d-flex flex-wrap overflow-auto ml-3">
		<c:forEach items="${ingrdList}" var="ingrd">
			<div id="${ingrd.id }" class="ingrdIcon pointer" draggable="true" ondragstart="drag(event)" >
				<div class="ingrdIconImg ">
					<img class="w-75 h-75" src="/static/images/ingrd/${ingrd.nameEng}.png" alt="${ingrd.name}" draggable="false" >
				</div>
				<span class="font-size-10">${ingrd.name}</span>
			</div>
		</c:forEach>
		</div>	
	</div>
	
	<div class="d-flex mt-5 refrigerator">
		<!-- 냉장고 -->
		<div class="d-flex justify-content-around mb-5 ml-3">
			<div>
				<div id="layer1" class="refrigeratorDoor-1 d-flex flex-wrap rounded mr-5" ondrop="drop(event)" ondragover="allowDrop(event)"> 
				</div>
				<div id="layer1" class="refrigeratorDoor-2 d-flex flex-wrap rounded mr-5" ondrop="drop(event)" ondragover="allowDrop(event)"> 
				<c:forEach items="${ingrdIhaveList}" var="ingrd">
					<div id="${ingrd.id }" class="card cursor ingrdIcon ingrdIhave m-1 text-center pointer" draggable="true" ondragstart="dragstart_handler(event)"
					 data-toggle="modal" data-target="#my_modal" data-ingrd-id="${ingrd.id}" data-ingrd-name="${ingrd.name}" data-ingrd-amount="${ingrd.amount}" data-ingrd-expdate> <!-- ingrd_ihave의 아이디를 가진다.(primaryKey) , oncontextmenu 우측마우스 기본동작 없애기	 -->
						<!-- 재료 영어이름의 띄어쓰기는 '_'로 등록되어있다. -->
						<div class="ingrdIconImg">
							<img class="w-75 h-75" src="/static/images/ingrd/${ingrd.nameEng}.png" alt="" draggable="false">
						</div>
						<span class="font-size-10">${ingrd.name}</span>
					</div>
					</c:forEach>
				</div>
			</div>
			<!-- 냉장실 -->
			<div class="refrigeratorDoor-3 rounded d-flex align-items-end justify-content-end" ondrop="drop(event)" ondragover="allowDrop(event)"> 

			</div>
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

 		
 		deleteIngrdIhave(ingrdIhaveId);
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
					alert('관리자에게 문의해주세요');
				}
			}, error : function(e){
				alert('error' + e);
			}
		}) ; 
	});
});
	//Drag and Drop//
	// 재료 추가용
	 function drag(e){
 		e.dataTransfer.setData("text", e.target.id);
 	}
 	function allowDrop(e){
 		e.preventDefault();
 		e.dataTransfer.effectAllowed = 'copy';
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
 	
 	//재료 삭제용 (쓰레기통으로 이동)
 	function dragstart_handler(e){
 		e.dataTransfer.setData("text/plain", e.target.id);
 	}
 	function dragover_handler(e){
 		e.preventDefault();
 		e.dataTransfer.dropEffect = "move";
 	}
	function drop_handler(e){
		e.preventDefault();
		//대상의 id를 가져와 이동한 대상 DOM요소를 추가합니다.
 		var data = e.dataTransfer.getData("text");
 		e.target.appendChild(document.getElementById(data));
 		e.dataTransfer.effectAllowed = 'move';
 		deleteIngrdIhave(data);
	}
	function deleteIngrdIhave(ingrdIhaveId){
 		$.ajax({
			type:'post'
			, url : '/ingrd_ihave/delete'
			, data : {'ingrdIhaveId' : ingrdIhaveId }
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
		});
	}
	
 	
 	
 	
 	
 	
 	
 	
 	
 	
</script>
    