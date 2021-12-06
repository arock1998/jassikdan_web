<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자식단</title>


<!-- jquery : bootstrap, datepicker -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<!-- datepicker-->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- stylesheet -->
<link rel="stylesheet" type="text/css" href="/static/css/stylesheet.css">

</head>
<body>
	<div id="" class="container">
	<!--### header ###-->
		<div class="bg-img">
			<div class="bg-green opacity d-flex justify-content-around align-items-center text-white">
			<!-- 메뉴토글 -->
				<div class="d-flex justify-content-around align-items-center">
					<img src="/static/images/icon/menu.png" class="mr-1" alt="menu" class="w-100 h-100" width="12px">
					<div class="small">MENU</div>
				</div>
			<!-- 중앙 메뉴 -->
				<div class="nav d-flex justify-content-center align-items-center">
					<div class="small mx-2">BRAND</div>
					<div class="small mx-2">LEARN</div>
					<div id="main" class="mx-2 pointer"><h4>JASSiKDAN</h4></div>
					<div class="small mx-2">SHOP</div>
					<div class="small mx-2">STORY</div>
				</div>
			<!-- 로그인 -->
				<div id="sign_in" class="d-flex justify-content-around align-items-center pointer">
					<img src="/static/images/icon/user.png" class="mr-1" alt="login" class="" width="16px">
					<div class="small">LOGIN</div>
				</div>
			</div>
		</div>
		<!-- ### contents ### -->
		<div class="contents d-flex justify-content-center">
			<div>
				<div class="text-center text-box p-3">
					<br><b>INGREDIENT LIST</b><br>
					<b>ㅡ</b>
				</div>
				<div class="d-flex circle-box justify-content-between">
					<div class="circle"></div>
					<div class="circle"></div>
					<div class="circle"></div>
					<div class="circle"></div>
					<div class="circle"></div>
				</div>
				<div class="d-flex circle-box justify-content-between">
					<div class="circle"></div>
					<div class="circle"></div>
					<div class="circle"></div>
					<div class="circle"></div>
					<div class="circle"></div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$(document).ready(function(){
		$('#main').on('click', function(){
			location.href="/main";
		});
		$('#sign_in').on('click', function(){
			location.href="/user/sign_in_view";
		});
	});
	</script>
	
</body>
</html>