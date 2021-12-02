<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-around">
<!-- 냉동실 -->
	<div class="refrigeratorDoor rounded d-flex align-items-center flex-row-reverse"> 
		<a href="/user/sign_in_view" class="btn btn-light w-100 col-2 mr-2 d-flex justify-content-center align-items-center"><span>로<br>그<br>인<br></span></a>
	</div>
<!-- 냉장실 -->
	<div class="refrigeratorDoor rounded d-flex align-items-center"> 
	<form id="signUpForm" action="/user/sign_up" method="post">
		<div id="signUpBox" class="ml-4 mr-4">
			<h2 class="font-weight-bold text-white">회원가입</h2>
			<small class="text-white">아이디</small>
			<div class="input-group">
				<input name="loginId" type="text" class="form-control mb-1" >
				<div class="input-group-append">
				<button id=loginIdCheckBtn type="button" class="btn btn-light mb-1 border" data-is-duplicated='true'>중복확인</button>
				</div>
			</div>
			<small class="text-white">비밀번호</small>
			<input name="password" type="password" class="form-control mb-1">
			<small class="text-white">비밀번호 확인</small>
			<input name="passwordConfirm" type="password" class="form-control mb-1">
			<small class="text-white">이름</small>
			<input name="name" type="text" class="form-control mb-1" >
			<small class="text-white">생년월일</small>
			<input name="birth" type="date" class="form-control mb-1" >
			<small class="text-white">이메일</small>
			<div class="input-group">
				<input type="text" class="form-control emailPrefix"> 
				<div class="input-group-append input-group-prepend">
					<span class="input-group-text">@</span>
				</div>
				<input type="text" class="form-control emailSuffix">
			</div>
			<small class="text-white">성별</small><br>
			<label class="text-white">남자<input id="male" type="radio" name="gender" value="male" class="ml-1"></label>
			<label class="text-white">여자<input id="female" type="radio" name="gender" value="female" class="ml-1"></label><br>
			<button id="signUpBtn" class="btn btn-light w-100">회원가입</button>
		</div>
	</form>
	</div>
</div>

<script>
	$(document).ready(function(){
		//loginId가 변경될 때마다 중복확인 값 초기화
		$('input[name=loginId]').on('change', function(){
			$('#loginIdCheckBtn').data('is-duplicated', true);
		});
		//중복확인
		$('#loginIdCheckBtn').on('click', function(){
			var loginId = $('input[name=loginId]').val().trim();
			if(loginId.length < 4){
				alert('아이디는 4자 이상 입력되야 합니다.');
				return;
			}
			$.ajax({
				type:'post'
				, url: '/user/is_duplicated'
				, data : {'loginId' : loginId }
				, success: function(data){
					if(data.result == true){
						alert('이미 존재하는 아이디입니다.');
						$('input[name=loginId]').val('');
					} else if (data.result == false){
						//중복된 아이디가 아닐경우 데이터를 false로 변경
						$('#loginIdCheckBtn').data('is-duplicated', false);
						var isDuplicated = $('#loginIdCheckBtn').data('is-duplicated');
						alert('사용할 수 있는 아이디 입니다.');
					}
				}
				, error : function(e){
					alert('통신에 실패했습니다.' + e);
				}
			});
		});
		//회원가입 버튼
		$('#signUpBtn').on('click', function(e){
			e.preventDefault();			
			//validation
			var loginId = $('input[name=loginId]').val().trim();
			if(loginId == ''){
				alert('아이디를 입력하세요');
				return;
			}
			if (loginId.length < 4) {
				alert('아이디는 4자 이상 입력되야 합니다.');
				return;
			}
			var password = $('input[name=password]').val().trim();
			var passwordConfirm = $('input[name=passwordConfirm]').val().trim();
			if(password == ''){
				alert('비밀번호를 입력하세요');
				return;
			} else if(password.length < 6){
				alert('비밀번호를 6자 이상 입력해주세요')
				return;
			}
			if(passwordConfirm == ''){
				alert('비밀번호를 입력하세요');
				return;
			}
			if(password != passwordConfirm ){
				alert('비밀번호가 일치하지 않습니다.');
				return;
			}
			var name = $('input[name=name]').val().trim();
			if(name == ''){
				alert('이름를 입력하세요');
				return;
			}
			var birth = $('input[name=birth]').val().trim();
			if(birth == ''){
				alert('생년월일을 입력하세요');
				return;
			}
			let gender = $('input[name=gender]:checked').val()
			if(gender == null){
				alert('성별을 입력하세요');
				return;
			}
			var emailPrefix = $('.emailPrefix').val().trim();
			var emailSuffix = $('.emailSuffix').val().trim();
			if(emailPrefix == '' || emailSuffix == ''){
				alert('이메일을 입력하세요');
				return;
			} else {
				var email = emailPrefix + '@' + emailSuffix;
			}
			
			//ID 중복확인
			var isDuplicated = $('#loginIdCheckBtn').data('is-duplicated');
			if(isDuplicated == true){
				alert('아이디 중복확인 해주세요');
				return;
			}

			$.ajax({
				type:'post'
				, url : '/user/sign_up'
				, data : {'loginId': loginId, 'password': password, 'name': name, 'birth': birth, 'gender': gender, 'email': email }
				, success : function(data){
					if(data.result == 'success'){
						alert('가입을 환영합니다.');
						location.href="/mypage/refrigerator_view"
					} else {
						alert('가입 실패');
					}
				}
				, error : function(e){
					alert('가입 실패');
				}
			});
		});
	});
</script>