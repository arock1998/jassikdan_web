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
					<div id="recipeName" class="font-weight-bold col-3">레시피 제목</div>
					<div class="col-7">
						<input type="text" class="form-control w-100">
					</div>
				</div>
				<div id="recipeDescription" class="d-flex mb-3">
					<div class="font-weight-bold col-3">요리소개</div>
					<div class="col-7">
						<input type="text" class="form-control w-100">
					</div>
				</div>
			</div>
			<div>
				<div>사진 넣는 곳
					<img id="recipeImage" alt="사진 넣는 곳">
				</div>
				<input type="file" class="form-control">
			</div>
		</div>
		<div class="d-flex mb-3">
			<div class="font-weight-bold col-3 ml-3">카테고리</div>
			<div class="d-flex col-7 justify-content-center">
				<select id="recipeNation" class="form-control ml-1">
					<option disabled selected hidden="hidden">종류별</option>
					<option>한식</option>
					<option>중식</option>
					<option>분식</option>
					<option>양식</option>
					<option>일식</option>
					<option>이탈리아식</option>
					<option>동남아식</option>
				</select>
			<!-- 참고: 종류별, 상황별, 방법별, 재료별(주의할 재료(?)) 인원, 시간, 난이도 -->				
			</div>
		</div>
		<div class="d-flex">
			<div class="font-weight-bold col-3">동영상 링크</div>
			<input type="text" class="col-7 form-control"> 
		</div>
	</div>
	<hr>
	<hr>
<!-- 요리 과정 등록 -->
	<div class="mb-5">
		<div class="font-weight-bold">상세내용 등록하기</div>
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
						<div> ${val}번째 과정</div>
						<div><input type="file"></div>
						<div><input type="text" class="form-control" placeholder="조리과정 설명"></div>
					</div>
				</c:forEach>
				
			<!-- 다음 버튼 -->
				<div id="nextCourseBtn"><img></div>
			</div>
		</div>
	</div>
	<hr>
	<hr>
<!-- 재료등록 -->
	<div>
		<small class="text-danger">정확한 재료명을 입력해주세요</small>
		
		<!-- 반복하는 부분 -->
		<div class="mt-3 d-flex">
			<div class="mr-2">
				<input type="text" class="form-control" placeholder="재료 명"> 
			</div>
			<div class="mr-2">
				<input type="text" class="form-control" placeholder="필요한 양"> 
			</div>
			<div><a href="#">x</a></div>
		</div>
		
	</div>
	<div class="w-100 mt-3">
		<!-- 임시저장 10일 후 최종 저장되지 않을 경우 자동 삭제 된다. 임시 저장은 나중에 구현한다 -->
		<button id="transientStorage" class="btn btn-primary">임시 저장하기</button>
		<!-- 관리자가 검토한 후 레시피가 다른 사람들에게 보여집니다. -->
		<button class="btn btn-success">저장 후 공개하기</button>
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
		$('')
		
		//임시저장을 눌렀을 때		
		$('#transientStorage').on('click', function(){
			#recipeName
			#recipeDescription
			#recipeImage
		});
		
		//공개 후 저장을 눌렀을 때		
		$('#transientStorage').on('click', function(){
			var recipeName = $('#recipeName').val().trim();
			var recipeDescription = $('#recipeName').val().trim();
			var recipeImage = $('#recipeName').val();
			var recipeNation = $('#recipeName option:select').val();
			
			//validation	TODO: 레시피 이미지 등록시 바로 validation!
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
			}
			if(recipeNation == ''){
				alert('레시피 분류를 선택해주세요~');
			}
			
			//레시피 과정 정보 등록		
			$('.insertCourseBox').each(function(){
	            var ingrdId = $(this).children('.ingrdList option:select ').data('ingrd-id');
	            //josn 파일로 전달하자!
	            
	            var json = {}
	            
	            
	            
			});
			
		});
		
		
		
		
	})


	$(document).ready(function(){
		//다음으로 가는 버튼
		$('.goDetailBtn').on('click', function(){
			var name = $('#name').val().trim();
			if(name == ''){
				alert('음식 이름을 입력해주세요');
				return;
			}
			var nation = $('#nation').val();
			if(nation == ''){
				alert('음식의 분류가 선택되지 않았습니다.');
				return;
			}
			var description = $('#description').val().trim();
			if(description == ''){
				alert('설명을 입력해주세요');
				return;
			}
			var image = $('#image').val();
			if(image == ''){
				alert('이미지를 등록해주세요')
				return;
			}
			alert('image' + image);
			if(image != ''){
				let ext = image.split('.').pop().toLowerCase();
				if($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1 ){
					alert('이미지파일만 업로드 할 수 있습니다.');
					$('#image').val('');
					return;
				}
			}
			let formData = new FormData();
			formData.append('name', name);
			formData.append('description', description);
			formData.append('nation', nation);
			formData.append('image', $('#image')[0].files[0]);
			
			alert(formData);
			$.ajax({
				type : 'post'
				, url : '/recipe/insert'
				, data : formData
				, enctype : 'multipart/form-data'
				, processData : false
				, contentType: false
				, success : function(data){
					if(data.result == 'success'){
						location.href="/recipe/create_detail_view?cookingNo=1";
					}
				}
				, error : function(e){
					alert('관리자에게 문의해주세요 error:' + e);
				}
			});
		});
	});
</script>
