<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 메뉴얼</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/board.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%@ include file="/WEB-INF/views/grp_admin/ADMIN_MENU.jsp"%>
<div class="admin-right width100 p20">
	<div class="content">
		<div class="title-box center font14 line50 height50 weight700"
			style="width: 250px; border-radius: 2px; background-color: #eeeeee; border: 1px solid #ccc;">
			<span>사원 관리</span>
		</div>
		<div class="content-text">
			<div class="title m-tb20 flex flex-justify">
				<h3>사내조직/연락처 > 사원 등록</h3>
				<!-- <button class="s-btn-on"> 수정 </button> -->
			</div>
			<div class="page-content m-t10">
				<form method="POST" id="frm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/employee/grp_employee_register">
					<div class="member-top flex flex-justify">
						<div class="member-left">
							<div class="photo-area">
								<img src="${pageContext.request.contextPath}/images/admin/2.jpg" id="empPhoto"/>
							</div>
							<div class="member-img-btn center m-t10">
								<input type="file" name="file" id="empPhoto" />
							</div>
						</div>
						<div class="member-right width100 center font14">
							<table>
								<tr class="center"
                                        style="border: 1px solid #ccc;">
									<td class="td-7 center bg-gray noto weight700">사원번호</td>
									<td class="td-13 p-lr3" style="color:black;">${employee.empNum}</td>
									<td class="td-7 center bg-gray noto weight700">부서명</td>
									<td class="td-13 p-lr3">${empBuseoCode}</td>
									<td class="td-7 center bg-gray noto weight700">직책명</td>
									<td class="td-13 p-lr3">${empGradeName}</td>
									<td class="td-7 center bg-gray noto weight700">입사년월일</td>
									<td class="td-13 p-lr3">${empEnter}</td>
									<td class="td-7 center bg-gray noto weight700">비밀번호</td>
									<td class="td-13 p-lr3">${empPwd}</td>
								</tr>
								<tr>
									<td class="td-7 center bg-gray noto weight700">사원명/성별</td>
									<td class="td-13 p-lr3">${empName}</td>
									<td class="td-7 center bg-gray noto weight700">생년월일</td>
									<td class="td-13 p-lr3">${empRegdate}</td>
									<td class="td-7 color-b3 center bg-gray">C.P</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">Tel.</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">내선번호</td>
									<td class="td-13 p-lr3"></td>
								</tr>
								<tr>
									<td class="td-7 color-b3 center bg-gray">채용형태</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">희망직무</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">키/몸무게</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">병역구분</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">종교</td>
									<td class="td-13 p-lr3"></td>
								</tr>
								<tr>
									<td class="td-7 color-b3 center bg-gray">취미</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">특기</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">장애여부</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">보훈대상여부</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">결혼여부</td>
									<td class="td-13 p-lr3"></td>
								</tr>
								<tr>
									<td class="td-7 color-b3 center bg-gray">보유자격 1</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">보유자격 2</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">보유자격 3</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">보유자격 4</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">보유자격 5</td>
									<td class="td-13 p-lr3"></td>
								</tr>
								<tr>
									<td class="td-7 color-b3 center bg-gray">어학사항 1</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">어학사항 2</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">어학사항 3</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">어학사항 4</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">어학사항 5</td>
									<td class="td-13 p-lr3"></td>
								</tr>
								<tr>
									<td class="td-7 color-b3 center bg-gray">상벌사항 1</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">상벌사항 2</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">상벌사항 3</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">상벌사항 4</td>
									<td class="td-13 p-lr3"></td>
									<td class="td-7 color-b3 center bg-gray">상벌사항 5</td>
									<td class="td-13 p-lr3"></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="comment">
						<h3 class="tomato font14 noto m-t20 m-b5">추가사항</h3>
						<textarea class="noto" name="empComment" id="editor"
							style="width: 100%; height: 300px; border: 1px solid #ccc; padding: 10px; border-radius: 2px;" readonly></textarea>
						<script>
							CKEDITOR.replace('editor');
							CKEDITOR.config.height = 150;
						</script>
					</div>
					<div class="member-info m-t10">
						<div class="member-right center">
							<button type="submit" class="btn-on" id="btn">내용저장</button>
							<button type="reset" class="btn-off" id="">새로고침</button>
						</div>
					</div>
					<input type="hidden" name="empNum" value="${sessionScope.empNum}" />
				</form>
			</div>
		</div>
		<div class="content-box"></div>
	</div>
</div>
</body>

</html>