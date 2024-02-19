<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>구매</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="../resources/css/main.css">
    </head>
    <body>
        <div class="container">
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
							<c:if test="${memberId eq null }">
								<li><a class="dropdown-item" href="#">로그인</a></li>
								<li><a class="dropdown-item" href="#">회원가입</a></li>
							</c:if>
							<c:if test="${memberId ne null }">
								<c:if test="${session.memberId ne 'admin' }">
									<li><a class="dropdown-item" href="#">회원 정보수정</a></li>
								</c:if>
								<c:if test="${memberId eq 'admin' }">
									<li><a class="dropdown-item" href="#">회원 목록</a></li>
									<li><a class="dropdown-item" href="#">제품 목록</a></li>
								</c:if>
							</c:if>
						</ul>
					</div>
				</nav>
			</header>
            <main class="my-5 px-5 mx-5">
				<div class="my-5">
                    <h2>배송지</h2>
                    <p>주소 이름</p>
                    <p>전화번호</p>
                    <p>주소</p>
                </div>
                <div class="my-5">
					<div>
						<h2>주문상품</h2>
					</div>
					<div class="row">
						<div class="col-4">
							<img src="../resources/puploadFiles/${product.productFileRename }" alt="No Image">
						</div>
						<div class="col-8">
							<div>
								<h4 class="mb-4">제품 이름</h4>
							</div>
							<div class="row pt-5">
								<p class="col-4">주문금액</p>
								<p class="col-4">24000원</p>
								<p class="col-4"></p>
							</div>
						</div>
					</div>
                </div>
				<form action="/survey/complete.do" method="post">
                <div class="my-5">
                    <h2>구매방식</h2>
                    <div class="form-check">
						<input class="form-check-input" type="radio" name="mutongjang" id="mutongjang">
						<label class="form-check-label" for="mutongjang">
							무통장입금
						</label>
					</div>
                </div>
				<div class="my-5">
					<h2>구매정보</h2>
						<fieldset class="border p-4">
						<div class="row g-3 align-items-center mb-4">
							<div class="col-1">
								<label class="col-sm-12 col-form-label" for="depoName">입금자명</label>
							</div>
							<div class="col-6">
								<input class="form-control" type="text" name="depoName" id="depoName">
							</div>
							<div class="col-5"></div>
						</div>
						<div class="row g-3 align-items-center mb-4">
							<div class="col-1">
								<label class="col-sm-12 col-form-label" for="acctNum">계좌번호</label>
							</div>
							<div class="col-6">
								<input class="form-control" type="password" name="acctNum" id="acctNum">
							</div>
							<div class="col-5"></div>
						</div>
						<div class="row g-3 align-items-center">
							<div class="col-1">
								<label class="col-sm-12 col-form-label" for="depoName">입금자명</label>
							</div>
							<div class="col-6">
								<select class="form-select" aria-label="Default select example">
									<option value="kb">국민은행</option>
									<option value="woori">우리은행</option>
									<option value="hana">하나은행</option>
									<option value="nh">농협은행</option>
									<option value="sh">신한은행</option>
								</select>
							</div>
							<div class="col-5"></div>
						</div>
					</fieldset>
				</div>
				<div class="my-4 d-grid gap-5 d-md-flex justify-content-md-center">
					<button type="submit" class="btn btn-lg rounded-pill" style="width: 220px; height: 60px; background-color: #04D9C4; color: #ffffff;">구매하기</button>
				</div>				
			</form>
            </main>
            <footer>
				<img src="../resources/img/footer.jpg">
			</footer>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    </body>
</html>