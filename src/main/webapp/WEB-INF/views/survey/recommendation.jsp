<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>제품 추천</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	</head>
	<body>
		<div class="container">
			<header class="navbar navbar-expand-lg bd-navbar shadow-sm">
				<nav class="container" aria-label="Main navigation">
					<div class="d-flex" style="width: 4.25rem;"></div>
					<div class="d-flex">
						<ul class="nav">
							<li class="nav-item">
								<a class="nav-link active" aria-current="page" href="#"><img
										src="../resources/img/logo.png" style="height: 40px;" alt=""></a>
							</li>
						</ul>
					</div>
					<div class="d-flex btn-group">
						<button class="btn btn-body dropdown-toggle" type="button" data-bs-toggle="dropdown"
							aria-expanded="false" style="border-color: white;">
							<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="#818181"
								class="bi bi-person-circle" viewBox="0 0 16 16">
								<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
								<path fill-rule="evenodd"
									d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
							</svg>
						</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">로그인</a></li>
							<li><a class="dropdown-item" href="#">회원가입</a></li>
						</ul>
					</div>
				</nav>
			</header>
			<main class="my-5 px-5">
				<div class="row row-cols-1 row-cols-md-3 g-4">
					<c:forEach items="${pList }" var="product">
						<div class="col">
							<div class="card h-100">
								<img src="../resources/puploadFiles/${product.productFileRename }" class="card-img-top" alt="No Image" >
								<div class="card-body">
									<p class="card-text text-center">
										<a href="/survey/purchase.do" class="link-dark link-offset-2 link-underline-opacity-0">${product.productName }</a>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</main>
			<footer>
				<img src="../resources/img/footer.jpg" alt="">
			</footer>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	</body>
</html>