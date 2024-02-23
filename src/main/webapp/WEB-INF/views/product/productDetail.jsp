<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>제품 상세 페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/main.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	</head>
	<body>
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
								<li><a class="dropdown-item" href="/member/list.do">회원 목록</a></li>
								<li><a class="dropdown-item" href="/product/list.do">제품 목록</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="/member/logout.do">로그아웃</a></li>
							</c:if>
						</c:if>
					</ul>
				</div>
			</nav>
		</header>
		<div class="container-cover">
			<main>
				<div class="row gap-5 p-5 p-md-5 justify-content-md-center text-body-emphasis border-bottom" style="--bs-gutter-x: 0;">
					<div class="col-md-3 px-0 pt-4">
						<c:if test="${product.productFileName ne null }">
							<div style="text-align: center;"><img src="../resources/puploadFiles/${product.productFileRename }" style="width: 340px;" alt="제품 이미지"></div>
						</c:if>
						<c:if test="${product.productFileName eq null }">
							<div style="text-align: center;"></div>
						</c:if>
					</div>
					<div class="col-md-3 px-4 justify-content-center">
						<div>
							<div class="row d-flex pt-3 mb-3 justify-content-center border-bottom" style="--bs-gutter-x: 0;">
								<div class="d-flex col-md-12 justify-content-start align-items-start">
									<p class="fw-semibold" style="font-size: 25px;">${product.productName }</p>
								</div>
							</div>
							<div class="row d-flex justify-content-center" style="--bs-gutter-x: 0;">
								<div class="d-flex col-md-12 justify-content-start align-items-start">
									<p class="fs-5 fw-medium">${product.brandName }</p>
								</div>
							</div>
							<div class="row d-flex pt-3 mb-0 justify-content-center border-top" style="--bs-gutter-x: 0;">
								<div class="d-flex col-md-3 justify-content-start align-items-start">
									<p class="fw-medium" style="color: #616161;">제공수량</p>
								</div>
								<div class="d-flex col-md-5 justify-content-start align-items-start">
									<p class="fw-medium" style="color: #616161;">${product.servingSize } 정</p>
								</div>
								<div class="d-flex col-md-4 justify-content-start align-items-start"></div>
							</div>
							<fmt:parseDate value="${product.expiredDate}" var="expiredDate" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${expiredDate }" pattern="yyyy년 MM월 dd일"  var="eDate"/>
							<div class="row d-flex justify-content-center border-bottom" style="--bs-gutter-x: 0;">
								<div class="d-flex col-md-3 justify-content-start align-items-center">
									<p class="fw-medium" style="color: #616161;">소비기한</p>
								</div>
								<div class="d-flex col-md-8 justify-content-start align-items-center">
									<p class="fw-medium" style="color: #616161;">${eDate }</p>
								</div>
								<div class="d-flex col-md-1"></div>
							</div>
							<div class="row d-flex pt-3 justify-content-center align-items-center" style="--bs-gutter-x: 0;">
								<div class="d-flex col-md-3 justify-content-start">
									<p class="fw-medium" style="color: #616161;">판매가격</p>
								</div>
								<div class="d-flex col-md-5 justify-content-center">
									<p class="fw-semibold" style="font-size: 30px;"> ₩ ${product.price }</p>
								</div>
								<div class="d-flex col-md-4"></div>
							</div>
							<div class="my-4 d-grid gap-5 d-md-flex justify-content-md-center">
								<button type="button" class="btn btn-lg rounded-pill shadow-sm" style="width: 270px; height: 58px; background-color: #04D9C4; color: #ffffff; font-size: 20px; --bs-gutter-x: 0" onclick="checkLogin('${memberId}', ${product.productNo });">구매하기</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row p-4 justify-content-center" style="background-color: #f9f9f9; --bs-gutter-x: 0">
					<div class="row my-5 py-2 col-md-8 rounded-5 shadow border border-1" style="background-color: #ffffff; --bs-gutter-x: 0">
						<div class="col-md-6 m-5">
							<div class="pb-1">
								<p class="fs-5 fw-semibold">제품 설명란</p>
								<c:if test="${product.description1 ne null}">
									<p class="lh-base">${product.description1 }</p>
								</c:if>
								<c:if test="${product.description2 ne null}">
									<p class="lh-base">${product.description2 }</p>
								</c:if>
								<c:if test="${product.description3 ne null}">
									<p class="lh-base">${product.description3 }</p>
								</c:if>
							</div>
							<div class="pb-1">
								<p class="fs-5 fw-semibold">권장 복용법</p>
								<p class="lh-base">${product.description }</p>
							</div>
							<div class="pb-1">
								<p class="fs-5 fw-semibold">주의사항</p>
								<p class="lh-base">${product.caution }</p>
							</div>
						</div>
						<div class="col m-5">
							<table class="table table-striped">
								<thead>
									<tr>
										<th colspan="2" scope="col">
											<p class="mt-0 fs-5 fw-semibold">
												영양 성분 정보
											</p>
										</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${iList }" var="ingredient">
										<tr>
											<td>${ingredient.ingredientName }</td>
											<td>${ingredient.servingAmount } ${ingredient.servingUnit }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
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
        <script>
            function checkLogin(memberId, productNo) {
                if(memberId != '') {
                    location.href="/survey/purchase.do?productNo=" + productNo + "&memberId=" + memberId;
                } else {
                    alert("로그인 후 이용가능한 서비스입니다.")
                }
            }
        </script>
	</body>
</html>