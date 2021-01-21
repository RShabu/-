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
	window.location.replace("${pageContext.request.contextPath}");
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/jquery.treeview.js"></script>
    <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
    <script src="https://kit.fontawesome.com/b0d47d0840.js" crossorigin="anonymous"></script>
</head>
