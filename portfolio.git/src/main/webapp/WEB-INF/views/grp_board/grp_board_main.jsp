<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/grp_admin/ADMIN_HEADER.jsp"%>
<c:if test="${sessionScope.empAuth < 3}">
	<script>
	alert("접근 권한이 없습니다.\n관리자에게 문의하세요.");
	window.location.replace("${pageContext.request.contextPath}");
	</script>
</c:if>
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_MENU.jsp"%>
<div class="admin-right width89 p20">
    <div class="content">
		<div class="title-box center font14 line50 height50 weight700"
			style="width: 250px; border-radius: 2px; background-color: #eeeeee; border: 1px solid #ccc;">
			<span>게시판 관리</span>
		</div>
		<div class="content-text">
			<div class="title m-tb20 weight700">
				<h3>게시판관리 > 게시판 생성</h3>
			</div>
			<form class="width100 center font14 m-tb10" method="POST" action=""
				id="frm">
				<table>
					<tr class="center">
						<td class="color-b3 td-10" style="background-color: #eeeeee; border: 1px solid #ccc;">게시판그룹</td>
						<td class="td-15 p3"><select class="sel-100"
							name="boardGroup">
								<option value="100">관리부</option>
								<option value="200">기획부</option>
								<option value="300">인사부</option>
								<option value="400">영업부</option>
								<option value="500">생산부</option>
								<option value="600">비서실</option>
						</select></td>
						<td class="color-b3 td-10" style="background-color: #eeeeee; border: 1px solid #ccc;">게시판코드(영어)</td>
						<td class="td-15 p3"><input type="text" class="input-100" name="boardCode" id="boardCode" placeholder="영어로 입력" required
							class="input-0 width100 height50" /></td>
						<td class="color-b3 td-10" style="background-color: #eeeeee; border: 1px solid #ccc;">게시판색상</td>
						<td class="td-15 p3"><select class="sel-100" id="boardColor"
							name="boardColor">
								<option value="#6F809A">#6F809A</option>
								<option value="#dbbdff">#dbbdff</option>
								<option value="#e8eeff">#e8eeff</option>
								<option value="#FE5E71">#FE5E71</option>
								<option value="#91ffc6">#91ffc6</option>
						</select> <span class="color"></span></td>
						<td class="color-b3 td-10" style="background-color: #eeeeee; border: 1px solid #ccc;">게시판 관리자</td>
						<td class="td-15 p3"><input type="text" class="input-100" name="boardMaker" value="${sessionScope.empName}" readonly/></td>
					</tr>
					<tr class="center">
						<td class="color-b3 td-10" style="background-color: #eeeeee; border: 1px solid #ccc;">게시판제목</td>
						<td colspan="5" class="td-90 p3">
						<input type="text"
							class="input-100" name="boardTitle" id="boardTitle"
							required /></td>
						<td class="color-b3 td-10" style="background-color: #eeeeee; border: 1px solid #ccc;">게시판타입</td>
						<td class="td-15 p3"><select class="sel-100" name="boardType">
								<option value="1">일반게시판</option>
								<option value="2">공지사항</option>
						</select></td>
					</tr>
					<tr>
						<td class="color-b3 td-10" style="background-color: #eeeeee; border: 1px solid #ccc;">읽기권한</td>
						<td class="td-15 p3"><select class="sel-100" name="boardRead">
								<option value="2">임원</option>
								<option value="1">직원</option>
						</select></td>
						<td class="color-b3 td-10" style="background-color: #eeeeee; border: 1px solid #ccc;">쓰기권한</td>
						<td class="td-15 p3"><select class="sel-100"
							name="boardWrite">
								<option value="2">임원</option>
								<option value="1">직원</option>
						</select></td>
						<td class="color-b3 td-10" style="background-color: #eeeeee; border: 1px solid #ccc;">댓글권한</td>
						<td class="td-15 p3"><select class="sel-100"
							name="boardReply">
								<option value="2">임원</option>
								<option value="1">직원</option>
						</select></td>
						<td class="color-b3 td-10" style="background-color: #eeeeee; border: 1px solid #ccc;">다운권한</td>
						<td class="td-15 p3"><select class="sel-100"
							name="boardDownload">
								<option value="2">임원</option>
								<option value="1">직원</option>
						</select></td>
					</tr>
				</table>
				<div class="btn-grp center m-t10">
					<button class="btn-normal" type="button" id="btn">게시판생성</button>
					<button class="btn-cancel" type="reset">취소하기</button>
				</div>
			</form>
		</div>
		<div class="content-text">
			<div class="title m-tb20">
				<h3>게시판관리 > 게시판 목록</h3>
			</div>
			<div class="board-list width100 center font14">
				<table class="center height30">
					<tr class="weight700 height50 center" style="background-color: #eeeeee; border: 1px solid #ccc;">
						<td class="td-5"><input type="checkbox" onClick="chkAll();"
							id="chkAll" /></td>
						<td class="td-10">게시판그룹</td>
						<td class="td-10">게시판코드</td>
						<td class="td-10">게시판색상</td>
						<td class="td-15">게시판제목</td>
						<td class="td-10">읽기권한</td>
						<td class="td-10">쓰기권한</td>
						<td class="td-10">댓글권한</td>
						<td class="td-10">다운권한</td>
						<td class="td-10">게시판관리</td>
					</tr>
					<c:if test="${list == null}">
						<tr>
							<td colspan="14">등록된 사원 정보가 없습니다.</td>
					</c:if>
					<c:forEach var="board" items="${list}">
						<tr>
							<td><input type="checkbox" name="chk" class="chk"
								data-uid="${board.boardid}" data-code="${boardCode}" /></td>
							<td>${board.boardGroup}</td>
							<td><a href="${pageContext.request.contextPath}/article/grp_article_list?boardCode=${board.boardCode}"
								class="under">${board.boardCode}</a></td>
							<td>${board.boardColor}</td>
							<td><a href="${pageContext.request.contextPath}/article/grp_article_list?boardCode=${board.boardCode}"
								class="under">${board.boardTitle}</a></td>
							<td>${board.boardRead}</td>
							<td>${board.boardWrite}</td>
							<td>${board.boardReply}</td>
							<td>${board.boardDownload}</td>
							<td>
								<button class="btn-normal">수정</button>
								<button class="btn-cancel" id="boardDelete"
									onClick="boardDelete('${board.boardCode}');">삭제</button>
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
                                        <a href="${pageContext.request.contextPath}/board/grp_board_main?curPage=1&searchOpt=${searchOpt}&words=${words}">
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
                                       	<a href="${pageContext.request.contextPath}/board/grp_board_main?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"><i class="fas fa-angle-left"></i></a>
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
                                       <a href="${pageContext.request.contextPath}/board/grp_board_main?curPage=${num}&searchOpt=${searchOpt}&words=${words}">${num}</a>
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
                                        <a href="${pageContext.request.contextPath}/board/grp_board_main?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"><i class="fas fa-angle-right"></i></a>
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
                                      		<a href="${pageContext.request.contextPath}/board/grp_board_main?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"><i class="fas fa-angle-double-right"></i></a>
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
		<div class="content-box"></div>
	</div>
</div>
</body>
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_FOOTER.jsp"%>
<script>
$(function () {
    $("#boardColor").change(function() {
        $("#rowColor").css({
            backgroundColor : this.value
        });
    });
});
</script>
<script>
	function boardMake() {
		if ($.trim($("#boardCode").val()) == '') {
			alert("게시판 코드를 입력하세요.");
			$("#boardCode").focus();
			return false;
		}

		if ($.trim($("#boardTitle").val()) == '') {
			alert("게시판 제목을 입력하세요.");
			$("#boardTitle").focus();
			return false;
		}

		$
				.ajax({
					url : "${pageContext.request.contextPath}/board/grp_board_insert",
					type : "POST",
					data : $("#frm").serialize(),
					success : function(resData) {
						alert($("#boardTitle").val() + "게시판 & 댓글게시판이 생성되었습니다.");
						window.location.href = "${pageContext.request.contextPath}/board/grp_board_main";
					},
					error : function() {
						alert("시스템 에러");
					}
				});
	}

	$("#btn").click(function() {
		boardMake();
	});
</script>
<script>
	function boardDelete(boardCode) {
		var str = confirm("삭제 후 복구는 불가능합니다.\n선택하신 정보를 삭제하시겠습니까?");
		if (str) {
			alert(boardCode);
			$.ajax({
				url : "${pageContext.request.contextPath}/board/grp_board_delete",
				type : "POST",
				data : {
					boardCode : boardCode
				},
				success : function(resData) {
					alert("삭제되었습니다.");
					window.location.reload();
				},
				error : function() {
					alert("선택하신 정보가 없습니다.");
				}
			});
		}
	}
</script>

</html>