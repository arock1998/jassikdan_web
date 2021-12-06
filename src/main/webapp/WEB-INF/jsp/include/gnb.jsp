<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!--### header ###-->
<div id="header" class="bg-green d-flex justify-content-around align-items-center text-white">
<!-- 메뉴 토글 -->
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
	<c:choose>
		<c:when test="${userId eq null}">
			<div id="sign_in" class="d-flex justify-content-around align-items-center pointer">
				<img src="/static/images/icon/user.png" class="mr-1" alt="login" class="" width="16px">
				<div class="small">LOGIN</div>
			</div>
		</c:when>
		<c:otherwise>
			<div id="userToggle" class="d-flex justify-content-around align-items-center pointer">
				<img src="/static/images/icon/user.png" class="mr-1" alt="login" class="" width="16px">
				<div class="small">${loginId}</div>
			</div>
		</c:otherwise>
	</c:choose>

</div>


<!-- pop layer user -->
<div id="popLayerUser" class="pop-layer-user">
	<div class="pop-container">
		<div class="pop-conts">
			<a href="/user/sign_out" class="font-weight-bold ml-3">로그아웃</a>
			
            <div>
                <a href="#" class="btn-layerClose">Close</a>
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
	 	
	 	//로그인 되어있는 경우
	 	$('#userToggle').on('click', function(){
	 		var popLayerId = '#popLayerUser';
	        layer_popup(popLayerId);
	 	});
	});
	
	function layer_popup(el){
		var $el = $(el);	//레이어의 id를 $el 변수에 저장
        $el.fadeIn();
        
	      var $elWidth = ~~($el.outerWidth()),
          $elHeight = ~~($el.outerHeight()),
          docWidth = $(document).width(),
          docHeight = $(document).height();

	      // 화면의 중앙에 레이어를 띄운다. --> 바꾸자 클릭한 위치에서 드롭다운으로 떨어지도록
	      if ($elHeight < docHeight || $elWidth < docWidth) {
	          $el.css({
	              marginTop: -$elHeight /2,
	              marginLeft: -$elWidth/2
	          })
	      } else {
	          $el.css({top: 0, left: 0});
	      }
	      
	      $el.find('a.btn-layerClose').click(function(){
	           $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
	            return false;
	        });
	}
	
</script>




