<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/b0d47d0840.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
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
        <div class="register-box">
            <form onSubmit="return checkPwd();" method="POST" action="${pageContext.request.contextPath}/employee/grp_register" autocomplete="off">
                <div class="mem font16 m-t10">
                    <div class="pos">
                        <select name="empBuseoCode" id="empBuseoCode" class="input" style="color:#000">
                        </select>
                        <select name="empGradeCode" id="empGradeCode" class="input m-t20" style="color:#000">
                        </select>
                    </div>
                    <div class=" m-t10">
                        <input type="date" id="empEnter" name="empEnter" class="input" tabindex="3" required
                            autocomplete="off" placeholder="입사년월" style="color:#000"/>
                    </div>
                    <div class="pos m-t5">
                        <input type="text" id="empName" name="empName" class="input" tabindex="4" required autocomplete="off" placeholder="사원명" maxlength='10'/>
                    </div>
                    <div class="pos m-t5">
                        <span class="form-icon"><i class="fas fa-unlock-alt"></i></span>
                        <input type="password" id="empPwd" name="empPwd" class="input" tabindex="5" required
                            autocomplete="off" placeholder="비밀번호" maxlength='20'/>
                    </div>
                    <div class="pos m-t5">
                        <span class="form-icon"><i class="fas fa-check"></i></span>
                        <input type="password" id="repasswd" name="repasswd" class="input" tabindex="6" required
                            autocomplete="off" placeholder="비밀번호 재확인" maxlength='20'/>
                    </div>
                </div>
                <div class="m-tb10 login-btn">
                    <button type="submit" id="btn" class="btn" required>
                        <a href="${pageContext.request.contextPath}/grp_login" class="black">가입</a>
                    </button>
                </div>
                <div class="register left">
                    <span class="account">
                        <a href="${pageContext.request.contextPath}/grp_login" style="color: #000;"><b>로그인</b></a>
                    </span>
                </div>
                <div class="Clearfix"></div>
            </form>
        </div>
    </div>
</body>
<script>
	function loadBuseo() {
		$.ajax({
			url		: "${pageContext.request.contextPath}/grp_buseo",
			type	: "POST",
			data	: "",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType: "json",
			success	: function(resData) {
				$.each(resData, function(key, value) {
					$("#empBuseoCode").append("<option value="+value.buseo_id+">"+value.buseo_name+"</option>");
				});
			},
			error	: function() {
				alert("시스템 에러");
			},
			complete: function() {}
		});
	}

	function loadGrade() {
		$.ajax({
			url		: "${pageContext.request.contextPath}/grp_grade",
			type	: "POST",
			data	: "",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType: "json",
			success	: function(resData) {
				$.each(resData, function(key, value) {
					$("#empGradeCode").append("<option value="+value.grade_id+">"+value.grade_name+"</option>");
				});
			},
			error	: function() {
				alert("시스템 에러");
			},
			complete: function() {}
		});
	}

	function checkPwd() {
		var a = $("#empPwd");
		var b = $("#repasswd");

		if( a.val().length > 15 || a.val().length < 10 ) {
			alert("비밀번호는 10자리 이상 15자리 이하로 입력하셔야 합니다.");
			a.val("");
			a.focus();
			return false;
		}

		if( b.val().length > 15 || b.val().length < 10 ) {
			alert("비밀번호 확인은 10자리 이상 15자리 이하로 입력하셔야 합니다.");
			b.val("");
			b.focus();
			return false;
		}

		if( a.val() != b.val() ) {
			alert("비밀번호가 다릅니다. 확인하세요.");
			a.val("");
			b.val("");
			a.focus();
			return false;
		}
	}

	$(function() {
		loadBuseo();
		loadGrade();
	});
</script>
</html>