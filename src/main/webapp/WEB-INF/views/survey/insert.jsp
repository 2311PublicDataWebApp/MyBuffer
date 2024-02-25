<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>설문</title>
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
		<main class="my-5">
			<div class="row">
				<div class="mx-auto p-2" style="width: 470px;">
					<form action="/survey/insert.do" method="post">
						<fieldset>
							<legend>
								<h2>설문 중..</h2>
							</legend>
							<div class="grid gap-0 row-gap-3">
								<div class="py-4 g-col-12">
									<label class="form-label">성별</label>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyGender" id="surveyGender1" value="M">
										<label class="form-check-label" for="surveyGender1">
											남자
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyGender" id="surveyGender2" value="F">
										<label class="form-check-label" for="surveyGender2">
											여자
										</label>
									</div>
								</div>
								<div class="py-4 g-col-12">
									<label class="form-label">연령대</label>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyAge" id="surveyAge1" value="A">
										<label class="form-check-label" for="surveyAge1">
											10대 이하
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyAge" id="surveyAge2" value="B">
										<label class="form-check-label" for="surveyAge2">
											20대 ~ 40대
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyAge" id="surveyAge3" value="C">
										<label class="form-check-label" for="surveyAge3">
											50대 이상
										</label>
									</div>
								</div>
								<div class="py-4 g-col-12">
									<label class="form-label">일주일간 음주량</label>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyDrink" id="surveyDrink1" value="none">
										<label class="form-check-label" for="surveyDrink1">
											해당 없음
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyDrink" id="surveyDrink2" value="none">
										<label class="form-check-label" for="surveyDrink2">
											주 1회
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyDrink" id="surveyDrink3" value="MILKTHITLE">
										<label class="form-check-label" for="surveyDrink3">
											주 3회
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyDrink" id="surveyDrink4" value="MILKTHITLE">
										<label class="form-check-label" for="surveyDrink4">
											주 5회 이상
										</label>
									</div>
								</div>
								<div class="py-4 g-col-12">
									<label class="form-label">모니터를 많이 보는 업무를 한다.</label>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyMonitor" id="surveyMonitor1" value="LUTEIN">
										<label class="form-check-label" for="surveyMonitor1">
											예
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyMonitor" id="surveyMonitor2" value="none">
										<label class="form-check-label" for="surveyMonitor2">
											아니오
										</label>
									</div>
								</div>
								<div class="py-4 g-col-12">
									<label class="form-label">잠에 잘 든다.</label>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveySleep" id="surveySleep1" value="none">
										<label class="form-check-label" for="surveySleep1">
											예
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveySleep" id="surveySleep2" value="MAGNESIUM">
										<label class="form-check-label" for="surveySleep2">
											아니오
										</label>
									</div>
								</div>
								<div class="py-4 g-col-12">
									<label class="form-label">눈가가 떨린다.</label>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyEye" id="surveyEye1" value="MAGNESIUM">
										<label class="form-check-label" for="surveyEye1">
											예
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyEye" id="surveyEye2" value="none">
										<label class="form-check-label" for="surveyEye2">
											아니오
										</label>
									</div>
								</div>
								<div class="py-4 g-col-12">
									<label class="form-label">장 활동이 규칙적이다.</label>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyJang" id="surveyJang1" value="none">
										<label class="form-check-label" for="surveyJang1">
											예
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyJang" id="surveyJang2" value="LACTO">
										<label class="form-check-label" for="surveyJang2">
											아니오
										</label>
									</div>
								</div>
								<div class="py-4 g-col-12">
									<label class="form-label">피부가 건조하다.</label>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveySkin" id="surveySkin1" value="HYAL">
										<label class="form-check-label" for="surveySkin1">
											예
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveySkin" id="surveySkin2" value="none">
										<label class="form-check-label" for="surveySkin2">
											아니오
										</label>
									</div>
								</div>
								<div class="py-4 g-col-12">
									<label class="form-label">손톱이 약하거나 잘 부러진다.</label>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyNail" id="surveyNail1" value="BIOTIN">
										<label class="form-check-label" for="surveyNail1">
											예
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyNail" id="surveyNail2" value="none">
										<label class="form-check-label" for="surveyNail2">
											아니오
										</label>
									</div>
								</div>
								<div class="py-4 g-col-12">
									<label class="form-label">자주 피곤하고 무기력하거나 입이나 혀에 염증이 자주 생긴다.</label>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyImmunity" id="surveyImmunity1" value="VITAD">
										<label class="form-check-label" for="surveyImmunity1">
											예
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="surveyImmunity" id="surveyImmunity2" value="none">
										<label class="form-check-label" for="surveyImmunity2">
											아니오
										</label>
									</div>
								</div>
							</div>
							<div class="my-4 d-grid gap-5 d-md-flex justify-content-md-center">
								<button type="submit" class="btn btn-lg rounded-pill" style="width: 220px; height: 60px; background-color: #04D9C4; color: #ffffff;">제출하기</button>
							</div>
						</fieldset>
					</form>
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