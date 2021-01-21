<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_HEADER.jsp"%> 
<!-- datepicker(달력모양 css) -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!-- datepicker(달력모양 css) -->
<style>
.member-left {
	/* 사진 */
	width: 11%;
	max-width: 192px;
}

.photo-area {
	width: 100%;
}

.photo-area img {
	width: 100%;
	height: 100%;
	/*240px*/
	display: inline-block;
}

.member-right {
	width: 88.7%;
	max-width: 1728px;
}
</style>
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_MENU.jsp"%>
<body>
	<div class="admin-right width89 p20">
		<div class="content">
			<div class="title-box center font14 line50 height50 weight700"
                        style="width: 250px; border-radius: 2px; background-color: #eeeeee; border: 1px solid #ccc;">
				<span>사원 관리</span>
			</div>
			<div class="content-text">
				<div class="title m-tb20">
					<h3>사내조직/연락처 > 사원 등록</h3>
				</div>
				<div class="page-content m-t10">
					<form method="POST" id="frm"
						action="${pageContext.request.contextPath}/employee/grp_employee_register"
						enctype="multipart/form-data">
						<div class="member-top flex flex-justify">
							<div class="member-left">
								<div class="photo-area">
									<img
										src="${pageContext.request.contextPath}/images/admin/2.jpg" />
								</div>
								<div class="member-img-btn center m-t10">
									<input type="file" name="file" id="empPhoto" />
								</div>
							</div>
							<div class="member-right">
								<table>
									<tr class="tr-35">
										<td class="td-7 center bg-gray noto weight700">회사명</td>
										<td class="td-13 p-lr3"><input type="text"
											class="input-135" value="회사명" maxlength="20" style="width:175px;"/></td>
										<td class="td-7 center  bg-gray noto weight700">부서명</td>
										<td class="td-13 p-lr3">
											<select id="empBuseoCode" name="empBuseoCode" class="sel-135"style="width:175px;">
											</select>
										</td>
										<td class="td-7 center bg-gray noto weight700">직책명</td>
										<td class="td-13 p-lr3"><select id="empGradeCode"
											name="empGradeCode" class="sel-135"style="width:175px;">
										</select></td>
										<td class="td-7 center bg-gray noto weight700">입사년월일</td>
										<td class="td-13 p-lr3"><input type="text"
											name="empEnter" id="empEnter" autoComplete="off"
											class="input-135" readonly maxlength="10"
											onkeyup="auto_date_format(event, this)"
											onkeypress="auto_date_format(event, this)" style="width:175px;"/></td>
										<td class="td-7 center  bg-gray noto weight700">비밀번호</td>
										<td class="td-13 p-lr3"><input type="text" name="empPwd"
											id="empPwd" class="input-135" maxlength="20" style="width:175px;"/></td>
									</tr>
									<tr>
										<td class="td-7 center bg-gray noto weight700">사원명/성별</td>
										<td class="td-13 p-lr3"><input type="text" name="empName"
											id="empName" class="input-95 width75" /> <select
											name="empGender" class="sel-55" id="empGender">
												<option>남자</option>
												<option>여자</option>
										</select></td>
										<td class="td-7 center bg-gray noto weight700">생년월일</td>
										<td class="td-13 p-lr3"><input type="text"
											name="empBirth" id="empBirth" class="input-95 width75" autoComplete="off"/> <select
											name="" class="sel-55" id="">
												<option>양력</option>
												<option>음력</option>
										</select></td>
										<td class="td-7 color-b3 center bg-gray">C.P</td>
										<td class="td-13 p-lr3">
											<select name="empCP" class="sel-55" id="empCP">
													<option>010</option>
													<option>011</option>
											</select>
											<input type="text" class="input-95 width75" />
										</td>
										<td class="td-7 color-b3 center bg-gray">Tel.</td>
										<td class="td-13 p-lr3"><select name="empTel"
											class="sel-55" id="empTel">
												<option>02</option>
												<option>051</option>
										</select> <input type="text" class="input-95 width75" /></td>
										<td class="td-7 color-b3 center bg-gray">내선번호</td>
										<td class="td-13 p-lr3">
											<select name="empIn" class="sel-55" id="empIn">
													<option>02</option>
													<option>051</option>
											</select>
											<input type="text" class="input-95 width75" />
										</td>
									</tr>
									<tr>
										<td class="td-7 color-b3 center bg-gray">채용형태</td>
										<td class="td-13 p-lr3"><select name="empRecruit"
											class="sel-135" id="empRecruit"style="width:175px;">
												<option>공개채용</option>
												<option>특별채용</option>
												<option>수시채용</option>
										</select></td>
										<td class="td-7 color-b3 center bg-gray">희망직무</td>
										<td class="td-13 p-lr3"><input type="text" name="empHope"
											id="empHope" class="input-95" style="width: 175px;"/></td>
										<td class="td-7 color-b3 center bg-gray">키/몸무게</td>
										<td class="td-13 p-lr3"><input type="text"
											name="empHeight" id="empHeight" class="input-95"
											placeholder="cm" style="width: 65px;" /> <input type="text"
											name="empWeight" id="empWeight" class="input-95"
											placeholder="kg" style="width: 65px;" /></td>
										<td class="td-7 color-b3 center bg-gray">병역구분</td>
										<td class="td-13 p-lr3"><select name="empService"
											class="sel-135" id="empService"style="width:175px;">
												<option>병역필</option>
												<option>병역미필</option>
												<option>공익</option>
										</select></td>
										<td class="td-7 color-b3 center bg-gray">종교</td>
										<td class="td-13 p-lr3"><select name="empReligion"
											class="sel-135" id="empReligion"style="width:175px;">
												<option>무교</option>
												<option>불교</option>
												<option>기독교</option>
										</select></td>
									</tr>
									<tr>
										<td class="td-7 color-b3 center bg-gray">취미</td>
										<td class="td-13 p-lr3"><input type="text"
											name="empHobby" id="empHobby" class="input-100" style="width:175px;"/></td>
										<td class="td-7 color-b3 center bg-gray">특기</td>
										<td class="td-13 p-lr3"><input type="text"
											name="empSpeciality" id="empSpeciality" class="input-100" style="width:175px;"/></td>
										<td class="td-7 color-b3 center bg-gray">장애여부</td>
										<td class="td-13 p-lr3"><select name="empDisability"
											class="sel-135" id="empDisability"style="width:175px;">
												<option>비장애</option>
												<option>장애</option>
										</select></td>
										<td class="td-7 color-b3 center bg-gray">보훈대상여부</td>
										<td class="td-13 p-lr3"><select name="empReward"
											class="sel-135" id="empReward"style="width:175px;">
												<option>비대상</option>
												<option>대상</option>
										</select></td>
										<td class="td-7 color-b3 center bg-gray">결혼여부</td>
										<td class="td-13 p-lr3"><select name="empMarried"
											class="sel-135" id="empMarried"style="width:175px;">
												<option>미혼</option>
												<option>기혼</option>
										</select></td>
									</tr>
									<tr>
										<td class="td-7 color-b3 center bg-gray">보유자격 1</td>
										<td class="td-13 p-lr3"><input type="text"
											name="empLicense1" id="empLicense1" class="input-100" style="width:175px;"/></td>
										<td class="td-7 color-b3 center bg-gray">보유자격 2</td>
										<td class="td-13 p-lr3"><input type="text"
											name="empLicense2" id="empLicense2" class="input-100" style="width:175px;"/></td>
										<td class="td-7 color-b3 center bg-gray">보유자격 3</td>
										<td class="td-13 p-lr3"><input type="text"
											name="empLicense3" id="empLicense3" class="input-100" style="width:175px;"/></td>
										<td class="td-7 color-b3 center bg-gray">보유자격 4</td>
										<td class="td-13 p-lr3"><input type="text"
											name="empLicense4" id="empLicense4" class="input-100" style="width:175px;"/></td>
										<td class="td-7 color-b3 center bg-gray">보유자격 5</td>
										<td class="td-13 p-lr3"><input type="text"
											name="empLicense5" id="empLicense5" class="input-100" style="width:175px;"/></td>
									</tr>
									<tr>
										<td class="td-7 color-b3 center bg-gray">어학사항 1</td>
										<td class="td-13 p-lr3"><input type="text"
											name="empLang1" id="empLang1" class="input-75" autofocus style="width:175px;"/> <select
											name="" class="sel-55" id="">
												<option>상</option>
												<option>중</option>
												<option>하</option>
										</select></td>
										<td class="td-7 color-b3 center bg-gray">어학사항 2</td>
										<td class="td-13 p-lr3"><input type="text"
											name="empLang2" id="empLang2" class="input-75" autofocus style="width:175px;"/> <select
											name="" class="sel-55" id="">
												<option>상</option>
												<option>중</option>
												<option>하</option>
										</select></td>
										<td class="td-7 color-b3 center bg-gray">어학사항 3</td>
										<td class="td-13 p-lr3"><input type="text"
											name="empLang3" id="empLang3" class="input-75" autofocus style="width:175px;"/> <select
											name="" class="sel-55" id="">
												<option>상</option>
												<option>중</option>
												<option>하</option>
										</select></td>
										<td class="td-7 color-b3 center bg-gray">어학사항 4</td>
										<td class="td-13 p-lr3"><input type="text"
											name="empLang4" id="empLang4" class="input-75" autofocus style="width:175px;"/> <select
											name="" class="sel-55" id="">
												<option>상</option>
												<option>중</option>
												<option>하</option>
										</select></td>
										<td class="td-7 color-b3 center bg-gray">어학사항 5</td>
										<td class="td-13 p-lr3"><input type="text"
											name="empLang5" id="empLang5" class="input-75" autofocus style="width:175px;"/> <select
											name="" class="sel-55" id="">
												<option>상</option>
												<option>중</option>
												<option>하</option>
										</select></td>
									</tr>
									<tr>
										<td class="td-7 color-b3 center bg-gray">상벌사항 1</td>
										<td class="td-13 p-lr3"><input type="text" name="empRnp1"
											id="empRnp1" class="input-100" style="width:175px;"/></td>
										<td class="td-7 color-b3 center bg-gray">상벌사항 2</td>
										<td class="td-13 p-lr3"><input type="text" name="empRnp2"
											id="empRnp2" class="input-100" style="width:175px;"/></td>
										<td class="td-7 color-b3 center bg-gray">상벌사항 3</td>
										<td class="td-13 p-lr3"><input type="text" name="empRnp3"
											id="empRnp3" class="input-100" style="width:175px;"/></td>
										<td class="td-7 color-b3 center bg-gray">상벌사항 4</td>
										<td class="td-13 p-lr3"><input type="text" name="empRnp4"
											id="empRnp4" class="input-100" style="width:175px;"/></td>
										<td class="td-7 color-b3 center bg-gray">상벌사항 5</td>
										<td class="td-13 p-lr3"><input type="text" name="empRnp5"
											id="empRnp4" class="input-100" style="width:175px;"/></td>
									</tr>
								</table>
							</div>
						</div>
						<div class="comment">
							<h3 class="tomato font14 noto m-t20 m-b5">추가사항 입력</h3>
							<textarea class="noto" name="empComment" id="editor"
										style="width: 100%; height: 300px; border: 1px solid #ccc; padding: 10px; border-radius: 2px;"></textarea>
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
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_FOOTER.jsp"%>
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#empPhotoImg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$(function() {
		$("#empPhoto").change(function() {
			readURL(this);
		});
	});
	$(function(){
		$("#empEnter").datepicker({
			dateFormat : 'yy.mm.dd'
		});
	});
</script>
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

	/*function checkPwd() {
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
	}*/

	$(function() {
		loadBuseo();
		loadGrade();
	});
</script>
<script type="text/javascript">
 
    function auto_date_format( e, oThis ){
        
        var num_arr = [ 
            97, 98, 99, 100, 101, 102, 103, 104, 105, 96,
            48, 49, 50, 51, 52, 53, 54, 55, 56, 57
        ]
        
        var key_code = ( e.which ) ? e.which : e.keyCode;
        if( num_arr.indexOf( Number( key_code ) ) != -1 ){
        
            var len = oThis.value.length;
            if( len == 4 ) oThis.value += "-";
            if( len == 7 ) oThis.value += "-";
        
        }
        
    }
 
</script>
</html>