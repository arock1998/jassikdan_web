<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- 넘어오는 주소 //recipe/insert_detail_view?cookingNo=1 --> 
<div class="d-flex courseContent justify-content-around mb-3" data-cooking-no="${cookingNo}">
	<!-- 이전버튼 -->
	<div class="arrowBox mb-3 d-flex align-items-center">
		<a href="/recipe/create_detail_view?cookingNo=${cookingNo-1}" class="prev"><img src="/static/images/icon/prev.png" class="w-100" ></a>
	</div>
	<!-- 레시피 정보를 등록할 수 있다. -->
 	<div class="courseBox" class="">
 		<h4>${cookingNo}번째 과정</h4>
 		<c:if test="${recipeCourse ne null}">
 			<div class="mb-2 p-3 w-25 h-25">
				<img src="${recipeCourse.image}" class="w-75 h-75"><br>
				<small class="text-secondary">등록되어있던 이미지</small>
			</div>
			<input class="form-control courseImage w-100" type="file">
			<input class="form-control description w-100 mt-3" name="description" type="text" placeholder="음식설명" value="${recipeCourse.description}">
		</c:if>
		<c:if test="${recipeCourse eq null }">
			<input class="form-control courseImage w-100" type="file">
			<!-- recipe 정보가 있을 경우 레시피 정보를 보여준다 img src를 사용해서 -->
			<input class="form-control description w-100 mt-3" name="description" type="text" placeholder="음식설명" >
		</c:if>
	</div>		
	<!-- 다음 버튼 -->
	<div class="arrowBox d-flex align-items-center">
		<a href="/recipe/create_detail_view?cookingNo=${cookingNo+1}" class="next"><img src="/static/images/icon/next.png"></a>
	</div>
</div>
<button id="saveCourseBtn" type="button" class="btn btn-primary w-100 mb-5" data-toggle="modal" data-target="">저장하기</button>

<script>
	$(document).ready(function(){
		var cookingNo = $('.courseContent').data('cooking-no');
		//이전버튼을 눌렀을 경우
		$('.prev').on('click', function(e){
			e.preventDefault();
			var courseImage = $('.courseImage').val();
			var description = $('.description').val().trim();
			var url = $(this).attr('href');
			
			if(courseImage != '' || description != ''){
				
				let formData = new FormData();
				formData.append('cookingNo', cookingNo);
				formData.append('description', description);
				formData.append('image', $('.courseImage')[0].files[0]);
				
				if(cookingNo <= 1){
					return false;
				}
				$.ajax({
					type:'post'
					, url:'/recipe/insert_detail'
					, data : formData
					, enctype : 'multipart/form-data'
					, processData : false
					, contentType: false
					, success : function(data){
						if(data.result == 'success'){
							location.href=url;
						}
					}
					, error : function(e){
						alert('error:' + e);
					}
				});
			}
			location.href=url;
		});
		
		//다음 버튼을 눌렸을 때
		$('.next').on('click', function(e){
			e.preventDefault();
			var seletedImage = $('.courseBox img').attr('src');
			var courseImage = $('.courseImage').val();
			var description = $('.description').val().trim();
			if(courseImage == '' && seletedImage == ''){
				alert('이미지를 등록해주세요');
				return false;
			} else if(seletedImage != '' && courseImage == ''){
				alert('이미지를 다시 등록해주세요');
				return false;
			}
			if(description == ''){
				alert('설명을 등록해주세요');
				return false;
			}
			var url = $(this).attr('href');
			
			let formData = new FormData();
			formData.append('cookingNo', cookingNo);
			formData.append('description', description);
			if(courseImage != ''){
				formData.append('image', $('.courseImage')[0].files[0]);
			}
			
			$.ajax({
				type:'post'
				, url:'/recipe/insert_detail'
				, data : formData
				, enctype : 'multipart/form-data'
				, processData : false
				, contentType: false
				, success : function(data){
					if(data.result == 'success'){
						location.href=url;
					}
				}
				, error : function(e){
					alert('error:' + e);
				}
			});
		});
		
		//저장하기 버튼 클릭
		$('#saveCourseBtn').on('click', function(){
			var seletedImage = $('.courseBox img').attr('src');
			var courseImage = $('.courseImage').val();
			var description = $('.description').val().trim();
			if(courseImage == '' && seletedImage == ''){
				alert('이미지를 등록해주세요');
				return;
			} else if(seletedImage != '' && courseImage == ''){
				alert('이미지를 다시 등록해주세요');
				return;
			}
			if(description == ''){
				alert('설명을 등록해주세요');
				return;
			}
			var url = $(this).attr('href');
			
			let formData = new FormData();
			formData.append('cookingNo', cookingNo);
			formData.append('description', description);
			formData.append('image', $('.courseImage')[0].files[0]);
			
			$.ajax({
				type:'post'
				, url : '/recipe/insert_detail'
				, data : formData
				, enctype : 'multipart/form-data'
				, processData : false
				, contentType: false
				, success : function(data){
					if(data.result == 'success'){
						location.href = '/recipe/insert_confirm_view';
					}
				}
				, error : function(e){
					alert('error:' + e);
				}
			});
		});
	});
</script>