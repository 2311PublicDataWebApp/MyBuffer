<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<head>
	<meta charset="UTF-8">
	<title>MyBuffer</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/main.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"crossorigin="anonymous"></script>
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
		<main class="m-5 px-5">
			<h1 class="mb-4 py-3">공지사항</h1>
			<br>
			<table class="table">
				<thead>
					<tr class="table-info" align="center">
						<th scope="col" style="width: 10%;">번호</th>
						<th scope="col" style="width: 40%;">제목</th>
						<th scope="col" style="width: 20%;">작성자</th>
						<th scope="col" style="width: 20%;">작성날짜</th>
						<!--<th scope="col" style="width: 10%; ">첨부파일</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${nList }" var="notice" varStatus="i">
						<tr align="center">
							<td>${notice.noticeNo }</td>
							<td><a class="link-underline-light link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" href="/notice/detail.do?noticeNo=${notice.noticeNo }">${notice.noticeName}</a></td>
							<td>${notice.noticeWriter }</td>
							<td>${notice.noticeDate }</td>
							<%--<c:if test="${notice.noticeFileName ne null }"> --%>
							<!--<td>O</td> -->
							<%--</c:if> --%>
							<%--<c:if test="${notice.noticeFileName eq null }"> --%>
							<!--<td>X</td> -->
							<%--</c:if> --%>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr align="center">
						<td colspan="5">
							<c:if test="${pInfo.startNavi ne'1' }">
								<a class="link-underline-light link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" href="/notice/list.do?page=${pInfo.startNavi - 1 }">이전</a>
							</c:if> 
							<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
								<a class="link-underline-light link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" href="/notice/list.do?page=${p }">${p }</a>
							</c:forEach> 
							<c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }">
								<a class="link-underline-light link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" href="/notice/list.do?page=${pInfo.currentPage + 1 }">다음</a>
							</c:if>
						</td>
					</tr>
				</tfoot>
			</table>
			<br> <br>
			<div class="d-flex flex-wrap justify-content-center align-items-center">
				<c:if test="${memberId eq 'admin' }">
					<div class="d-flex col-md-3 justify-content-start"">
						<button type="button" class="btn rounded-pill shadow-sm" style="width: 110px; height: 38px; background-color: #04D9C4; color: #ffffff;"
							onclick="showInsertPage();">글쓰기</button>
					</div>
				</c:if>
				<div class="d-flex col-md-6"></div>
				<div class="d-flex col-md-3 justify-content-end">
					<form action="/notice/search.kh" method="get">
						<div class="input-group">
							<input class="form-control" type="text" name="searchKeyword" id="roadAddress" placeholder="입력">
							<button class="btn" type="submit" style="background-color: #04D9C4; color: #ffffff;">검색</button>
						</div>
					</form>
				</div>
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
		function showInsertPage() {
			location.href = "/notice/insert.do";
		}
	</script>
</body>
</html>