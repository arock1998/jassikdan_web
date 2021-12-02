<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-around">
	<!-- 냉동실 -->
	<div class="refrigeratorDoor rounded d-flex align-items-center flex-row-reverse"> 
		<a id="loginBtn" class="btn btn-light w-100 col-2 mr-2 d-flex justify-content-center align-items-center"><span>로<br>그<br>인<br></span></a>
		 <div id="loginBox d-flex  flex-row-reverse">
			<!-- <div class="ml-3">
				<h2 class="font-weight-bold text-white ">Login</h2>
			</div> -->
			<div class="d-flex">
				<div class="mr-2">
					<input id="loginId" name="loginId" type="text" class="form-control loginInputText" placeholder="아이디" >
					<input id="password" name="password" type="password" class="form-control mt-2 loginInputText" placeholder="비밀번호">
				</div>
			</div>
		</div> 
	</div>
	<!-- 냉장실 -->
	<div class="refrigeratorDoor rounded d-flex align-items-center"> 
		<a id="signUpBtn" href="/user/sign_up_view" class="btn btn-light w-100 col-2 ml-2 align-self-center ">회<br>원<br>가<br>입</a>
	</div>
</div>

<script>
	$(document).ready(function(){
		//로그인 버튼 클릭
		$('#loginBtn').on('click', function(){
			var loginId = $('#loginId').val().trim();
			var password = $('#password').val().trim();
			if(loginId != '' && password != ''){
				$.ajax({
					type: 'post'		
					, url : '/user/sign_in'
					, data : {'loginId': loginId, 'password': password}
					, success : function(data){
						if(data.result == 'success'){
							location.href="/mypage/refrigerator_view";
						} else {
							alert('아이디와 비밀번호를 확인해주세요');
						}
					}
					, error : function(e){
						alert('관리자에게 문의해주세요 error:' + e);
					} 
				})
			}
		});
	});
</script>