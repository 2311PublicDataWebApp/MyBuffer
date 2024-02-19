<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
</head>
<body>
    <h1>회원 정보 수정</h1>
    
    <form action="/member/withdrawmember.do" method="post">
        <button type="submit">회원 탈퇴</button>
    </form>
    
    
    <form action="/member/updatemember.do" method="post">
        <div>
            <label for="userId">아이디</label>
            <input type="text" id="userId" name="userId" >
        </div>
        <div>
            <label for="password">비밀번호</label>
            <input type="password" id="password" name=>
        </div>
        <div>
            <label for="confirmPassword">비밀번호 확인:</label>
            <input type="password" id="confirmPassword" >
        </div>
        <div>
            <label for="name">이름</label>
            <input type="text" id="name" name="name"  >
        </div>
        <div>
            <label for="address">주소</label>
            <input type="text" id="address" name="address" >
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="email" id="email" name="email" >
        </div>
        <div>
            <label for="phone">휴대폰번호</label>
            <input type="tel" id="phone" name="phone" >
        </div>
        <div>
            <label for="birthday">생년월일</label>
            <input type="date" id="birthday" name="birthday">
        </div>
        <button type="submit">다음</button>
    </form>
    
</body>
</html>