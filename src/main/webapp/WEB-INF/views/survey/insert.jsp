<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>설문</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
		<link rel="stylesheet" href="../../../resources/css/main.css">
	</head>

	<body>
		<div class="container">
			<header class="navbar navbar-expand-lg bd-navbar shadow-sm">
				<nav class="container" aria-label="Main navigation">
					<div class="d-flex" style="width: 4.25rem;"></div>
					<!-- <div class="d-flex justify-content-center">
						<a class="nav-link active" aria-current="page" href="#"><img style="height: 55px;" src="./images/logo.png" alt=""></a>
					</div>  -->
					<div class="d-flex">
						<ul class="nav">
							<li class="nav-item">
								<a class="nav-link active" aria-current="page" href="#"><img
										src="../../../resources/img/logo.png" style="height: 40px;" alt=""></a>
							</li>
						</ul>
					</div>
					<div class="d-flex btn-group">
						<button class="btn btn-body dropdown-toggle" type="button" data-bs-toggle="dropdown"
							aria-expanded="false" style="border-color: white;">
							<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="#818181"
								class="bi bi-person-circle" viewBox="0 0 16 16">
								<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
								<path fill-rule="evenodd"
									d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
							</svg>
						</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">로그인</a></li>
							<li><a class="dropdown-item" href="#">회원가입</a></li>
						</ul>
					</div>
				</nav>
			</header>
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
										<label class="form-label">성별은?</label>
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
										<label class="form-label">나이대는?</label>
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
											<input class="form-check-input" type="radio" name="surveyDrink" id="surveyDrink3" value="LIVER">
											<label class="form-check-label" for="surveyDrink3">
												주 3회
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio" name="surveyDrink" id="surveyDrink4" value="LIVER">
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
											<input class="form-check-input" type="radio" name="surveySleep" id="surveySleep2" value="CALMAG">
											<label class="form-check-label" for="surveySleep2">
												아니오
											</label>
										</div>
									</div>
									<div class="py-4 g-col-12">
										<label class="form-label">눈가가 떨린다.</label>
										<div class="form-check">
											<input class="form-check-input" type="radio" name="surveyEye" id="surveyEye1" value="CALMAG">
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
			<footer>
				<img src="../resources/img/footer.jpg" alt="No Image">
			</footer>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	</body>

	</html>