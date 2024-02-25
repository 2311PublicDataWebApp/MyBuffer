<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>제품 목록 페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/main.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	</head>
	<body style="font-family: Noto Sans;">
		<header class="navbar navbar-expand-lg bd-navbar shadow-sm" style="background-color: #ffffff;">
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
		<div class="container" style="min-height: 480px;">
			<main class="mx-auto">
				<div class="row mt-5 mb-5"></div>
				<div class="row justify-content-center">
					<div class="col-md-9">
						<table class="table align-middle">
							<caption></caption>
							<thead>
								<tr>
									<th scope="col" class="px-4 pb-3" style="text-align: center; width: 120px;">제품코드</th>
									<th scope="col" class="px-4 pb-3" style="text-align: center; width: 160px;">제품 이미지</th>
									<th scope="col" class="px-4 pb-3" style="text-align: left;">세부사항</th>
									<th scope="col" class="px-4 pb-3" style="text-align: center; width: 120px;">금액</th>
									<th scope="col" class="px-4 pb-3"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pList }" var="product" varStatus="p">
									<tr>
										<td class="" style="text-align: center;">${product.productNo }</td>
										<c:if test="${product.productFileName ne null }">
											<td style="text-align: center;"><img src="../resources/puploadFiles/${product.productFileRename }" style="width: 130px;" alt="제품 이미지"></td>
										</c:if>
										<td class="px-4">
											<fmt:parseDate value="${product.expiredDate}" var="expiredDate" pattern="yyyy-MM-dd HH:mm:ss" />
											<fmt:formatDate value="${expiredDate }" pattern="yyyy년 MM월 dd일" var="eDate"/>
											<p class="" style="line-height: 1.7;">
												<br>
												제품명 : ${product.productName }<br>
												브랜드명 : ${product.brandName }<br>
												수량 : ${product.servingSize } 정<br>
												소비기한 : ${eDate }
											</p>
										</td>
										<td style="text-align: center;">${product.price } 원</td>
										<td style="text-align: center;">
											<div class="btn-group">
												<button class="btn btn-body dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="border-color: white;">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots-vertical" viewBox="0 0 16 16">
													  <path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0m0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0m0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0"/>
													</svg>
												</button>
												<ul class="dropdown-menu">
													<li><a class="dropdown-item" type="button" href="/product/productDetail.do?productNo=${product.productNo }">상세 조회</a></li>
													<li><hr class="dropdown-divider"></li>
													<li><a class="dropdown-item" type="button" href="/product/modify.do?productNo=${product.productNo }">제품 수정</a></li>
													<li><button class="dropdown-item" type="button" onclick="deleteProduct(${product.productNo });">제품 삭제</button></li>
												</ul>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="d-flex flex-wrap justify-content-center align-items-center pb-5">
					<div class="d-flex col-md-7 justify-content-start">
						<form class="row g-1" action="/product/search.do" method="get">
							<div class="col-auto">
								<select class="form-select" name="searchCondition">
									<option value="productName" <c:if test="${searchCondition eq 'productName' }">selected</c:if>>제품명</option>
									<option value="brandName" <c:if test="${searchCondition eq 'brandName' }">selected</c:if>>브랜드명</option>
								</select>
							</div>
							<div class="col-auto">
								<div class="input-group">
									<input class="form-control" type="search" name="searchKeyword" placeholder="${searchKeyword }">
									<button type="submit" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;">검색</button>
								</div>
							</div>
						</form>
					</div>
					<div class="d-flex col-md-2 justify-content-end">
						<button type="button" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;" onclick="showInsertForm();">제품등록</button>
					</div>
				</div>
				<div class="row mt-3 mb-5">
					<div class="col-md-12">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center" style="font-weight: 600; ">
								<c:if test="${pInfo.startNavi != 1 }">
									<li class="page-item">
										<a class="page-link rounded-circle" href="/product/list.do?page=${pInfo.startNavi - 1 }" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>
								<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
									<li class="page-item">
										<a class="page-link rounded-circle mx-2" href="/product/list.do?page=${p }" style="border: none; color: #313131;">
											${p }
										</a>
									</li>
								</c:forEach>
								<c:if test="${pInfo.endNavi != pInfo.naviTotalCount }">
									<li class="page-item">
										<a class="page-link rounded-circle" href="/product/list.do?page=${pInfo.endNavi + 1 }" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:if>
							</ul>
						</nav>
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
		<script type="text/javascript">
			function showInsertForm() {
				location.href="/product/insert.do";
			}
			
	        function deleteProduct(productNo) {
				if(confirm("해당 제품을 삭제하시겠습니까?")) {
					location.href = "/product/delete.do?productNo=" + productNo;
				} 
			}
	    </script>
	</body>
</html>