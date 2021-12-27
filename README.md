# JASSiKDAN( 냉장고 연계형 SNS )
Date : 2021/11/05 ~ 

## 📢 프로젝트 설명
* Spring Boot 를 이용한 웹 서비스를 개발 경험을 쌓기 위해 [냉장고 연계형 SNS] 프로젝트 개발
* 냉장고와 레시피를 연결하여 추천 또는 소비자 동향 파악
* 기본적인 로그인/ 식자제 등록 / 레시피 등록 / 해시태그 검색 / 좋아요 기능 수행

## ✏️ 사용 기술
<strong>Language</strong> : JAVA . Javascript . html . css . SQL . <br>
<strong>Framework</strong> : SpringBoot . Bootstrap . JQuery <br>
<strong>Tool</strong> : MySQL . Github . AWS EC2 <br>


## 🛠 설계 🛠
* 프로젝트 DB 설계 
  * [DB 설계 Link!](https://docs.google.com/spreadsheets/d/17MNIuqNrTlxxjRVYDmuK8cXjHTH7lc1nfQyk_CQZwdg/edit?usp=sharing, "DB 설계")

* 프로젝트 URL 설계
  * [URL 설계 Link!](https://docs.google.com/spreadsheets/d/17MNIuqNrTlxxjRVYDmuK8cXjHTH7lc1nfQyk_CQZwdg/edit#gid=1753901336, "URL 설계")

* 프로젝트 API 설계
  * [API 설계 Link!](https://docs.google.com/spreadsheets/d/17MNIuqNrTlxxjRVYDmuK8cXjHTH7lc1nfQyk_CQZwdg/edit#gid=453960019, "API 설계")


## ⛏ 주요기능 ⛏

* 회원가입(user)
  - package : [com.jassikdan.user.*](https://github.com/arock1998/jassikdan_web/tree/develop/src/main/java/com/jassikdan/user)
  - view : [webapp/WEB-INF/jsp/user/sign_up.jsp](https://github.com/arock1998/jassikdan_web/blob/develop/src/main/webapp/WEB-INF/jsp/user/sign_up.jsp)
* 로그인(user)
  - package : [com.jassikdan.user.*](https://github.com/luthita/Deli_project_210901/tree/develop/src/main/java/com/luthita/user)
  - view :[webapp/WEB-INF/jsp/user/sign_in.jsp](https://github.com/arock1998/jassikdan_web/blob/develop/src/main/webapp/WEB-INF/jsp/user/sign_in.jsp)
* 냉장고 보기
  - package : [com.jassikdan.ingrdIhave.*](https://github.com/arock1998/jassikdan_web/tree/develop/src/main/java/com/jassikdan/ingrdIhave)
  - view : [webapp/WEB-INF/jsp/mypage/refrigerator.jsp](https://github.com/arock1998/jassikdan_web/blob/develop/src/main/webapp/WEB-INF/jsp/mypage/refrigerator.jsp)
* 내 래시피 보기
  - package : [com.jassikdan.recipe.*](https://github.com/arock1998/jassikdan_web/tree/develop/src/main/java/com/jassikdan/recipe)
  - view : [webapp/WEB-INF/jsp/mypage/recipe.jsp](https://github.com/arock1998/jassikdan_web/blob/develop/src/main/webapp/WEB-INF/jsp/mypage/recipe.jsp)
* 타임라인 / 해시태그 검색
  - package : [com.jassikdan.timeline.*](https://github.com/arock1998/jassikdan_web/blob/develop/src/main/java/com/jassikdan/timeline/TimelineController.java)
  - view : [webapp/WEB-INF/jsp/main/review.jsp](https://github.com/arock1998/jassikdan_web/blob/develop/src/main/webapp/WEB-INF/jsp/timeline/timeline.jsp)
* 내 래시피 등록
  - package : [com.jassikdan.recipe.*](https://github.com/arock1998/jassikdan_web/tree/develop/src/main/java/com/jassikdan/recipe)
  - view : [webapp/WEB-INF/jsp/main/like_list.jsp](https://github.com/arock1998/jassikdan_web/blob/develop/src/main/webapp/WEB-INF/jsp/recipe/insert.jsp)


<hr>


## 📷 미리보기 📷

### * 회원가입 & 로그인
<img src="https://user-images.githubusercontent.com/81209784/147491867-11afd961-9c04-4f3a-86ec-0b551638087d.gif">

### * 식료품 CRUD
<img src="https://user-images.githubusercontent.com/81209784/147493412-16ff7864-d2e0-4415-b003-176badd37bea.gif">

### * 레시피 살펴보기
<img src="https://user-images.githubusercontent.com/81209784/147494220-49cf913f-2edc-47d4-a0a0-99c9509f4e4e.gif">

### * 해시태그 검색
<img src="https://user-images.githubusercontent.com/81209784/147497552-500b49a0-c41b-444b-9cfc-5665f065ea49.png">


<hr>

## 🎁 향후 계획 🎁
   - 식료품 CRUD 시 아이콘 속으로 아이콘이 들어가는 버그 해결 예정 -> drop시 특정 class를 가지고 있는 아이콘만 dorp할 수 있도록 수정
   - 레시피 등록 구현
   - 해시태그 검색 시 데이터를 하나하나 비교해 시간 지연 문제 개선 예정 
   - UI/UX 디자인 구현
  
