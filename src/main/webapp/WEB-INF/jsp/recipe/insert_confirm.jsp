<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 레시피 썸네일 -->
<div class="mt-3 border">
	<h4>조리과정</h4>
	
</div>
<!-- 레시피 조리 과정 -->
<c:forEach items="${recipeCourseList}" var="recipeCourse">
<div class="mt-3 border">
	<div class="form-control mt-2 ">
		<img class="h-75" src="${recipeCourse.image }" width="500px">
	</div>
	<div id="description" class="form-control mt-2">${recipeCourse.description}</div>
</div>
</c:forEach>
<button id="saveAll" class="btn btn-primary w-100 my-3">전체 저장하기</button>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#saveAll').on('click', function(){
			$.ajax({
				type:'post'
				, url : '/recipe/insert_final'
				, success : function(data){
					if(data.result == 'success'){
						alert('레시피가 등록되었습니다.');
						location.href = '/mypage/insert_ingrd_view';
					}
				}
				, error : function(e){
					alert('관리자에게 문의해주세요:' + e);
				}
			})
		});
		
	});
</script>
