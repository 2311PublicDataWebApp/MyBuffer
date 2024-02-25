<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>나만의 버퍼(My Buffer)</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="../resources/css/main.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    </head>
    <body>
		<header class="navbar navbar-expand-lg bd-navbar shadow-sm py-2" style="background-color: #ffffff;">
			<nav class="container" aria-label="Main navigation">
				<div class="d-flex" style="width: 4.25rem;"></div>
				<div class="d-flex">
					<ul class="nav">
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="/">
								<img src="../resources/img/logo.png" style="height: 40px;" alt="No Image">
							</a>
						</li>
					</ul>
				</div>
				<div class="d-flex btn-group">
					<button class="btn btn-body dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="border-color: white;">
						<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="#818181" class="bi bi-person-circle" viewBox="0 0 16 16">
							<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
							<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
						</svg>
					</button>
					<ul class="dropdown-menu dropdown-menu-end">
						<c:if test="${memberId eq null }">
							<li><a class="dropdown-item" href="/member/login.do">로그인</a></li>
							<li><a class="dropdown-item" href="/member/register.do">회원가입</a></li>
						</c:if>
						<c:if test="${memberId ne null }">
							<c:if test="${memberId ne 'admin' }">
								<li><a class="dropdown-item" href="/member/updatemember.do">정보 수정</a></li>
								<li><a class="dropdown-item" href="/member/logout.do">로그아웃</a></li>
							</c:if>
							<c:if test="${memberId eq 'admin' }">
								<li><a class="dropdown-item" href="/notice/list.do">공지 목록</a></li>
								<li><a class="dropdown-item" href="/product/list.do">제품 목록</a></li>
								<li><a class="dropdown-item" href="/member/list.do">회원 목록</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="/member/logout.do">로그아웃</a></li>
							</c:if>
						</c:if>
					</ul>
				</div>
			</nav>
		</header>
        <div class="cover-container d-flex w-100 h-100 mx-auto flex-column shadow-sm">
            <main class="">
				<div class="p-5" style="width: auto; height: 727px; background-image: url('../resources/img/section1.png');">
<!-- 				background-color: #F1FFFC; -->
					<div class="p-5">
						<div class="row d-flex mb-3">
							<div class="col-md-1"></div>
							<div class="col-md-11">
								<p class="fw-bold lh-sm" style="color: #55E5D1; font-size: 90px;">나만의 버퍼와<br>함께해요!</p>
							</div>
						</div>
						<div class="flex-row d-flex py-3">
							<div class="col-md-1"></div>
							<div class="col-md-11">
								<p class="fw-light" style="color: #00C8B4; font-size: 34px;">영양제가 처음인 영린이들이 위해!<br>설문조사를 통해 영양제에 한 발짝 더 가까이<br>추천을 받아 버프 업!</p>
							</div>
						</div>
						<div class="flex-row d-flex py-3 justify-content-center">
							<div class="col-md-8"></div>
							<div class="col-md-2 justify-content-center align-items-end">
								<button type="button" onclick="showSurvey();" class="btn btn-lg rounded-pill shadow-sm" style="width: 280px; height: 80px; background-color: #53DBDB; color: #ffffff; font-size: 23px;">추천 받기</button>
							</div>
							<div class="col-md-2"></div>
						</div>
					</div>
				</div>
            </main>
        </div>
        <div class="container my-5">
        		<div class="p-5 text-center rounded-4" style="background-color: #FCFCFC;">
        			<img class="bi mt-4 mb-3" alt="" src="../resources/img/logoCircle.png" style="width: 110px;">
        			<p class="fw-bold lh-sm" style="font-size: 40px;">공지사항</p>
        			<p class="col-lg-8 mx-auto fs-5 text-muted">
        				나만의 버퍼의 제품 업데이트와 다양한 소식을 들어보세요.
    			</p>
        			<div class="d-inline-flex gap-2 my-4">
					<button type="button" onclick="showNotice();" class="btn btn-outline-secondary btn-lg px-4 rounded-pill" style="width: 250px; height: 60px; font-size: 19px;">보러가기</button>
        			</div>
        		</div>
        </div>
        <div class="d-flex flex-column">
        		<div style="height: 405px; background-color: #99EBB5;">
        			<div class="p-5 align-items-center">
					<div class="row d-flex mt-4 mb-3">
						<div class="col-md-1"></div>
						<div class="col-md-11">
							<p class="fw-bold lh-sm" style="color: #ffffff; font-size: 53px;">
								건강한 삶을 위한 여정.<br>지금 '나만의 버퍼'와 함께하세요.
							</p>
						</div>
					</div>
					<div class="flex-row d-flex">
						<div class="col-md-1"></div>
						<div class="col-md-11">
							<p class="fw-normal" style="color: #ffffff; font-size: 22px;">
								'나만의 버퍼'에서는 당신을 위한 특별한 정보, 건강에 대한 새로운 시각을 선사합니다.<br>
								지금 바로 '나만의 버퍼'를 만나세요.<br>
								당신의 건강한 삶을 응원합니다!
							</p>
						</div>
					</div>
				</div>
        		</div>
        </div>
        <footer class="d-flex flex-wrap justify-content-between align-items-center py-5 border-top" style="background-color: #F9FFFD; --bs-gutter-x: 0;">
            <div class="col-md-1 d-flex justify-content-center align-items-center"></div>
            <div class="col-md-4 pt-3 pb-2 d-flex justify-content-center align-items-center border-end border-1">
                <img alt="" src="../resources/img/loogoo.png" style="height: 77px;">
            </div>
            <div class="col-md-3 d-flex justify-content-end align-items-center">
                <img alt="" src="../resources/img/text.png" style="height: 95px;">
            </div>
            <div class="col-md-2 d-flex justify-content-center align-items-center"></div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
		<script>
			function showSurvey() {
				location.href="/survey/insert.do"
			}
			function showNotice() {
				location.href="/notice/list.do"
			}
		</script>
    </body>
</html>