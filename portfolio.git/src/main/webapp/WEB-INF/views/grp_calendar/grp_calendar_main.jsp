<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- datepicker(달력모양 css) -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<!-- datepicker(달력모양 css) -->

<!-- calendar css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/calendar/core/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/calendar/daygrid/main.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<%@ include file="/WEB-INF/views/grp_employee/CHART_HEADER.jsp"%>

<div class="admin-right width89 p20" style="height:1600px; border-left: 1px solid #ccc;">
	<div class="content">
		<div
			class="title-box center font14 line50 height50 weight700"
			style="width: 250px; border-radius: 2px; background-color: #eeeeee; border: 1px solid #ccc;">
			<span>일정 관리</span>
		</div>
		<div class="content-text">
			<div class="title m-t20 weight700">
				<h3>일정관리 > Calendar</h3>
			</div>
			<div class="page-right bg-white">
				<div class="page-main-wrap">
					<div class="page-member-top flex flex-justify">
						<div class=""></div>
						<div class=""></div>
					</div>
					<div class="content-text">
						<div class="title">
							<h3 class="font18 noto m-t10">
								<i class="fas fa-feather-alt"></i> 일정관리 > 1. 일정등록
							</h3>
						</div>
						<div class="calendar-insert">
							<form>
								<table>
									<tr>
										<td class="td-10 noto under bg-gray weight700 center"><i class="fas fa-calendar-alt font16"></i> 시작일자 </td>
										<td class="p-lr3 right"><input type="text"
											autocomplete="off" id="startDate" name="startDate" class="input-100" /></td>
										<td class="td-10 noto under bg-gray weight700 center"><i class="fas fa-calendar-alt font16"></i> 종료일자 </td>
										<td class="p-lr3 right"><input type="text"
											autocomplete="off" id="endDate" name="endDate"class="input-100" /></td>
										<td class="td-10 noto under bg-gray weight700 center"><i class="far fa-calendar-check"></i> 일정내용</td>
										<td class="p-lr3"><input type="text" id="calContent" name="calContent" autocomplete="off"
											class="input-100" /></td>
									</tr>
								</table>
								<div class="btn-grp center m-t10">
									<button type="submit" class="btn-on">일정등록</button>
									<button type="reset" class="btn-off">등록취소</button>
								</div>
							</form>
						</div>
						<div class="title">
							<h3 class="font18 noto m-t10">
								<i class="fas fa-feather-alt"></i> 일정관리 > 2. 일정목록
							</h3>
						</div>
						<div class="page-member-bottom">
							<div class="page-content">
								<div id="calendar" class="calendar"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_FOOTER.jsp"%>
<!-- calendar js -->
<script src="${pageContext.request.contextPath}/calendar/core/main.js"></script>
<script src="${pageContext.request.contextPath}/calendar/core/locales/ko.js"></script>
<script src="${pageContext.request.contextPath}/calendar/interaction/main.js"></script>
<script src="${pageContext.request.contextPath}/calendar/daygrid/main.js"></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid' ],
			header : {
				left : 'prevYear,prev,next,nextYear today',
				center : 'title',
				right : 'dayGridMonth,dayGridWeek,dayGridDay'
			},
			navLinks : true,
			editable : true,
			eventLimit : true,
			locales : "ko",
			events : [ {
				title : '포트폴리오 제출은 금요일까지',
				start : '2020-09-16',
				end : '2020-09-19'
			}, {
				title : 'ui 구현 능력단위',
				start : '2020-09-22',
				end : '2020-10-01',
				color : '#f00'
			} ]
		});

		calendar.render();
	});
</script>
<!-- calendar js -->

<!-- calendar click event-->
<script>
	$(function() {
		$('#startDate, #endDate').datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
</script>

</html>