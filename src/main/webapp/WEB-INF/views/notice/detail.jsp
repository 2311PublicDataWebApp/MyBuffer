<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<head>
	<meta charset="UTF-8">
	<title>공지사항 상세</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/main.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"crossorigin="anonymous"></script>
		<style>
			ul {
				list-style-type: none;
				padding-left: 0;
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
							  <li><a class="dropdown-item" href="/product/list.do">제품 목록</a></li>
							  <li><a class="dropdown-item" href="/member/list.do">회원 목록</a></li>
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
			<h1 class="mb-4 py-5 p-3 mb-5 rounded border-bottom">공지사항 상세조회</h1>
			<br>
			<ul>
				<div class="row my-4 justify-content-center">
					<li><label for="productName" class="col-sm-2 col-form-label"><h3>제목</h3></label>
						<span>${notice.noticeName }</span></li>
				</div>
				<div class="row my-4 justify-content-center">
					<li><label for="productName" class="col-sm-2 col-form-label"><h4>작성자</h4></label>
						<span>${notice.noticeWriter }</span></li>
				</div>
				<div class="row my-4 justify-content-center ">
					<li>
						<label for="productName" class="col-sm-2 col-form-label mb-3"><h4>내용</h4></label>
						<div >
							<textarea style="width: 799px; height: 800px; background-color: #f8f9fa; border: 1px solid black; border-radius: 30px;" class="overflow-auto text-wrap p-3" >${notice.noticeContent }</textarea>
						</div>
					</li>
				</div>
				<div class="row mb-4 justify-content-center">
					<li>
					<label>첨부파일</label> 
					<span><a class="link-underline-light" href="../resources/nuploadFiles/${notice.noticeFileRename }" download>${notice.noticeFileName }</a></span>
					</li>
				</div>
			</ul>
			<br> <br>
			<c:if test="${memberId eq 'admin' }">
				<div class="row">
					<div class="container text-center ">
						<button type="button" class="btn btn-lg rounded-pill" style="width: 220px; height: 60px; background-color: #04D9C4; color: #ffffff;" onclick="showModifyPage();">수정하기</button>
						<button type="button" class="btn btn-lg rounded-pill" style="width: 220px; height: 60px; background-color: #aaaaaa; color: #ffffff;" onclick="deleteNotice(${notice.noticeNo });">삭제하기</button>
					</div>
				</div>
			</c:if>
			<br>
			<br>
			<div class="container text-center">
				<button type="button" class="btn btn-lg rounded-pill" style="width: 220px; height: 60px; background-color: #04D9C4; color: #ffffff;" onclick="showNoticePage();">목 록</button>
			</div>
		</main>
	</div>
	<footer class="d-flex flex-wrap justify-content-between align-items-center py-5 border-top" style="background-color: #F9FFFD; - -bs-gutter-x: 0;">
		<div class="col-md-1 d-flex justify-content-center align-items-center"></div>
		<div class="col-md-4 pt-3 pb-2 d-flex justify-content-center align-items-center border-end border-1">
			<img alt="" src="../resources/img/loogoo.png" style="height: 77px;">
		</div>
		<div class="col-md-3 d-flex justify-content-end align-items-center">
			<img alt="" src="../resources/img/text.png" style="height: 95px;">
		</div>
		<div class="col-md-2 d-flex justify-content-center align-items-center"></div>
	</footer>
	<script>
			function deleteNotice(noticeNo) {
				if (confirm("삭제하시겠습니까")) {
					location.href = "/notice/delete.do?noticeNo=" + noticeNo;
				}
			}
			function showModifyPage() {
				var noticeNo = "${notice.noticeNo }";
				location.href = "/notice/modify.do?noticeNo=" + noticeNo;
			}
			function showNoticePage() {
				location.href = "/notice/list.do";
			}
		</script>
</body>
</html>