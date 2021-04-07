<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_HEADER.jsp"%> 
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_MENU.jsp"%>
<div class="admin-right width89 p20">
	<div class="content">
		<div
			class="title-box center font14 line50 height50 weight700"
			style="width: 250px; border-radius: 2px; background-color: #eeeeee; border: 1px solid #ccc;">
			<span>일정 관리</span>
		</div>
		<div class="content-text">
			<div class="title m-t20 weight700">
				<h3>회사기본정보 > Company </h3>
			</div>
			<div class="" style="margin-top:10px; width: auto;height: 600px;">
				<form id="frm" method="post" action="${pageContext.request.contextPath}/company/grp_company">
					<table>
						<tr>
							<td class="bg-gray weight700 td-10 center">로고 타이틀</td>
							<td class="p-lr3"><input type="text" name="comName"
								id="comName" class="input-100" required Placeholder="DESIGN"/></td>
							<td class="bg-gray weight700 td-10 center">로고 서브타이틀</td>
							<td class="p-lr3"><input type="text" name="comSubName"
								id="comSubName" class="input-100" required Placeholder="서브타이틀" /></td>
						</tr>
						<tr>
							<td class="bg-gray weight700 td-10 center">대표명</td>
							<td class="p-lr3"><input type="text" name="comCeo"
								id="comCeo" class="input-100" required Placeholder="홍길동"/></td>
							<td class="bg-gray weight700 td-10 center">대표전화</td>
							<td class="p-lr3"><input type="text" name="comTel"
								id="comTel" class="input-100" required Placeholder="000-0000-0000"/></td>
						</tr>
						<tr>
							<td class="bg-gray weight700 td-10 center">회사 주소</td>
							<td class="p-lr3" colspan="7"><input type="text" name="comAddress"
								id="comUrl" class="input-100" required Placeholder="경남 김해시 분성로"/></td>
						</tr>
						<tr>
							<td class="bg-gray weight700 td-10 center">웹사이트 URL</td>
							<td class="p-lr3" colspan="7"><input type="text" name="comUrl"
								id="comUrl" class="input-100" required Placeholder="https://grp.portfolio.co.kr"/></td>
						</tr>
						<tr>
							<td class="bg-gray weight700 td-10 center">웹사이트 COPYRIGHT</td>
							<td class="p-lr3" colspan="7"><input type="text" name="comCopy"
								id="comCopy" class="input-100" required Placeholder="COPYRIGHT 2021.jun, All right reserved."/></td>
						</tr>
						
						<tr>
							<td class="bg-gray weight700 td-10 center">접근권한</td>
							<td class="p-lr3" colspan="7">
								<select name="comAuth" id="comAuth">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="11">11</option>
								</select>
							</td>
						</tr>
					</table>
					<div class="btn-grp center m-t5">
						<button type="submit" class="btn-on">내용저장</button>
						<button type="reset" class="btn-off">새로고침</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_FOOTER.jsp"%>
<script>
	$(function() {
		$('#startDate, #endDate').datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
</script>

</html>