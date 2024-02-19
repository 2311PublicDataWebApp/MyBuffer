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
	</head>
	<body>
		<header class="navbar navbar-expand-lg bd-navbar shadow-sm">
			<nav class="container" aria-label="Main navigation">
				<div class="d-flex" style="width: 4.25rem;"></div>
				<div class="d-flex">
					<ul class="nav">
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="#">
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
						<c:if test="${session.memberId eq null }">
							<li><a class="dropdown-item" href="#">로그인</a></li>
							<li><a class="dropdown-item" href="#">회원가입</a></li>
						</c:if>
						<c:if test="${session.memberId ne null }">
							<c:if test="${session.memberId ne 'admin' }">
								<li><a class="dropdown-item" href="#">회원 정보수정</a></li>
							</c:if>
							<c:if test="${session.memberId eq 'admin' }">
								<li><a class="dropdown-item" href="#">회원 목록</a></li>
								<li><a class="dropdown-item" href="#">제품 목록</a></li>
							</c:if>
						</c:if>
					</ul>
				</div>
			</nav>
		</header>
		<div class="container-cover">
			<main class="mx-auto">
				<div class="row p-5 p-md-5 justify-content-md-center text-body-emphasis">
					<div class="col-md-5 px-0">
						<c:if test="${product.productFileName ne null }">
							<div style="text-align: center;"><img src="../resources/puploadFiles/${product.productFileRename }" style="width: 300px;" alt="제품 이미지"></div>
						</c:if>
						<c:if test="${product.productFileName eq null }">
							<div style="text-align: center;"></div>
						</c:if>
					</div>
					<div class="col-md-3 px-0">
						<h3>${product.productName }</h3>
						<hr>
						<p>${product.brandName }</p>
						<p>${product.servingSize } 정</p>
						<fmt:parseDate value="${product.expiredDate}" var="expiredDate" pattern="yyyy-MM-dd HH:mm:ss" />
						<fmt:formatDate value="${expiredDate }" pattern="yyyy년 MM월 dd일"  var="eDate"/>
						<p>${eDate }</p>
						<hr>
						<p>판매가격	₩ ${product.price }</p>
						<div class="my-5 d-grid gap-5 d-md-flex justify-content-md-center">
							<button type="submit" class="btn btn-lg rounded-pill shadow-sm" style="width: 250px; height: 55px; background-color: #04D9C4; color: #ffffff;">구매하기</button>
						</div>
					</div>
				</div>
				<div class="row py-5 justify-content-center" style="background-color: #f8f8f8;">
					<div class="col-md-8 m-5 rounded-5 shadow border border-1" style="background-color: #ffffff;">
						<div class="m-5">
							<h5>제품 설명란</h5>
							<br>
							<p>
								밀크시슬은 수 세기 동안 전통적인 약초학자들이 사용해 왔습니다. 
								과학적 연구에 따르면 밀크시슬에 포함된 성분은 건강한 간 기능을 증진할 수 있다고 합니다.
								이 베지 포뮬라에는 건강에 이로운 아티초크 및 민들레도 포함되어 있습니다.
							</p>
							<p>
								밀크시슬은 수 세기 동안 전통적인 약초학자들이 사용해 왔습니다. 
								과학적 연구에 따르면 밀크시슬에 포함된 성분은 건강한 간 기능을 증진할 수 있다고 합니다.
								이 베지 포뮬라에는 건강에 이로운 아티초크 및 민들레도 포함되어 있습니다.
							</p>
							<p>
								밀크시슬은 수 세기 동안 전통적인 약초학자들이 사용해 왔습니다. 
								과학적 연구에 따르면 밀크시슬에 포함된 성분은 건강한 간 기능을 증진할 수 있다고 합니다.
								이 베지 포뮬라에는 건강에 이로운 아티초크 및 민들레도 포함되어 있습니다.
							</p>
						</div>
					</div>
				</div>
			</main>
		</div>
		<footer >
			<img src="../resources/img/footer.jpg">
		</footer>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	</body>
</html>