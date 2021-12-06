<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="">
	<div id="loginBox" class="p-5">
	<form>
		<h3 class="text-secondary">Login</h3>
		<input id="loginId" class="form-control mb-2" type="text" placeholder="id">
		<input id="password" class="form-control mb-2" type="password" placeholder="password">
		<button id="submit" class="form-control" type="submit">로그인</button>
	</form>
	<div class="d-flex w-100 justify-content-center mt-3">
		<div>
			<a id="findId" href="#" class="text-secondary small ml-2">ID/PW 찾기</a></div>
		<div>
			<span class="text-secondary small ml-2">|</span>
		</div>
		<div>
			<a href="/user/sign_up_view" class="text-secondary small ml-2">회원가입</a></div>
		</div>
		<!-- TODO: 로그인 연동 API 공부해서 불러오기 -->
		<a href="naver.com">네이버</a>
		<a href="naver.com">구글</a>
		<a href="naver.com">카카오</a>
		<a href="naver.com">페이스북</a>
	</div>
</div>

<script>
	$(document).ready(function(){
		//로그인 버튼 클릭
		$('#submit').on('click', function(e){
			e.preventDefault();
			var loginId = $('#loginId').val().trim();
			var password = $('#password').val().trim();
			if( loginId != '' && password != '' ){
				$.ajax({
					type :'post'
					, url : '/user/sign_in'
					, data : {'loginId' : loginId, 'password' : password}
					, success : function(data){
						if(data.result == 'success'){
							location.href="/mypage/refrigerator_view";
						} else {
							alert('다시 확인해주세요');
						}
					}
					, error : function(e){
						alert('관리자에게 문의해주세요' + e);
					}
				});
			}
		});
		// TODO: 아이디 비번찾기
		$('#findId').on('click', function(){
			alert('준비중입니다.');
		})
	});
</script>