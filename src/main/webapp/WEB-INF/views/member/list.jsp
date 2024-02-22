<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
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
    	<div class="container">
	        <main class="mx-auto">
	            <div class="row mt-5 mb-5"></div>
	            <div class="row justify-content-center">
	                <div class="col-md-10">
	                    <table class="table align-middle">
	                        <thead>
	                            <tr>
	                                <th scope="col" style="text-align: center;">아이디</th>
	                                <th scope="col" style="text-align: center;">이름</th>
	                                <th scope="col" style="text-align: center;">주소</th>
	                                <th scope="col" style="text-align: center;">이메일</th>
	                                <th scope="col" style="text-align: center;">휴대폰번호</th>
	                                <th scope="col" style="text-align: center;">생년월일</th>
	                                <th scope="col"></th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <c:forEach items="${mList }" var="member" varStatus="p">
	                                <tr>
	                                    <td class="" style="text-align: center;">${member.memberId }</td>
	                                    <td class="" style="text-align: center;">${member.memberName }</td>
	                                    <td class="ps-5" style="text-align: left;">${member.memberAddress }</td>
	                                    <td class="ps-3" style="text-align: left;">${member.memberEmail }</td>
	                                    <td class="" style="text-align: center;">${member.memberPhone }</td>
	                                    <td class="" style="text-align: center;">
	                                    	<fmt:parseDate value="${member.memberDate}" var="memberDate" pattern="yyyy-MM-dd" />
	                                        <fmt:formatDate value="${memberDate }" pattern="yyyy년 MM월 dd일" var="mDate"/>
	                                    	${mDate }
	                                    </td>
	                                    <td style="text-align: center;">
	                                        <div class="dropdown">
	                                            <button class="btn btn-body dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="border-color: white;">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots-vertical" viewBox="0 0 16 16">
														<path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0m0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0m0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0"/>
													</svg>
												</button>
	                                            <ul class="dropdown-menu">
	                                                <li>
	                                                    <a class="dropdown-item" type="button" href="/member/updatemember.do?memberId=${member.memberId }">회원 수정</a>
	                                                </li>
	                                                <li>
	                                                    <button class="dropdown-item" type="button" onclick="deleteMember('${member.memberId }');">회원 삭제</button>
	                                                </li>
	                                            </ul>
	                                        </div>
	                                    </td>
	                                </tr>
	                            </c:forEach>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	            <div class="row mt-5 mb-5">
	                <div class="col-md-12">
	                    <nav aria-label="Page navigation example">
	                        <ul class="pagination justify-content-center">
	                            <c:if test="${pInfo.startNavi != 1 }">
	                                <li class="page-item">
	                                    <a class="page-link rounded-circle" href="/member/list.do?page=${pInfo.startNavi - 1 }" aria-label="Previous">
	                                        <span aria-hidden="true">&laquo;</span>
	                                    </a>
	                                </li>
	                            </c:if>
	                            <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
	                                <li class="page-item">
	                                    <a class="page-link rounded-circle mx-2" href="/member/list.do?page=${p }" style="border: none; color: #313131;">
	                                        ${p }
	                                    </a>
	                                </li>
	                            </c:forEach>
	                            <c:if test="${pInfo.endNavi != pInfo.naviTotalCount }">
	                                <li class="page-item">
	                                    <a class="page-link rounded-circle" href="/member/list.do?page=${pInfo.endNavi + 1 }" aria-label="Next">
	                                        <span aria-hidden="true">&raquo;</span>
	                                    </a>
	                                </li>
	                            </c:if>
	                        </ul>
	                    </nav>
	                </div>
	            </div>
	            <div class="row mt-5 mb-5"></div>
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
		        function deleteMember(memberId) {
					if(confirm("해당 회원을 탈퇴시키겠습니까?")) {
						location.href = "/member/delete.do?memberId=" + memberId;
					} 
				}
	    </script>
    </body>
</html>