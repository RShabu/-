<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_HEADER.jsp"%>
<style>

	tr:first-child {
		border: 1px solid #ccc;
		background-color: #eeeeee;
		border: 1px solid #ccc;
	}
	
	.btn-seldel {
	    display: inline-block;
	    padding: 5px 8px;
	    background-color: #ccc;
	    border-radius: 2px;
	    color: #fff;
	    font-weight: 700;
	    cursor: pointer;
	}
	
	.btn-seldel:hover {
		background-color: #d92550;
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
                            <div>
								<button class="btn-seldel m-b10" id="deleteAll">선택 삭제</button>
							</div>
                            <div class="board-list width100 center font14">
                                <table class="center height30">
                                    <tr class="weight700 height50 center"
                                        style="background-color: #eeeeee; border: 1px solid #ccc;">
                                        <td class="td-5"><input type="checkbox" onClick="chkAll();" name="chkAll"/></td>
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
                                            <td><a href='${pageContext.request.contextPath}/employee/grp_employee_view?empID=${employee.empID}' target='-black'>${employee.empName}</a></td>
                                            <td>${employee.empBuseoName}</td>
                                            <td>${employee.empGradeName}</td>
                                            <td>${employee.empStep}</td>
                                            <td>${employee.empEnter}</td>
                                            <td class="text-overflow: ellipsis;">${employee.empRegdate}</td>
                                            <td>
                                            	<select onChange="confirmChange(this.value, '${employee.empNum}');" name="empConfirm" id="empConfirm"  style="width:75px;margin:0 2px;">
                                                    <option value="N" <c:if test="${employee.empConfirm eq 'N'}">selected</c:if> >거부</option>
                                                    <option value="Y" <c:if test="${employee.empConfirm eq 'Y'}">selected</c:if> >승인</option>
                                                </select></td>
                                            <td>
	                                            <select onChange="authChange(this.value, '${employee.empNum}');" name="empAuth" id="empAuth" style="width:89%;height:32px;">
	                                        		<option value="3" <c:if test="${employee.empAuth eq '3'}">selected</c:if> >부서장</option>
	                                        		<option value="2" <c:if test="${employee.empAuth eq '2'}">selected</c:if> >사원</option>
	                                        		<option value="1" <c:if test="${employee.empAuth eq '1'}">selected</c:if> >협력업체</option>
	                                        	</select>
                                        	</td>
                                            <td>
                                            	<input onClick="headChange(this.value, '${employee.empNum}');" value="${employee.empHead}" type="checkbox" class="headChk" <c:if test="${employee.empHead eq 'Y'}">checked</c:if> />
                                       		</td>
                                            <td>
                                            	<button class="s-btn-off" onClick="checkDelete('${employee.empNum}')">삭제</button>
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

    function headChange(head, empNum) {
        var msg = "선택하신 사원의 부서장 직책을 변경합니다.\n변경하시겠습니까?";
        if (confirm(msg)) {

            var headType;
            
            if (head == 'Y') {
            	headType = 'N';
            } else {
            	headType = 'Y';
            }

            var formData = {
            	headType	: headType,
                empNum		: empNum
            };

            $.ajax({
                url: "${pageContext.request.contextPath}/employee/grp_employee_head_change",
                type: "POST",
                data: formData,
                success: function (resData) {
                    if (resData == "success") {
                        alert("부서장 설정이 변경 되었습니다.");
                        window.location.reload();
                    }
                },
                error: function () {
                    alert("부서장 변경에 실패했습니다.");
                },

            });
        }else{
			window.location.reload();
		}
    }

    function confirmChange(confirmType, empNum) {
        var msg = "선택하신 사원의 승인여부를 변경합니다.\n변경하시겠습니까?";
        if (confirm(msg)) {
     
            var formData = {
            	confirmType	: confirmType,
                empNum		: empNum
            };
			//alert(confirmType);
            $.ajax({
                url: "${pageContext.request.contextPath}/employee/grp_employee_confirm_change",
                type: "POST",
                data: formData,
                success: function (resData) {
                    if (resData == "success") {
                        alert("승인여부가 변경 되었습니다.");
                        window.location.reload();
                    }
                },
                error: function () {
                    alert("승인여부 변경에 실패했습니다.");
                },

            });
        }else{
			window.location.reload();
		}
    }

    function authChange(auth, empNum) {
        var msg = "선택하신 사원의 권한을 변경하시겠습니까?";
        if (confirm(msg)) {

            var formData = {
            	auth	: auth,
                empNum: empNum
            };

            $.ajax({
                url: "${pageContext.request.contextPath}/employee/grp_employee_auth_change",
                type: "POST",
                data: formData,
                success: function (resData) {
                    if (resData == "success") {
                        alert("사원 권한이 변경 되었습니다.");
                    }
                },
                error: function () {
                    alert("사원 권한 변경에 실패했습니다.");
                },
                complete: function () {
                    window.location.reload();
                }
            });
        }
    }
</script>
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

	function checkDelete(empNum) {
		
		var str = confirm("선택하신 정보의 모든 내용이 삭제됩니다.\n그래도 선택하신 삭제하시겠습니까?");
		if( str ) {
			
			$.ajax({
		    	url 	: "${pageContext.request.contextPath}/employee/grp_employee_delete",
		    	type 	: "POST", 	
		    	data 	: {empNum : empNum},
		    	success	: function (resData) {
		    		alert("삭제되었습니다.");
		    		window.location.reload();
		        },
		        error 	: function() {
		        	alert("취소 되었습니다.");
		        }
		    });
			
		}
	}

	$("#deleteAll").click(function() {
	    var str = confirm("선택하신 정보를 삭제하시겠습니까?");
	    
	    if( str ) {
	        var chkArr = new Array();
	        $(".chk:checked").each(function () {
	        	chkArr.push($(this).attr("data-uid"));
	        });
   
	        $.ajax({
	        	url 	: "${pageContext.request.contextPath}/employee/grp_employee_delete_all",
	        	type 	: "POST", 	
	        	data 	: { chkArr : chkArr },
	        	success	: function (resData) {
	        		alert("삭제되었습니다.");
		    		window.location.reload();
	            },
	            error 	: function() {
	            	alert("선택하신 회원정보가 없습니다.");
	            }
	        });
	    }
	});
</script>
</html>