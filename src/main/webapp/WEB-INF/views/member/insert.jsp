<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>
    <h1>회원가입</h1>
    <form action="/member/insert.do" method="post">
        <div>
            <label for="memberId">아이디:</label>
            <input type="text" id="memberId" name="memberId" >
        </div>
        <div>
            <label for="memberPw">비밀번호:</label>
            <input type="password" id="memberPw" name="memberPw" >
        </div>
        <div>
            <label for="confirmMemberPw">비밀번호 확인:</label>
            <input type="password" id="confirmMemberPw" name="confirmMemberPw" >
        </div>
        <div>
            <label for="memberName">이름:</label>
            <input type="text" id="memberName" name="memberName" >
        </div>
        <div>
            <label for="memberAddress">주소:</label>
            <input type="text" id="memberAddress" name="memberAddress">
        </div>
        <div>
            <label for="memberEmail">이메일:</label>
            <input type="email" id="memberEmail" name="memberEmail" >
        </div>
        <div>
            <label for="memberPhone">휴대폰번호:</label>
            <input type="tel" id="memberPhone" name="memberPhone">
        </div>
        <div>
            <label for="memberDate">생년월일:</label>
            <input type="date" id="memberDate" name="memberDate">
        </div>
        <button type="submit">가입하기</button>
    </form>
</body>
</html>