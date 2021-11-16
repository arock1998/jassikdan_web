<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<div class="mt-3 courseContent">
	<input id="name" class="form-control" placeholder="음식 이름">
	<select id="nation" class="form-control mt-2">
		<option value="">--Please choose nation--</option>
		<option value="한식">한식</option>
		<option value="중식">중식</option>
		<option value="양식">양식</option>
		<option value="일식">일식</option>
		<option value="분식">분식</option>
		<option value="퓨전">퓨전</option>
		<option value="동남아시아">동남아시아</option>
		<option value="기타">기타</option>
	 </select>
	<div class="form-control mt-2"><!-- 사진 파일 등록 필수 요소 -->
		<input id="image" type="file" class="mt-2" class="form-control">
	</div>
	<input id="description" class="form-control mt-2" type="text" placeholder="음식 설명">
	<!-- 재료등록 필요!!!! -->
	<button type="button" class="w-100 btn btn-secondary goDetailBtn mt-3">상세내용 등록하기</button>
</div>
<script>
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
