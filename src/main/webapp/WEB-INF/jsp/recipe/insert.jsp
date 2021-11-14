<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<div>
	<input class="form-control" placeholder="음식 이름">
	<input class="form-control" type="file"><!-- 사진 파일 등록 필수 요소 -->
	<input class="form-control" name="description" type="text" placeholder="음식 설명">
	<!-- 재료등록 필요!!!! -->
	<button type="button" class="w-100 btn btn-secondary goDetailBtn">상세내용 등록하기</button>
</div>
<script>
	$(document).ready(function(){
		//어떤 다른 버튼을 눌렀을 때 동작하도록 만든다.
		$('.goDetailBtn').on('click', function(){
			var description = $('input[name=description]').val().trim();
			if(description == ''){
				alert('설명을 입력해주세요');
				return;
			}
			
			$.ajax({
				type : 'post'
				, url : '/recipe/insert'
				, data : {'description' : description}
				, success : function(data){
					if(data.result == 'success'){
						
						alert('ajax통신에는 성공 했습니다.');
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
