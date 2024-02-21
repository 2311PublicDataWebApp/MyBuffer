<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>공지사항 수정</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="../resources/css/main.css">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
			crossorigin="anonymous"></script>
		<style type="text/css">
			ul {
				list-style-type: none;
				padding-left: 0;
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
				<h1 class="mb-4 py-3">공지사항 수정</h1>
				<br>
				<form action="/notice/modify.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
					<input type="hidden" name="noticeFilename" value="${notice.noticeFileName }">
					<input type="hidden" name="noticeFileRename" value="${notice.noticeFileRename }">
					<input type="hidden" name="noticeFilepath" value="${notice.noticeFilepath }">
					<input type="hidden" name="noticeFileSize" value="${notice.noticeFileSize }">

					<ul>
						<div class="row mb-4 justify-content-center">
							<li>
								<label for="brandName" class="col-sm-2 col-form-label">제목</label>
								<input type="text" name="noticeName" value="${notice.noticeName }">
							</li>
						</div>
						<br>
						<div class="row mb-4 justify-content-center">
							<li>
								<label for="brandName" class="col-sm-2 col-form-label">작성자</label>
								<span>${notice.noticeWriter }</span>
							</li>
						</div>
						<br>
						<li>
							<label for="exampleFormControlTextarea1" class="form-label">내용</label>
							<textarea class="form-control" id="exampleFormControlTextarea1" rows="15" cols="100"
								name="noticeContent">${notice.noticeContent }</textarea>
						</li>
						<div class="row mb-4 justify-content-center">
							<li>
								<label>첨부파일</label>
								<span for="uploadFile" class="col-sm-2 col-form-label"><a
										href="../resources/nuploadFiles/${notice.noticeFileRename }"
										download>${notice.noticeFileName }</a></span>
								<input type="file" name="reloadFile" class="form-control" 
									style="color: #919191">
							</li>
						</div>
					</ul>
					<br>
					<br>
					<div class="row">
						<div class="container text-center">
							<input type="submit" value="수정하기" id="modify" class="btn btn-lg rounded-pill"
								style="width: 220px; height: 60px; background-color: #04D9C4; color: #ffffff;">
							<button type="button" id="list" onclick="showNoticePage();"
								class="btn btn-light btn-lg rounded-pill"
								style="width: 220px; height: 60px; background-color: #AAAAAA; color: #ffffff;">목
								록</button>
						</div>
					</div>
				</form>
			</main>
			<footer>
				<img src="../resources/img/footer.png">
			</footer>
		</div>
		<script>
		function showNoticePage() {
			location.href = "/notice/list.do";
		}
		</script>
	</body>

	</html>