<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항</title>
	</head>
	<body>
		<h1>공지사항</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
					<th>첨부파일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${nList }" var="notice"  varStatus="i">
			<tr>
                        <td>${i.count }</td>
                        <td><a href="/notice/detail.do?noticeNo=${notice.noticeNo }"> ${notice.noticeName }</a></td>
                        <td>${notice.noticeWriter }</td>
                        <td>${notice.noticeDate }</td>
                        <c:if test="${notice.noticeFileName ne null }">
                            <td>O</td>
                        </c:if>
                        <c:if test="${notice.noticeFileName eq null }">
                            <td>X</td>
                        </c:if>
                    </tr>
			
			</c:forEach>
		</tbody>
		<tfoot>
			<tr align="center">
				<td colspan="5">
					<c:if test="${pInfo.startNavi ne'1' }">
					<a href="/notice/list.do?page=${pInfo.startNavi - 1 }">이전</a>
					</c:if>
					<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
						<a href="/notice/list.do?page=${p }">${p }</a>
					</c:forEach>
					<c:if test="${pInfo.startNavi ne pInfo.naviTotalCount }">
					<a href="/notice/list.do?page=${pInfo.currentPage + 1 }">다음</a>
					</c:if>
				</td>
			</tr>
		</tfoot>
		</table>
	</body>
</html>