<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="mt-3 mb-5">
<span>레시피 등록</span>
<hr>
<!-- 기본정보 등록 -->
	<div>
		<div class="d-flex">
			<div class="col-8">
				<div class="d-flex mb-3">
					<div class="font-weight-bold col-3">레시피 제목</div>
					<div class="col-7">
						<input id="recipeName" type="text" class="form-control w-100">
					</div>
				</div>
				<div  class="d-flex mb-3">
					<div class="font-weight-bold col-3">요리소개</div>
					<div class="col-7">
						<textarea id="recipeDescription" cols="50" rows="5" class="form-control"></textarea>
					</div>
				</div>
				<div class="d-flex mb-3">
					<div class="font-weight-bold col-3">카테고리</div>
					<div class="d-flex col-7 justify-content-center">
						<select id="recipeNation" class="form-control ">
							<option disabled selected hidden="hidden" value="">종류별</option>
							<option value="한식">한식</option>
							<option value="중식">중식</option>
							<option value="분식">분식</option>
							<option value="양식">양식</option>
							<option value="일식">일식</option>
							<option value="이탈리아식">이탈리아식</option>
							<option value="동남아식">동남아식</option>
						</select>
					<!-- 참고: 종류별, 상황별, 방법별, 재료별(주의할 재료(?)) 인원, 시간, 난이도 -->	
					</div>
				</div>
			</div>
			<div>
				<div id="recipeImageBox" class="mb-1">
					<img  alt="사진 넣는 곳">
				</div>
				<input type="file" id="recipeImage" class="form-control">
			</div>
		</div>
	</div>
	<hr>
	<hr>
<!-- 요리 과정 등록 -->
<form id="formCourse" action="/recipe/insert_course" method="post">
	<div class="mb-5 ml-4">
		<div class="font-weight-bold mb-3">상세내용 등록하기</div>
		<div class="bg-light">	
			<div class="d-flex justify-content-around">
			<!-- 이전버튼 -->
				<div id="prevCourseBtn"><img></div>
				<c:set var="endNum" value="4"/>
				<c:forEach begin="1" end="${endNum}" step="1" var="val">
					<!-- 반복되는 부분 -->
					<div class="insertCourseBox">
						<div class="insertCourseImgBox mb-1" >
							<img alt="사진을 넣어주세용~~" src="">
						</div>
						<input class="hidden" name="courseList[${val}].cookingNo" value="${val}">
						<div> ${val}번째 과정</div>
						<div><input name="courseList[${val}].image" class="courseImg" type="file"></div>
						<div><input name="courseList[${val}].description" type="text" class="courseDescription form-control" placeholder="조리과정 설명"></div>
					</div>
				</c:forEach>
			<!-- 다음 버튼 -->
				<div id="nextCourseBtn"><img></div>
			</div>
		</div>
	</div>
</form>
	<hr>
	<hr>
<!-- 재료등록 -->
	<div class="ml-4">
		<small class="text-danger">정확한 재료명을 입력해주세요</small>
		<c:set var="endNum2" value="3"/>
		<c:forEach begin="1" end="${endNum}" step="1" var="val">
		<div class="mt-3 d-flex insertIngrdBox">
			<div>
				<input type="text" class="ingrdName form-control" placeholder="재료명"> 
			</div>
			<div class="input-group col-4">
				<input type="text" class="ingrdAmount form-control" placeholder="필요한 양(숫자만)"> <!-- 숫자만 입력가능하도록 -->
				<select class="ingrdUnit form-control input-group-append col-3 input-group-text" >
					<option disabled selected hidden="hidden" value="">단위</option>
					<option value="약간">약간</option>
					<option value="g">g</option>
					<option value="l">l</option>
					<option value="ml">ml</option>
				</select>
			</div>
			<div><a href="#">x</a></div>
		</div>
		</c:forEach>
	</div>
	<div class="w-100 mt-3">
		<!-- 임시저장 10일 후 최종 저장되지 않을 경우 자동 삭제 된다. 임시 저장은 나중에 구현한다 -->
		<button id="transientStorage" class="btn btn-primary">임시 저장하기</button>
		<!-- 관리자가 검토한 후 레시피가 다른 사람들에게 보여집니다. -->
		<button id="save" class="btn btn-success">저장 후 공개하기</button>
		<button class="btn btn-secondary">취소</button>
	</div>
</div>
<script>
	$(document).ready(function(){
		//요리과정 정보 이전을 클릭하는 칸
		$('#prveCourseBtn').on('click', function(){
		});
		//요리과정 정보 다음을 등록하는 칸
		$('#nextCourseBtn').on('click', function(){
		});
		
		//요리 재료를 동록하는 부분
		
		//임시저장을 눌렀을 때		
		$('#transientStorage').on('click', function(){
/* 			#recipeName
			#recipeDescription
			#recipeImage */
		});
		
		//저장 후 공개를 눌렀을 때	 --> 너무 이상한 데이터이면 어떡하지?? 일단 만개의 레시피는 삭제되지 않는 것 같다.
		$('#save').on('click', function(){
			var recipeName = $('#recipeName').val().trim();
			var recipeDescription = $('#recipeDescription').val().trim();
			var recipeImage = $('#recipeImage').val();
			var recipeNation = $('#recipeNation').val();
			//validation TODO: 레시피 이미지 등록시 바로 validation!
			if(recipeName == ''){
				alert('레시피 이름을 입력하세요~');
				return;
			}
			if(recipeDescription == ''){
				alert('레시피 설명을 입력하세요~');
				return;
			}
 			if(recipeImage == ''){
				alert('레시피 사진을 등록하세요~');
				return;
			} else {
				let ext = recipeImage.split('.').pop().toLowerCase();
				if($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1 ){
					alert('이미지파일만 업로드 할 수 있습니다.');
					$('#recipeImage').val('');
					return;
				}
			}
			if(recipeNation == '' || recipeNation == null){
				alert('레시피 분류를 선택해주세요~');
				return
			}
			let formData = new FormData();
			formData.append('recipeName', recipeName);
			formData.append('recipeDescription', recipeDescription);
			formData.append('recipeImage', $('#recipeImage')[0].files[0]);
			formData.append('recipeNation', recipeNation);
			alert("formData" + formData);
			
			//레시피 과정 정보 등록		//validation 후 form데이터로 전달
			var courseList = new Array();
			var userId = 1; //아니 어차피 중간에 recipeId 넣어줘야해서
			$('.insertCourseBox').each(function(){
				var courseImg = $('.courseImg').val();
				var courseDescription = $(this).find('.courseDescription').val().trim();
	            //josn 파일로 전달하자!
            	// 객체 생성
            	// 만약 courseDescription이 비어있을 경우 return;
    			var data = new Object();
    			data.userId = userId;
    			data.courseDescription = courseDescription;
    			// 리스트에 생성된 객체 삽입
    			courseList.push(data);
			});
			var courseJsonData = JSON.stringify(courseList);
			alert(courseJsonData);
			
			//재료 정보 등록
			var ingrdList = new Array();
			$('.insertIngrdBox').each(function(){
				var ingrdId = '?';
				var ingrdName = $(this).find('.ingrdName').val().trim();
				var ingrdAmount = $(this).find('.ingrdAmount').val().trim();
				var ingrdUnit = $(this).find('.ingrdUnit').val();
				
				var data = new Object();
				data.ingrdId = ingrdId;
				data.ingrdName = ingrdName;
				data.ingrdAmount = ingrdAmount;
				data.ingrdUnit = ingrdUnit;
				ingrdList.push(data);
			});
			var ingrdJsonData = JSON.stringify(ingrdList);
			alert(ingrdJsonData);
			
			//1) 모두 가능할 경우 통신을 세번한다. (별로 좋은 방법이 아닐것 같다.) --> 중간에 통신이 끊어질 경우 저장하지 않아도 되는 데이터가 쌓이게 된다.
			//TODO: 2) 통신을 한번한 후 서버에서 모든 데이터를 나눈다. (내 능력이 부족하다.)
			$.ajax({
				type: "post"
				, url : "/recipe/insert_recipe"
				, data : formData
				, enctype : 'multipart/form-data'		//사진을 넣기 위한 세가지
				, processData : false
				, contentType: false
				, success : function(data){
					if(data.result == 'success'){
						var recipeId = data.recipeId;
						//재료 등록
						alert("recipeId:" + recipeId);
						
						// recipe_course의 submit을 허락한다.
						$('#formCourse').submit();
						alert("서브밋 했어용~")
						
						
					} else {
						alert('error: 관리자에게 문의해주세요');
					}
				}
				, error : function(e){
					alert('error:' + e);
				}
			});
		});
	});
</script>
