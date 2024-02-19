<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 수정</title>
	</head>
	<body>
		<h1>공지사항 상세조회</h1>
		<form action="/notice/modify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
		<!--
			1. 파일 있으면 삭제할 수 있도록 함
			2. 첨부파일을 선택하지 않고 수정할 떄 null로 입력되는것을 방지할 수 있음
		-->
		<input type="hidden" name="noticeFilename" value="${notice.noticeFileName }">
		<input type="hidden" name="noticeFileRename" value="${notice.noticeFileRename }">
		<input type="hidden" name="noticeFilepath" value="${notice.noticeFilepath }">
		<input type="hidden" name="noticeFileSize" value="${notice.noticeFileSize }">
		
		<ul>
			<li>
				<label>제목</label>
				<input type="text" name="noticeName" value="${notice.noticeName }">
<%-- 				<span>${notice.noticeSubject }</span> --%>
			</li>
			<li>
				<label>작성자</label>
<%-- 				<input type="text" value="${notice.noticeWriter }"> --%>
				<span>${notice.noticeWriter }</span>
			</li>
			<li>
				<label>내용</label>
				<textarea rows="4" cols="50" name="noticeContent">${notice.noticeContent }</textarea>
<%-- 				<span>${notice.noticeContent }</span> --%>
			</li>
			<li>
				<label>첨부파일</label>
				<span><a href="../resources/nuploadFiles/${notice.noticeFileRename }" download>${notice.noticeFileName }</a></span>
				<input type="file" name="reloadFile">
			</li>
		</ul>
		<br>
		<br>
		<div>
			<input type="submit" value="수정하기">
			<button type="button" onclick="showNoticePage();">목록으로 이동</button>		
		</div>
		</form>
		<script>
			function showNoticePage() {
				lication.href = "/notice/list.do";
			}
		</script>
	</body>
</html>