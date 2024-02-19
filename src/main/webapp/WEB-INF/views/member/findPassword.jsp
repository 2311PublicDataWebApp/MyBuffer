<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
</head>
<body>
    <h1>비밀번호 찾기</h1>
    <form action="/member/findpassword.do" method="post">
        <div>
            <label for="userId">아이디</label>
            <input type="text" id="userId" name="userId" value="아이디를 입력하세요">
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="email" id="email" name="email" value="이메일을 입력하세요">
        </div>
        
    <button type="submit">다음</button>
        <br><br>   
        <a href="/member/findid.do" >아이디 찾기</a>
        <a href="/member/findpassword.do" >비밀번호 찾기</a>
        <a href="/member/insert.do" >회원가입</a>
    </form>
</body>
</html>