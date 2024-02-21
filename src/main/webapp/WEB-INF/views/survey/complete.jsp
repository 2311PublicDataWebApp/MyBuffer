<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>주문 완료</title>
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
            <main class="my-5">
				<table class="table">
                    <thead class="table-light">
                        <tr>
                            <th colspan="2" scope="col">${order.howtoPay }</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>처리결과</th>
                            <td>정상적으로 처리되었습니다.</td>
                        </tr>
                        <tr>
                            <th>주문번호</th>
                            <td>${order.orderNo }</td>
                        </tr>
                        <tr>
                            <th>입금금액</th>
                            <td>${order.price } 원</td>
                        </tr>
                        <tr>
                            <th>입금은행</th>
                            <td>${order.bankName }</td>
                        </tr>
                        <tr>
                            <th>입금은행 예금주</th>
                            <td>${order.depoName }</td>
                        </tr>
                        <tr>
                            <th>입금계좌번호</th>
                            <td>${order.acctNum }</td>
                        </tr>
                    </tbody>
                </table>
            </main>
            <footer>
				<img src="../resources/img/footer.png">
			</footer>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    </body>
</html>