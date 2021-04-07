<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${sessionScope.empNum == null}">
<script>
	alert("등록된 사용자가 아닙니다.\n관리자에게 문의하세요.");
	window.location.replace("${pageContext.request.contextPath}/grp_login");
	</script>
</c:if>

<c:if test="${sessionScope.empAuth < 2}">
<script>
	alert("접근 권한이 없습니다.\n관리자에게 문의하세요.");
	window.location.replace("${pageContext.request.contextPath}/grp_login");
	</script>
</c:if>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 메뉴얼</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/jquery.treeview.js"></script>
    <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
    <script src="https://kit.fontawesome.com/b0d47d0840.js" crossorigin="anonymous"></script>
</head>
<style>
    .form-icon {
        top: 50%;
        right: 28px;
    }
</style>

<body>
    <div class="admin">
        <header class="height50 line50" style="border-bottom: 1px solid #ccc; background-color: #1273c2;">
            <div class="nav p-lr20">
                <div class="mainMenu flex flex-justify center">
               		<h2 class="roboto"><a href="${pageContext.request.contextPath}/admin/grp_admin_main" style="text-decoration: none; color: #fff;">GROUPWARE
                            SYSTEM</a></h2>
	                <p class="p-lr10"  style="margin: 0px auto; width: 1200px;">
		                <span class="noto font14 weight700 flex" style="justify-content: flex-start; color:#fff;">
							${sessionScope.empBuseoName} ${sessionScope.empGradeName} ${sessionScope.empName}(${sessionScope.empNum}) 
							- 권한 : ${sessionScope.empAuth}
						</span>
		                <c:if test = "${sessionScope.empName != null}">
			                <div class="navbar flex flex-justify" style="position: relative;">
			               		
			               		<div class="subMenu flex flex-center">
		                            <li class="noto weight700 font18 m-lr10"><a href="${pageContext.request.contextPath}" style="color:#fff;"><i class="fas fa-home"></i></a></li>
		                            <li><a href="${pageContext.request.contextPath}/grp_login" id="logout" class="noto font14" style="color:#fff;">로그아웃</a></li>
		                        </div>
	                        </div>
	                	</c:if>
	                </p>
                </div>
            </div>
        </header>
        <div class="admin-main flex flex-justify height100">
            <div class="admin-left width11" style="border-right: 1px solid #ccc; background-color: rgb(121, 121, 121);">
                <form>
                    <div class="main-menu">
                        <dl>
                        	<dt>사내조직</dt>
                            <ul>
                                <li style=" border-bottom:1px solid #c8cacf;"><a href="${pageContext.request.contextPath}/employee/grp_employee_list">사원목록</a></li>
                                <li style=" border-bottom:1px solid #c8cacf;"><a href="${pageContext.request.contextPath}/employee/grp_employee_register">사원등록</a></li>
                                <li style="color:#fff; border-bottom:1px solid #c8cacf;"><a href="${pageContext.request.contextPath}/employee/grp_employee_chart">조직도</a></li>
                            </ul>
                            <dt>게시판관리</dt>
                            <ul>
                                <li style=" border-bottom:1px solid #c8cacf;"><a href="${pageContext.request.contextPath}/board/grp_board_main">게시판</a></li>
                            </ul>
                            <dt>전자결재</dt>
                            <ul>
                                <li style=" border-bottom:1px solid #c8cacf;"><a href="#">전자결재</a></li>
                            </ul>
                            <dt>일정관리</dt>
                            <ul>
                                <li style=" border-bottom:1px solid #c8cacf;"><a href="${pageContext.request.contextPath}/calendar/grp_calendar_main">일정관리</a></li>
                            </ul>
                            <dt>근태관리</dt>
                            <ul>
                                <li style=" border-bottom:1px solid #c8cacf;"><a href="#">내 근태현황</a></li>
                            </ul>
                            <dt>자료실</dt>
                            <ul>
                                <li style=" border-bottom:1px solid #c8cacf;"><a href="#">문서양식</a></li>
                                <li style=" border-bottom:1px solid #c8cacf;"><a href="#">제품소개서</a></li>
                            </ul>
                            <dt>회사기본정보</dt>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/company/grp_company_main">회사기본정보</a></li>
                            </ul>
                        </dl>
                    </div>
                </form>
            </div>