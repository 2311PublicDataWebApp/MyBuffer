<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>회원가입</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="../resources/css/main.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
        <style>
        .card-title {
            font-weight: bold;
        }
        .form-label {
            font-weight: bold;
        }
        .btn-primary {
            font-weight: bold;
        }
    </style>
    </head>
    <body>
<header class="navbar navbar-expand-lg bd-navbar shadow-sm py-2 mb-5" style="background-color: #ffffff;">
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
<div class="container">
    <main class="my-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h1 class="card-title text-center mb-4">회원가입</h1>
                        <form action="/member/register.do" method="post">
                            <div class="mb-3">
                                <label for="memberId" class="form-label">아이디:</label>
                                <input type="text" class="form-control" id="memberId" name="memberId" placeholder="아이디를 입력해 주세요">
                            </div>
                            <div class="mb-3">
                                <label for="memberPw" class="form-label">비밀번호:</label>
                                <input type="password" class="form-control" id="memberPw" name="memberPw" placeholder="10~16자리 영문,숫자,특수문자 포함">
                            </div>
                            <!-- <div class="mb-3">
                                <label for="confirmMemberPw" class="form-label">비밀번호 확인:</label>
                                <input type="password" class="form-control" id="confirmMemberPw" name="confirmMemberPw" >
                            </div> -->
                            <div class="mb-3">
                                <label for="memberName" class="form-label">이름:</label>
                                <input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름을 입력해 주세요">
                            </div>
                            <div class="mb-3">
                                <label for="memberAddress" class="form-label">주소:</label>
                                <input type="text" class="form-control" id="memberAddress" name="memberAddress" placeholder="주소를 입력해 주세요">
                            </div>
                            <div class="mb-3">
                                <label for="memberEmail" class="form-label">이메일:</label>
                                <input type="email" class="form-control" id="memberEmail" name="memberEmail" placeholder="이메일을 입력해 주세요">
                            </div>
                            <div class="mb-3">
                                <label for="memberPhone" class="form-label">휴대폰번호:</label>
                                <input type="tel" class="form-control" id="memberPhone" name="memberPhone" placeholder="휴대폰번호를 입력해 주세요">
                            </div>
                            <div class="mb-3">
                                <label for="memberDate" class="form-label">생년월일:</label>
                                <input type="date" class="form-control" id="memberDate" name="memberDate" palceholder="생년월일을 입력해 주세요">
                            </div>
                              <div class="mb-3 text-center">
                                <button type="submit" class="btn btn-primary">가입하기</button>
                            </div>
                        </form>
                    </div>
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
    </body>
</html>