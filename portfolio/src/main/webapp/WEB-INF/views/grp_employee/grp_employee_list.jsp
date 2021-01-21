<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_HEADER.jsp"%>
<style>
	tr:first-child {
		border: 1px solid #ccc;
		background-color: #eeeeee;
		border: 1px solid #ccc;
	}
</style>
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_MENU.jsp"%>
            <div class="admin-right width89 p20">
                <div class="content">
                    <div class="title-box center font14 line50 height50 weight700"
                        style="width: 250px; border-radius: 2px; background-color: #eeeeee; border: 1px solid #ccc;">
                        <span>사원 관리</span>
                    </div>
                    <div class="content-text">
                        <div style="width: auto; height: 600px;">
                            <div class="title m-tb20">
                                <h3>사원조직/연락처 > 1.사원목록</h3>
                            </div>
                            <div class="board-list width100 center font14">
                                <table class="center height30">
                                    <tr class="weight700 height50 center"
                                        style="background-color: #eeeeee; border: 1px solid #ccc;">
                                        <td class="td-5"><input type="checkbox" /></td>
                                        <td class="td-5">번호</td>
                                        <td class="td-5">부서코드</td>
                                        <td>직급코드</td>
                                        <td class="td-10">사원번호</td>
                                        <td class="td-5">사원명</td>
                                        <td class="td-5">부서명</td>
                                        <td class="td-5">직급명</td>
                                        <td class="td-5">호봉</td>
                                        <td class="td-10">입사년월</td>
                                        <td class="td-10">가입년월</td>
                                        <td class="td-5">승인여부</td>
                                        <td class="td-5">권한</td>
                                        <td class="td-5">부서장</td>
                                        <td class="td-10">비고</td>
                                    </tr>
                                    <c:forEach items="${list}" var="employee">
                                        <tr>
                                            <td><input type="checkbox" name="chk" class="chk"
                                                    data-uid="${employee.empID}" data-code="${boardCode}" /></td>
                                            <td>${employee.empID}</td>
                                            <td>${employee.empBuseoCode}</td>
                                            <td>${employee.empGradeCode}</td>
                                            <td><a href='${pageContext.request.contextPath}/employee/grp_employee_view?empID=${employee.empID}' target='-black'>${employee.empNum}</a></td>
                                            <td><a href="${pageContext.request.contextPath}/employee/grp_employee_view?empID=${employee.empID}" target='-black'>${employee.empName}</a></td>
                                            <td>${employee.empBuseoName}</td>
                                            <td>${employee.empGradeName}</td>
                                            <td>${employee.empStep}</td>
                                            <td>${employee.empEnter}</td>
                                            <td class="text-overflow: ellipsis;">${employee.empRegdate}</td>
                                            <td>
                                            	<select onChange="confirmChange(this.value, '${emp.empID}');" name="empConfirm"
                                                    id="empConfirm" style="width:75px;margin:0 2px;">
                                                    <option value="N" <c:if test="${emp.empConfirm eq 'N'}">selected
                                                        </c:if> >거부</option>
                                                    <option value="Y" <c:if test="${emp.empConfirm eq 'Y'}">selected
                                                        </c:if> >승인</option>
                                                </select></td>
                                            <td>
	                                            <select name="empAuth" id="empAuth" style="width:89%;height:32px;">
	                                        		<option value="4" <c:if test="${employees.empAuth eq '4'}">selected</c:if> >관리자</option>
	                                        		<option value="3" <c:if test="${employees.empAuth eq '3'}">selected</c:if> >부서장</option>
	                                        		<option value="2" <c:if test="${employees.empAuth eq '2'}">selected</c:if> >사원</option>
	                                        		<option value="1" <c:if test="${employees.empAuth eq '1'}">selected</c:if> >협력업체</option>
	                                        	</select>
                                        	</td>
                                            <td>
                                            	<input onClick="headChange(this.value, '${employees.empNum}');" value="${employees.empHead}" type="checkbox" class="headChk" <c:if test="${employees.empHead eq 'Y'}">checked</c:if> />
                                       		</td>
                                            <td>
                                            	<button class="s-btn-on">수정</button>
                                            	<button class="s-btn-off" onClick="checkDelete('${employees.empNum}')">삭제</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <!-- 페이징 ui 시작 -->
			                 	 <c:if test = "${count > 0}">
			                          <div class="page-grp center m-tb20">
			                        	 <c:choose>
			                                   	<c:when test = "${curPage > 1}">
													<span class="page">
				                                        <a href="${pageContext.request.contextPath}/employee/grp_employee_list?curPage=1&searchOpt=${searchOpt}&words=${words}">
				                                        <i class="fas fa-angle-double-left"></i>
				                                        </a>
				                                    </span>
				                                </c:when>
				                                <c:otherwise>
			                                    	<span class="page">
			                                    		<i class="fas fa-angle-double-left"></i>
			                                    	</span>
			                                   	</c:otherwise>
			                                   </c:choose>
			                                  
			                                   <c:choose>
			                                   	<c:when test = "${curPage > 1}">
			                                   		<span class="page">
			                                        	<a href="${pageContext.request.contextPath}/employee/grp_employee_list?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"><i class="fas fa-angle-left"></i></a>
			                                    	</span>
			                                   	</c:when>
			                                   	<c:otherwise>
			                                    	<span class="page">
			                                    		<i class="fas fa-angle-left"></i>
			                                    	</span>
			                                   	</c:otherwise>
			                                   </c:choose>
			                               <c:forEach begin="${blockBegin}" end = "${blockEnd}" var="num">
			                               	<c:if test="${selected != num}">
			                                    <span class="page">
			                                        <a href="${pageContext.request.contextPath}/employee/grp_employee_list?curPage=${num}&searchOpt=${searchOpt}&words=${words}">${num}</a>
			                                    </span>
			                                </c:if>
			                                
			                                <c:if test="${selected == num}">
			                                    <span class="page page-active">
			                                        <a href="" class="f6">${num}</a>
			                                    </span>
			                                </c:if>
			                               </c:forEach>
			                               <c:choose>
			                                   	<c:when test = "${curPage != totalPage }">
			                                   		<span class="page">
				                                        <a href="${pageContext.request.contextPath}/employee/grp_employee_list?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"><i class="fas fa-angle-right"></i></a>
				                                    </span>
				                                </c:when>
				                                <c:otherwise>
				                                	<span class="page">
			                                   			<i class="fas fa-angle-right"></i>
				                               		</span>
				                                </c:otherwise>
				                        </c:choose>
				                        <c:choose>
			                                   	<c:when test = "${curPage != totalPage }">
			                                   		<span class="page">
			                                       		<a href="${pageContext.request.contextPath}/employee/grp_employee_list?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"><i class="fas fa-angle-double-right"></i></a>
			                                   		</span>
				                                </c:when>
				                                <c:otherwise>
			                                   		<span class="page">
			                                   			<i class="fas fa-angle-double-right"></i>
				                               		</span>
				                                </c:otherwise>
				                        </c:choose>
	                             	 </div>
								</c:if>
                				<!-- 페이징 ui 끝 -->
                            </div>
                        </div>
                    </div>
                    <div class="content-box"></div>
                </div>
            </div>
        </div>
    </div>
</body>
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_FOOTER.jsp"%>
<script>
    var flag = false;

    function chkAll() {

        var chk = document.getElementsByName("chk");
        if (flag == false) { //선택 x
            flag = true;

            for (var i = 0; i < chk.length; i++) {
                chk[i].checked = true;
            }

        } else {
            flag = false;
            for (var i = 0; i < chk.length; i++) {
                chk[i].checked = false;
            }
        }

    }
/*
    function deleteOne(eid) {
        var msg = "선택하신 정보의 모든 내용이 삭제됩니다.\n삭제하시겠습니까?";
        if (confirm(msg)) { //확인창을 실행한다면...
            $.ajax({
                url: "${pageContext.request.contextPath}/employee/grp_employee_delete",
                type: "POST",
                data: {
                    eid: eid
                },
                success: function (resData) {
                    if (resData == "success") {
                        alert("선택하신 정보가 삭제되었습니다.");
                    }
                },
                error: function () {
                    alert("선택하신 정보를 삭제할 수 없습니다.");
                },
                complete: function () {
                    window.location.reload();
                }
            });
        }
    }

    function headChange(empHead, empID) {
        var msg = "선택하신 사원을 부서장으로 변경합니다.\n변경하시겠습니까?";
        if (confirm(msg)) {

            var headValue;
            if (empHead == 'Y') {
                headValue = 'N';

            } else {
                headValue = 'Y';
            }

            var formData = {
                empHead: headValue,
                empID: empID
            };

            $.ajax({
                url: "${pageContext.request.contextPath}/employee/grp_employee_head_change",
                type: "POST",
                data: formData,
                success: function (resData) {
                    if (resData == "success") {
                        alert("부서장 설정이 변경 되었습니다.");
                    }
                },
                error: function () {
                    alert("부서장 변경에 실패했습니다.");
                },
                complete: function () {
                    window.location.reload();
                }
            });
        }
    }


    function confirmChange(empConfirm, empID) {
        var msg = "선택하신 사원을 승인 변경하시겠습니까?";
        if (confirm(msg)) {

            var formData = {
                empConfirm: empConfirm,
                empID: empID
            };

            $.ajax({
                url: "${pageContext.request.contextPath}/employee/grp_employee_confirm_change",
                type: "POST",
                data: formData,
                success: function (resData) {
                    if (resData == "success") {
                        alert("사원 승인이 변경 되었습니다.");
                    }
                },
                error: function () {
                    alert("사원 승인 변경에 실패했습니다.");
                },
                complete: function () {
                    window.location.reload();
                }
            });
        }
    }*/
</script>
</html>