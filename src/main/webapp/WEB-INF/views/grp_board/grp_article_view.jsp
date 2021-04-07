<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MAIN_HEADER.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<%@ include file="/WEB-INF/views/MAIN_ARTICLE_MENU.jsp"%>
	<div class="">
        <div class="bottom">
            <div class="content p20">
                <div class="content-text">
                    <div class="page-wrap">
                        <div class="container bg-white m-t10">
                            <div class="title m-t20 weight700">
                                <h3>게시글</h3>
                            </div>
                            <div class="board-insert m-b40">
                                    <input type="hidden" name="boardCode" value="${boardCode}" />
                                    <table>
                                        <tr>
                                            <td class="td-10 center weight700 noto" style="background-color:${boardColor};">게시글 분류</td>
                                            <td class="td-40 p-lr3" colspan="3">
                                                <c:if test="${article.division eq 'Y'}">
                                                    <span class="noto weight700">공지사항</span>
                                                </c:if>
                                                <c:if test="${article.division eq 'N'}">
                                                    <span class="noto weight700">일반게시글</span>
                                                </c:if>
                                            </td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td-10 center weight700 noto" style="background-color:${boardColor};">게시글 제목</td>
                                            <td colspan="3" class="td-90 p-lr3">
                                                <strong>${article.subject}</strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td-10 center weight700 noto" style="background-color:${boardColor};">작성자</td>
                                            <td colspan="3" class="td-90 p-lr3 weight700">${article.writer}</td>
                                        </tr>
                                        <tr>
                                            <td class="td-10 center weight700 noto" style="height:300px; background-color:${boardColor};">게시글 내용</td>
                                            <td colspan="3" class="td-90 p-lr3"
                                                style="padding-top: 2px; padding-bottom: 2px;">
                                                <textarea style="resize: none;" name="content" id="editor" readonly>${article.content}</textarea>
                                                <script>
                                                    CKEDITOR.replace('editor');
                                                    CKEDITOR.config.height = 300;
                                                </script>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td-10 center weight700 noto" style="background-color:${boardColor};">첨부파일</td>
                                            <td colspan="3" class="td-90 p-lr3 weight700 under">
                                                <c:if test="${article.fileOriName eq ''}">
                                                    <span>첨부파일이 없습니다.</span>
                                                </c:if>
                                                <c:if test="${article.fileOriName ne ''}">
                                                    <!-- 파일 다운로드 권한 설정 -->
                                                    <c:choose>
                                                        <c:when test="${sessionScope.empAuth < boardDownload}">
                                                            <span>
                                                                <a href="#" id="msg_pop">${article.fileOriName}</a>
                                                            </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span>
                                                                <a href="${pageContext.request.contextPath}/article/grp_article_download?boardCode=${boardCode}&articleid=${article.articleid}">
                                                                    ${article.fileOriName}</a>
                                                            </span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:if>
                                                <!-- 파일 다운로드 권한 설정 -->
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="btn-grp center m-t10 flex flex-justify">
                                        <div class="btn-left">
                                            <button class="btn-red"
                                                onClick="location.href='${pageContext.request.contextPath}/article/grp_article_list?boardCode=${boardCode}&articleid=${article.articleid}'">게시글목록</button>
                                        </div>
                                        <div class="btn-right">
                                            <button class="btn-on"
                                                onClick="location.href='${pageContext.request.contextPath}/article/grp_article_reply?boardCode=${boardCode}&articleid=${article.articleid}'">게시글답글</button>
                                            <button class="btn-on"
                                                onClick="location.href='${pageContext.request.contextPath}/article/grp_article_insert?boardCode=${boardCode}'">게시글작성</button>
                                            <button class="btn-on"
                                                onClick="location.href='${pageContext.request.contextPath}/article/grp_article_modify?boardCode=${boardCode}&articleid=${article.articleid}'">게시글수정</button>
                                            <button class="btn-off"
                                                onClick="articleDelete('${boardCode}', ${article.articleid});">게시글삭제</button>
                                        </div>
                                    </div>
			                        <!-- 댓글 화면 구성 -->
				                    <hr style="margin: 30px 0; border: 1px solid #eee;" />
				                    <!-- 댓글 쓰기 화면 -->
				                    <div class="p-lr20" style="background-color: #fff;">
				                        <div id="commentList"></div>
				                        <hr style="margin: 30px 0; border: 1px solid #f7f7f7;" />
				                        <div style="margin-top: 20px;">
				                            <form id="frm">
				                                <!-- ajax로 자료 전체 전송하기(input -> name을 사용) 위한 id -->
				                                <input type="hidden" id="boardCode" name="boardCode" value="${boardCode}" /> 
				                                <input type="hidden" name="articleid" value="${article.articleid}" /> 
				                                <input type="hidden" name="who" value="${sessionScope.empName}" readonly />
				                                <div class="flex flex-justify">
					                                <textarea id="comment" name="comment" style="border: 1px solid #e7e7e7; width: 92%; height: 100px; resize: none;" 
					                                    placeholder="댓글 내용을 입력하세요." class="p10 noto font16"></textarea>
					                                <div class="" style="margin-left:10px; margin-top:5px;width:8%">
					                                    <!-- 비밀 댓글 & 댓글 저장 버튼-->
					                                    <div class="">
					                                        <input type="checkbox" name=""/> 비밀댓글
					                                    </div>
					                                    <div class="m-t5">
					                                        <button id="btn" style=" margin-top:10px; padding: 15px 10px; background-color: #4A57A8; color: #fff; border-radius: 3px;"
					                                            class="noto font16" type="button">댓글등록</button>
					                                    </div>
					                                </div>
				                                </div>
				                            </form>
				                        </div>
				                    </div>
			                    </div>
                  	 		</div>
                 	  </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
	function msg_pop() {
		alert("다운로드 권한이 없습니다.\n관리자에게 문의하세요.");
	}
	
	$(function() {
		$("#msg_pop").click(function(e) {
			alert("다운로드 권한이 없습니다.\n관리자에게 문의하세요.");
			e.preventDefault(); //a 태그의 기본(페이지이동 또는 새로고침) 속성 제거
		});
	});
	
	function checkComment() { //동작 기능만 -> 실행 x

		if ($("#comment").val() == '') {
			alert("댓글 내용을 입력하세요.");
			$("#comment").focus();
			return false; //return -> 프로그램이 끝날 때, 반환형이 있을 때
		}

		var formData = $("#frm").serialize(); //form 안의 name 값의 데이터를 전부 가져오기

		$.ajax({
			url : "${pageContext.request.contextPath}/comment/grp_comment_register",
			type : "POST",
			data : formData,
			success : function(resData) {
				alert("댓글이 등록 되었습니다.");
				listComment();
				$("#comment").val(''); //$("#comment").val(); - 값을 가지고 올 때
			},

			error : function() {
				alert("관리자에게 문의하세요.");
			},

			complete : function() {
			}
		});
	}

	function listComment() {
		var formData = $("#frm").serialize();

		$.ajax({
			url : "${pageContext.request.contextPath}/comment/grp_comment_list",
			type : "POST",
			data : formData, //내 게시판 코드, 게시물 번호가 필요
			success : function(resData) { //개수1, 내용 1줄

				//resData.list -> who(key), 관리자(value) 

				var a = '';
				$.each(
					resData.list,
					function(key, value) { //내용을 key, value로 분류
						a += '<div>';
						a += '<div class="flex" style="margin:10px 0;">';
						a += '<div style="width:6%">';
						a += '<span style="background-color:#fff; width:40px; height:40px; border-radius: 50%; display:inline-block; line-height: 40px; text-align:center; color:#000; border:1px solid #000;">';
						a += '<i class="far fa-user font18"></i>';
						a += '</span>';
						a += '</div>';
						a += '<div style="width:94%;">';
						a += '<div class="noto font16 weight700" style="color:#555;">';
						a += '<span>' + value.who + '</span>';
						a += '<span style="margin-left:20px;">';
						a += '<i class="far fa-calendar-alt"></i> ' + value.regdate + '</span>';
						a += '</div>';
						a += '<div id="" class="viewComment'+value.commentid+' noto font20" style="margin-top:5px;color:#666;">';
						a += '<p class="font14" style="width:100%; white-space: normal;">' + value.comment + '</p>';
						a += '</div>';
						a += '</div>';
						a += '</div>';
						a += '<div style="text-align: right;">';
						a += '<button class="s-btn-on" onClick="changeComment(' + value.commentid + ', \'' + value.comment + '\')">수정</button>';
						a += '<button class="s-btn-off" onClick="deleteComment(' + value.commentid + ')">삭제</button>';
						a += '</div>';
						a += '<hr style="margin:20px 0;border:1px solid #f7f7f7;" />';
						a += '</div>';
					});

				var b = '';
				b += '<span class="font16">댓글 : ' + resData.count + '</span>';

				$("#commentList").html(b + a); //위에서 작업한 변수 a 내용을 id commentList에 표시
			},

			error : function() {
				alert("관리자에게 문의하세요.");
			},

			complete : function() {
			}

		});
	}

	function deleteComment(commentid) {
		var msg = "선택하신 댓글 삭제하시겠습니까?";
		if (confirm(msg)) { //confirm y, n

			var formData = {
				commentid : commentid,
				boardCode : $("#boardCode").val()
			//input hidden 숨겨져 있는 boardCode 값
			}

			$.ajax({
				url : "${pageContext.request.contextPath}/comment/grp_comment_delete",
				type : "POST",
				data : formData,
				success : function(resData) {
					alert("댓글이 삭제되었습니다.");
					listComment();
				},
				error : function() {
					alert("관리자에게 문의하세요.");
				},
				complete : function() {
				}

			});
		}
	}

	function changeComment(commentid, comment) {
		var a = '';
		a += "<div>";
		a += '<textarea name="comment_' + commentid + '" class="noto p10 font20" style="border:1px solid #e7e7e7;width:100%;height:100px;">' + comment + '</textarea>';
		a += "</div>";

		a += "<div style='margin-top:5px;'>";
		a += "<button type='button' class='btn-red f6' style='padding:7px 10px;' onClick='modifyComment(" + commentid + ")'>변경</button>";
		a += "<button type='button' class='btn-cancel f6' style='padding:6px 8px; margin-left:5px;' onClick='listComment();'>취소</button>";
		a += "</div>";

		$(".viewComment" + commentid).html(a);
	}

	function modifyComment(commentid) {
		var comment = $('[name = comment_' + commentid + ']').val();

		var formData = {
			commentid : commentid,
			boardCode : $("#boardCode").val(),
			comment : comment
		}

		$.ajax({
			url : "${pageContext.request.contextPath}/comment/grp_comment_modify",
			type : "POST",
			data : formData,
			success : function(resData) {
				alert("댓글이 수정 되었습니다.");
				listComment();
			},
			error : function() {
				alert("관리자에게 문의하세요.");
			},
			complete : function() {
			}

		});
	}

	$("#btn").click(function() {
		checkComment();
	});

	$(function() { //화면 표시될 때 무조건 실행하는 jquery 
		listComment();
	});
</script>
<%@ include file="/WEB-INF/views/MAIN_FOOTER.jsp"%>