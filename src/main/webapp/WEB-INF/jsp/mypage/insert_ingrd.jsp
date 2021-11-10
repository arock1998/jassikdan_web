<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 전채적으로 완료된 후 refrigerator에 모달 창으로 띄우도록 하자 -->
    
<h2>재료추가</h2>
<div class="inputDiv mt-2">
	<div class="d-flex m-1 inputBox">
		<input list="ingrdList" name="ingrd" class="form-control col-4 mr-1 ingrd" placeholder="새로산 재료">
		<datalist id="ingrdList" class="ingrdList">
		  <c:forEach items="${ingrdList}" var="ingrd">
		  	<option value="${ingrd.name}" label="${ingrd.nameEng}" data-ingrd-id="${ingrd.id }">
		  </c:forEach>
		</datalist>
		<input class="amount form-control col-2 mr-1" type="text" placeholder="재료 개수, g">
		<input class="datepicker form-control col-2" type="text">
	</div>
	<div class="d-flex m-1 inputBox">
		<input list="ingrdList" name="ingrd" class="form-control col-4 mr-1 ingrd" placeholder="새로산 재료">
		<datalist id="ingrdList">
		  <c:forEach items="${ingrdList}" var="ingrd">
		  	<option value="${ingrd.name}" label="${ingrd.nameEng}" >
		  </c:forEach>
		</datalist>
		<input class="amount form-control col-2 mr-1" type="text" placeholder="재료 개수, g">
		<input class="datepicker form-control col-2" type="text">
	</div>
	<div class="d-flex m-1 inputBox">
		<input list="ingrdList" name="ingrd" class="form-control col-4 mr-1 ingrd" placeholder="새로산 재료">
		<datalist id="ingrdList">
		  <c:forEach items="${ingrdList}" var="ingrd">
		  	<option value="${ingrd.name}" label="${ingrd.nameEng}" >
		  </c:forEach>
		</datalist>
		<input class="amount form-control col-2 mr-1" type="text" placeholder="재료 개수, g">
		<input class="datepicker form-control col-2" type="text">
	</div>
	<div class="d-flex m-1 inputBox">
		<input list="ingrdList" name="ingrd" class="form-control col-4 mr-1 ingrd" placeholder="새로산 재료">
		<datalist id="ingrdList">
		  <c:forEach items="${ingrdList}" var="ingrd">
		  	<option value="${ingrd.name}" label="${ingrd.nameEng}" >
		  </c:forEach>
		</datalist>
		<input class="amount form-control col-2 mr-1" type="text" placeholder="재료 개수, g">
		<input class="datepicker form-control col-2" type="text">
	</div>
	<div class="d-flex m-1 inputBox">
		<input list="ingrdList" name="ingrd" class="form-control col-4 mr-1 ingrd" placeholder="새로산 재료">
		<datalist id="ingrdList">
		  <c:forEach items="${ingrdList}" var="ingrd">
		  	<option value="${ingrd.name}" label="${ingrd.nameEng}" >
		  </c:forEach>
		</datalist>
		<input class="amount form-control col-2 mr-1" type="text" placeholder="재료 개수, g">
		<input class="datepicker form-control col-2" type="text">
	</div>
</div>
<!-- 칸 부족시 누를 수 있는 버튼 -->
<div class="d-flex justify-content-center">
	<button class="btn btn-info plusBtn">+</button>
</div>
<button id="submitBtn" type="submit" class="btn btn-secondary w-50">저장하기</button>

<script>
$(document).ready(function(){
		//아직 동작하지 않는다.
		//칸이 부족할 때 누르는 버튼
 		var count = 0;
		$('.plusBtn').on('click', function(){
			if(count > 15) {
				alert('너무 많이 추가되었습니다.');
			}
			$('.inputDiv').append('<div class="d-flex m-1 inputBox"><input class="ingredientName form-control col-4 mr-1" type="text" placeholder="새로산 재료"><input class="amount form-control col-2  mr-1" type="text" placeholder="재료 개수, g"><input class="datepicker form-control col-2" type="text"></div>');
			count ++;
		}); 
		
		//datepicker재료 구매 날짜 
	$('.datepicker').datepicker({
		dateFormat:'yy-mm-dd'
		}).datepicker("setDate",'now'); 
		
		//저장버튼
	$('#submitBtn').on('click', function(e){
		e.preventDefault();
		var list = new Array();
		var userId = ${userId};
		alert('userId' + userId)
		
		$('.inputBox').each(function(){
			var ingrdId = $(this).children('.ingrdList option:select ').data('ingrd-id');
			alert(ingrdId);
			/* var ingrdId = s.options[s.selectedIndex].data('ingrd-id'); */
			/* var ingrdId = $(this).children('.ingrdList option:selected').val(); */ 
			var amount = $(this).children('.amount').val().trim();
			var date = $(this).children('.datepicker').val().trim();
					
			if(ingrdId == ''){
				alert('재료 이름을 입력하세요')
				return false;
			}
			// 객체 생성
			var data = new Object();
			data.userId = userId;
			data.ingrdId = ingrdId;
			data.amount = amount;
			data.date = date;
		            
			// 리스트에 생성된 객체 삽입
			list.push(data);
		});
		var jsonData = JSON.stringify(list);
		alert(jsonData); 
        
 		$.ajax({
			type:'post'
			, url: '/ingrd_ihave/insert'
			, data: jsonData
			, contentType: 'application/json;'
			, success : function(data){
				if(data.result == 'success'){
					alert('성공');
					location.href="/mypage/refrigerator_view";
				} else {
					alert('실패');
				}
			}
			, error : function(e){
				alert('관리자에게 문의해주세요' + e);
			}
		}) 
	});
});
</script>

