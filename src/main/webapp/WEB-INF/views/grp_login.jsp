<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/b0d47d0840.js" crossorigin="anonymous"></script>
</head>
<style>
    .background {
        width: 100%;
        height: 100vh;
        background-size: cover;
    }
</style>
<body>
    <div class="background" style="background-image: url(${pageContext.request.contextPath}/images/main/login.jpg);">
        <div style="text-align: right; padding: 20px;">
            <a href="${pageContext.request.contextPath}" style="color: #fff; font-size: 30px;"><i class="fas fa-home"></i></a>
        </div>
        <div style="color:#000;text-align:center;margin-bottom:5px; line-height:500px;">${msg}</div>
        <div class="login-box">
            <form method="POST" action="${pageContext.request.contextPath}/grp_login" autocomplete="off">
                <div class="pos">
                    <span class="form-icon">
                        <i class="far fa-id-card"></i>
                    </span>
                    <input type="text" name="empNum" id="empNum" class="input" autofocus tabindex="1" placeholder="사원번호"
                        required maxlength='20'/>
                </div>
                <div class="pos">
                    <span class="form-icon">
                        <i class="fas fa-unlock-alt"></i>
                    </span>
                    <input type="password" name="empPwd" id="empPwd" class="input" tabindex="2" placeholder="비밀번호" required  maxlength='20'/>
                </div>
                <div class="login-btn">
                    <button type="submit" class="btn" id="btn" name="btn"  tabindex="3">로그인</button>
                </div>
                <div class="register left">
                    <span class="account">
                        <a href="${pageContext.request.contextPath}/employee/grp_register" style="color: #000;"  tabindex="4"><b>사원가입</b></a>
                    </span>
                </div>
                <div>
                </div>
                <div class="Clearfix"></div>
            </form>
        </div>
    </div>
</body>
</html>