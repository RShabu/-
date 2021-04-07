<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 쓰기 권한 처리 -->
<c:if test = "${sessionScope.empNum == null || sessionScope.empAuth < boardWrite}">
<script>
	alert("게시물 작성 권한이 없습니다.\n관리자에게 문의하세요.");
	history.go(-1);
</script>
</c:if>
<!-- 쓰기 권한 처리 -->
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
				<form method="POST" id="frm" enctype="multipart/form-data" autocomplete="off">
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
									<td class="td-13 p-lr3" style="color:#000;">${employee.empNum}</td>
									<td class="td-7 center bg-gray noto weight700">부서이름</td>
									<td class="td-13 p-lr3">
										<select name="empBuseoCode" class="sel-100">
                                           	<option value="100"><c:if test="${EmpModify.empBuseoCode eq '100'}"></c:if>관리부</option>
											<option value="200"><c:if test="${EmpModify.empBuseoCode eq '200'}"></c:if>기획부</option>
											<option value="300"><c:if test="${EmpModify.empBuseoCode eq '300'}"></c:if>인사부</option>
											<option value="400"><c:if test="${EmpModify.empBuseoCode eq '400'}"></c:if>영업부</option>
											<option value="500"><c:if test="${EmpModify.empBuseoCode eq '500'}"></c:if>생산부</option>
											<option value="600"><c:if test="${EmpModify.empBuseoCode eq '600'}"></c:if>비서실</option>
										</select>
									</td>
									<td class="td-7 center bg-gray noto weight700">직급</td>
									<td class="td-13 p-lr3">
										<select name="empGradeCode" class="sel-100">
                                           	<option value="6"><c:if test="${EmpModify.empGradeCode eq '6'}"></c:if>부장</option>
											<option value="7"><c:if test="${EmpModify.empGradeCode eq '7'}"></c:if>팀장</option>
											<option value="8"><c:if test="${EmpModify.empGradeCode eq '8'}"></c:if>과장</option>
											<option value="9"><c:if test="${EmpModify.empGradeCode eq '9'}"></c:if>대리</option>
											<option value="10"><c:if test="${EmpModify.empGradeCode eq '10'}"></c:if>사원</option>
										</select>
									</td>
									<td class="td-7 center bg-gray noto weight700">입사년월일</td>
									<td class="td-13 p-lr3">${employee.empEnter}</td>
									<td class="td-7 center bg-gray noto weight700">비밀번호</td>
									<td class="td-13 p-lr3">****</td>
								</tr>
								<tr>
									<td class="td-7 center bg-gray noto weight700">사원명</td>
									<td class="td-13 p-lr3">
										<input value="${EmpModify.empName }" type="text" name="empName" class="input-100" value="${sessionScope.empName}" required/>
									</td>
									<td class="td-7 center bg-gray noto weight700">가입년월</td>
									<td class="td-13 p-lr3">${employee.empRegdate}</td>
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
						<div class="m-t20" style="display:flex; justify-content: center;">
							<button type="submit" class="btn-off">수정완료</button>
							<button type="button" onClick="location.href='${pageContext.request.contextPath}/employee/grp_employee_view?empID=${employee.empID}'" class="btn-on">수정취소</button>
						</div>
						<input type="hidden" name="empNum" value="${sessionScope.empNum}" />		
					</form>
				</div>			
		</div>
		<div class="content-box"></div>
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
	$(function() {
		loadBuseo();
		loadGrade();
	});
</script>

</html>