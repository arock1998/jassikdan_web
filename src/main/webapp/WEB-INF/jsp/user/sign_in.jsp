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
	});
</script>