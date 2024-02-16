<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 상세</title>
	</head>
	<body>
	<h1>공지사항 상세조회</h1>
		<ul>
			<li>
				<label>제목</label>
				<span>${notice.noticeName }</span>
			</li>
			<li>
				<label>작성자</label>
				<span>${notice.noticeWriter }</span>
			</li>
			<li>
				<label>내용</label>
				<span>${notice.noticeContent }</span>
			</li>
			<li>
				<label>첨부파일</label>
				<span><a href="../resources/nuploadFiles/${notice.noticeFileRename }" download>${notice.noticeFileName }</a></span>
			</li>
		</ul>
		<br>
		<br>
		<div>
			<button type="button" onclick="showModifyPage();">수정하기</button>
			<button type="button" onclick="deleteNotice(${notice.noticeNo });">삭제하기</button>
			
			<button type="button" onclick="showNoticePage();">목록으로 이동</button>		
		</div>
		<script>
			function deleteNotice(noticeNo) {
				if(confirm("삭제하시겠습니까")) {
					location.href = "/notice/delete.do?noticeNo="+noticeNo;
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