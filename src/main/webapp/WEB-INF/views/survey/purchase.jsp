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
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
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
            <main class="my-5 px-5 mx-5">
				<form action="/survey/complete.do" method="post">
					<div class="my-5">
	                    <h2 class="mb-4">배송지</h2>
	                    <input type="hidden" name="memberId" value="${member.memberId }">
	                    <div class="col-5">
							<div class="input-group my-3">
								<span class="input-group-text" id="basic-addon1">이름 </span>
								<input type="text" class="form-control" name="memberName" placeholder="이름" aria-label="Username" aria-describedby="basic-addon1" value="${member.memberName }">
							</div>
						</div>
						<div class="col-5">
							<div class="input-group my-3">
								<span class="input-group-text" id="basic-addon1">전화번호 </span>
								<input type="text" class="form-control" name="memberPhone" placeholder="전화번호" aria-label="Username" aria-describedby="basic-addon1" value="${member.memberPhone }">
							</div>
						</div>
						<div class="col-9">
							<div class="input-group">
								<input class="form-control" type="text" name="memberAddress" id="roadAddress" placeholder="도로명주소" value="${member.memberAddress }">
								<button class="btn btn-outline-secondary" type="button" onclick="findAddress()">우편번호 찾기</button>
							</div>
						</div>
	                </div>
					<div class="my-5">
						<div>
							<h2 class="mb-5">주문상품</h2>
							<input type="hidden" name="productNo" value="${product.productNo }">
							<input type="hidden" name="price" value="${product.price }">
						</div>
						<div class="row">
							<div class="col-4" style="text-align: center;">
								<img src="../resources/puploadFiles/${product.productFileRename }" alt="No Image" style="width: 170px;">
							</div>
							<div class="col-8">
								<div>
									<h4 class="mb-4">${product.productName }</h4>
								</div>
								<div class="row pt-5">
									<p class="col-4">주문금액</p>
									<p class="col-4">${product.price }원</p>
									<p class="col-4"></p>
								</div>
							</div>
						</div>
					</div>
					<div class="my-5">
						<h2 class="mb-3">구매방식</h2>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="howtoPay" id="howtoPay" value="무통장입금">
							<label class="form-check-label" for="howtoPay">
								무통장입금
							</label>
						</div>
					</div>
					<div class="my-5">
						<h2 class="mb-3">구매정보</h2>
							<fieldset class="border p-4">
							<div class="row g-3 align-items-center mb-4">
								<div class="col-2">
									<label class="col-sm-12 col-form-label" for="depoName">입금자명</label>
								</div>
								<div class="col-7">
									<input class="form-control" type="text" name="depoName" id="depoName">
								</div>
								<div class="col-3"></div>
							</div>
							<div class="row g-3 align-items-center mb-4">
								<div class="col-2">
									<label class="col-sm-12 col-form-label" for="acctNum">계좌번호</label>
								</div>
								<div class="col-7">
									<input class="form-control" type="text" name="acctNum" id="acctNum">
								</div>
								<div class="col-3"></div>
							</div>
							<div class="row g-3 align-items-center">
								<div class="col-2">
									<label class="col-sm-12 col-form-label" for="depoName">입금자명</label>
								</div>
								<div class="col-7">
									<select class="form-select" aria-label="Default select example" name="bankName">
										<option value="국민은행">국민은행</option>
										<option value="우리은행">우리은행</option>
										<option value="하나은행">하나은행</option>
										<option value="농협은행">농협은행</option>
										<option value="신한은행">신한은행</option>
										<option value="기업은행">기업은행</option>
									</select>
								</div>
								<div class="col-3"></div>
							</div>
						</fieldset>
					</div>
					<div class="my-4 d-grid gap-5 d-md-flex justify-content-md-center">
						<button type="submit" class="btn btn-lg rounded-pill" style="width: 220px; height: 60px; background-color: #04D9C4; color: #ffffff;">구매하기</button>
					</div>				
				</form>
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
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			function findAddress() {
				new daum.Postcode({
					oncomplete: function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById("roadAddress").value = roadAddr;
					}
				}).open();
			}
		</script>
    </body>
</html>