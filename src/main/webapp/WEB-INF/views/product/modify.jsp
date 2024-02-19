<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>제품 수정 페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	</head>
	<body class="bg-body-tertiary">
		<header class="navbar navbar-expand-lg bd-navbar shadow-sm" style="background-color: #ffffff;">
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
		<div class="container">
			<main class="mx-auto">
				<div class="row mt-5 mb-5"></div>
				<div class="row mb-5 justify-content-center">
					<div class="col-md-8 rounded-5 shadow" style="background-color: #ffffff;">
						<div class="py-5 px-5">
							<h2 class="mb-4 py-3">제품 수정</h2>
							<hr>
							<br>
							<form action="/product/modify.kr" method="post" enctype="multipart/form-data">
								<input type="hidden" name="productNo" value="${product.productNo }">
								<!-- 첨부파일 hidden -->
								<input type="hidden" name="productFilename" value="${product.productFileName }">
								<input type="hidden" name="productFileRename" value="${product.productFileRename }">
								<input type="hidden" name="productFilePath" value="${product.productFilePath }">
								<input type="hidden" name="productFileSize" value="${product.productFileSize }">
								<div class="row my-4 justify-content-center">				
									<label for="productName" class="col-sm-2 col-form-label">제품명</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="productName" id="productName" value="${product.productName }">
										</div>
								</div>
								<div class="row mb-4 justify-content-center">	
									<label for="brandName" class="col-sm-2 col-form-label">브랜드명</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="brandName" id="brandName" value="${product.brandName }">
									</div>
								</div>
								<div class="row mb-4 justify-content-center">
									<label for="price" class="col-sm-2 col-form-label">제품가격</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="price" id="price" value="${product.price }">
									</div>
								</div>
								<div class="row mb-4 justify-content-center">
									<label for="servingSize" class="col-sm-2 col-form-label">수량</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="servingSize" id="servingSize" value="${product.servingSize }">
									</div>
								</div>
								<div class="row mb-4 justify-content-center">
									<label for="expiredDate" class="col-sm-2 col-form-label">소비기한</label>
									<div class="col-sm-7">
										<fmt:parseDate value="${product.expiredDate}" var="expiredDate" pattern="yyyy-MM-dd HH:mm:ss" />
										<fmt:formatDate value="${expiredDate }" pattern="yy/MM/dd"  var="eDate"/>
										<input type="text" class="form-control" name="expiredDate" id="expiredDate" value="${eDate }">
									</div>
								</div>
								<div class="row mb-4 justify-content-center">
									<label for="ageCode" class="col-sm-2 col-form-label">연령대코드</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="ageCode" id="ageCode" placeholder="A/B/C" value="${product.ageCode }">
									</div>
								</div>
								<div class="row mb-4 justify-content-center">
									<label for="reloadFile" class="col-sm-2 col-form-label">현재 이미지</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" value="${product.productFileName }" readonly>
<%-- 									<span><a href="../resources/puploadFiles/${product.productFileRename }" download>${product.productFileName }</a></span> --%>
									</div>
								</div>
								<div class="row mb-4 justify-content-center">
									<label for="reloadFile" class="col-sm-2 col-form-label">새로운 이미지</label>
									<div class="col-sm-7">
										<input type="file" class="form-control" name="reloadFile" id="reloadFile" style="color: #919191">
									</div>
								</div>
								<br>
								<div class="my-4 d-grid gap-5 d-md-flex justify-content-md-center">
									<button type="submit" class="btn btn-lg rounded-pill shadow-sm" style="width: 220px; height: 60px; background-color: #04D9C4; color: #ffffff;">수정하기</button>
									<button type="button" class="btn btn-light btn-lg rounded-pill shadow-sm" onclick="showProductList();" style="width: 220px; height: 60px; background-color: #AAAAAA; color: #ffffff;">이전으로</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="row mb-5"></div>
			</main>
		</div>
		<footer>
			<img src="../resources/img/footer.jpg">
		</footer>
		<script type="text/javascript">
			function showProductList() {
				location.href = "/product/list.kr";
			}
		</script>
	</body>
</html>