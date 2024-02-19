<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	  <style>
        h1 {
            font-weight: bold;
        }
        input[type="text"], input[type="password"] {
            max-width: 300px;
        }
    </style>
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
            <main class="my-5">
            <div class="container mt-5 d-flex justify-content-center align-items-center">
			    <form action="/member/login.do" method="post">
			    <h1 class="mb-4 text-center">로그인</h1>
                <div class="mb-3">
                    <label for="userId" class="form-label">아이디를 입력하세요</label>
                    <input type="text" class="form-control" id="userId" name="memberId">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호를 입력하세요</label>
                    <input type="password" class="form-control" id="password" name="memberPw">
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="save" name="save">
                    <label class="form-check-label" for="save">아이디 저장</label>
                </div>
                <button type="submit" class="btn btn-primary">로그인</button>
                <br><br>
                <a href="/member/findid.do">아이디 찾기</a>
                <a href="/member/findpassword.do">비밀번호 찾기</a>
                <a href="/member/insert.do">회원가입</a>
                </form>
            </div>
            </main>
            <footer>
				<img src="../resources/img/footer.jpg">
			</footer>
        </div>
            
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous">
    </script>
</body>
</html>