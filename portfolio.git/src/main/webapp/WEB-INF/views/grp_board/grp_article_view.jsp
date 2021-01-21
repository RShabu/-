<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MAIN_HEADER.jsp"%>
<!-- 읽기 권한 처리 -->
<c:if
	test="${sessionScope.empNum == null || sessionScope.empAuth < boardRead}">
	<!-- 권한이 2보다 작음(직원x) -->
	<script>
		alert("게시물 읽기 권한이 없습니다.\n관리자에게 문의하세요.");
		history.go(-1);
	</script>
</c:if>
<!-- 읽기 권한 처리 -->
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
                                            <td class="td-10 center weight700 noto  bg-gray" style="">게시글 분류</td>
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
                                            <td class="td-10 center weight700 noto  bg-gray">게시글 제목</td>
                                            <td colspan="3" class="td-90 p-lr3">
                                                <strong>${article.subject}</strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td-10 center weight700 noto  bg-gray">작성자</td>
                                            <td colspan="3" class="td-90 p-lr3 weight700">${article.writer}</td>
                                        </tr>
                                        <tr>
                                            <td class="td-10 center weight700 noto  bg-gray" style="height:300px">게시글 내용</td>
                                            <td colspan="3" class="td-90 p-lr3"
                                                style="padding-top: 2px; padding-bottom: 2px;">
                                                <textarea name="content" id="editor" readonly >${article.content}</textarea>
                                                <script>
                                                    CKEDITOR.replace('editor');
                                                    CKEDITOR.config.height = 300;
                                                </script>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td-10 center weight700 noto  bg-gray">첨부파일</td>
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
                                                onClick="articleDelete('${boardCode}', ${articleList.articleid});">게시글삭제</button>
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
				                                <input type="hidden" id="boardCode" name="boardCode" value="${boardCode}" /> <input
				                                    type="hidden" name="articleid" value="${article.articleid}" /> <input type="hidden" name="who"
				                                    value="${sessionScope.empName}" readonly />
				                                <textarea id="comment" name="comment"
				                                    style="border: 1px solid #e7e7e7; width: 100%; height: 100px;"
				                                    placeholder="댓글 내용을 입력하세요." class="p10 noto font16"></textarea>
				                                <div class="flex flex-justify p10">
				                                    <!-- 비밀 댓글 & 댓글 저장 버튼-->
				                                    <div class="">
				                                        <input type="checkbox" name="" /> 비밀댓글
				                                    </div>
				                                    <div class="">
				                                        <button id="btn"
				                                            style="padding: 20px 25px; background-color: #3f51b5; color: #fff; border-radius: 3px;"
				                                            class="noto font20 weight700" type="button">댓글등록</button>
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
<%@ include file="/WEB-INF/views/MAIN_FOOTER.jsp"%>