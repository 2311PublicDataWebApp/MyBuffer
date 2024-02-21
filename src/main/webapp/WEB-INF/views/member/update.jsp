<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>MyBuffer</title>
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
				<h1>안녕하세요</h1>			            
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6">
						<h1 class="text-center mb-4">회원 정보 수정</h1>
						<form action="/member/withdrawmember.do" method="post">
							 <a href="/member/withdrawmember.do" class="btn btn-danger btn-lg" style="display: block; margin-left: auto; margin-right: auto;">회원탈퇴</a>
						</form>
						<form action="/member/updatemember.do" method="post">

							<div>
								<label for="userId">아이디</label> <input type="text" id="userId"
									name="userId">
							</div>
							<div>
								<label for="password">비밀번호</label> <input type="password"
									id="password" name="password">
							</div>
							<!-- <div>
							            <label for="confirmPassword">비밀번호 확인:</label>
							            <input type="password" id="confirmPassword" name="confirmPassword">
							     </div> -->
							<div>
								<label for="name">이름</label> <input type="text" id="name"
									name="name">
							</div>
							<div>
								<label for="address">주소</label> <input type="text" id="address"
									name="address">
							</div>
							<div>
								<label for="email">이메일</label> <input type="email" id="email"
									name="email">
							</div>
							<div>
								<label for="phone">휴대폰번호</label> <input type="tel" id="phone"
									name="phone">
							</div>
							<div>
								<label for="birthday">생년월일</label> <input type="date"
									id="birthday" name="birthday">
							</div>
							 <button type="submit" class="btn btn-primary">다음</button>

						</form>
					</div>
				</div>
			</div>
            </main>
            <footer>
				<img src="../resources/img/footer.png">
			</footer>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    </body>
</html>