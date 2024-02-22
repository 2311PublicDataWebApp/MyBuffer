<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>제품 등록 페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/main.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	</head>
	<body style="background-color: #f9f9f9;">
		<header class="navbar navbar-expand-lg bd-navbar shadow-sm" style="background-color: #ffffff;">
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
					<ul class="dropdown-menu">
						<c:if test="${memberId eq null }">
							<li><a class="dropdown-item" href="/member/login.do">로그인</a></li>
							<li><a class="dropdown-item" href="/member/register.do">회원가입</a></li>
						</c:if>
						<c:if test="${memberId ne null }">
							<c:if test="${memberId ne 'admin' }">
								<li><a class="dropdown-item" href="/member/logout.do">로그아웃</a></li>
								<li><a class="dropdown-item" href="/member/updatemember.do">정보 수정</a></li>
							</c:if>
							<c:if test="${memberId eq 'admin' }">
								<li><a class="dropdown-item" href="/member/logout.do">로그아웃</a></li>
								<li><a class="dropdown-item" href="/member/list.do">회원 목록</a></li>
								<li><a class="dropdown-item" href="/product/list.do">제품 목록</a></li>
							</c:if>
						</c:if>
					</ul>
				</div>
			</nav>
		</header>
		<div class="container">
			<main class="mx-auto">
				<div class="row mt-5 mb-5"></div>
				<div class="row mb-5 justify-content-center">
					<div class="col-md-8 rounded-5 shadow" style="background-color: #ffffff;">
						<div class="py-5 px-5">
							<h2 class="mb-4 py-3">제품 등록</h2>
							<hr>
							<br>
							<form action="/product/insert.do" method="post" enctype="multipart/form-data">
									<div class="row my-4 justify-content-center">				
										<label for="productName" class="col-sm-2 col-form-label">제품명</label>
											<div class="col-sm-7">
												<input type="text" class="form-control" name="productName" id="productName">
											</div>
									</div>
									<div class="row mb-4 justify-content-center">	
										<label for="brandName" class="col-sm-2 col-form-label">브랜드명</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="brandName" id="brandName">
										</div>
									</div>
									<div class="row mb-4 justify-content-center">
										<label for="price" class="col-sm-2 col-form-label">제품가격</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="price" id="price">
										</div>
									</div>
									<div class="row mb-4 justify-content-center">
										<label for="servingSize" class="col-sm-2 col-form-label">수량</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="servingSize" id="servingSize">
										</div>
									</div>
									<div class="row mb-4 justify-content-center">
										<label for="expiredDate" class="col-sm-2 col-form-label">소비기한</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="expiredDate" id="expiredDate" placeholder="YY/MM/DD">
										</div>
									</div>
									<div class="row mb-4 justify-content-center">
										<label for="ageCode" class="col-sm-2 col-form-label">연령대코드</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="ageCode" id="ageCode" placeholder="A / B / C">
										</div>
									</div>
									<div class="row mb-4 justify-content-center">
										<label for="gender" class="col-sm-2 col-form-label">연령대코드</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="gender" id="gender" placeholder="M / F">
										</div>
									</div>
									<div class="row mb-4 justify-content-center">
										<label for="uploadFile" class="col-sm-2 col-form-label">제품 이미지</label>
										<div class="col-sm-7">
											<input type="file" class="form-control" name="uploadFile" id="uploadFile" style="color: #919191">
										</div>
									</div>
									<br>
								<div class="my-4 d-grid gap-5 d-md-flex justify-content-md-center">
									<button type="submit" class="btn btn-lg rounded-pill shadow-sm" style="width: 220px; height: 60px; background-color: #04D9C4; color: #ffffff;">등록하기</button>
									<button type="reset" class="btn btn-light btn-lg rounded-pill shadow-sm" style="width: 220px; height: 60px; background-color: #AAAAAA; color: #ffffff;">초기화</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="row mb-5"></div>
			</main>
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
	</body>
</html>