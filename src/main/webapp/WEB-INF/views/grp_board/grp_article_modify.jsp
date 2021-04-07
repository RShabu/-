<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MAIN_HEADER.jsp"%>
<!-- 쓰기 권한 처리 -->
<c:if test = "${sessionScope.empNum == null || sessionScope.empAuth < boardWrite}">
<script>
	alert("게시물 작성 권한이 없습니다.\n관리자에게 문의하세요.");
	history.go(-1);
</script>
</c:if>
<!-- 쓰기 권한 처리 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<%@ include file="/WEB-INF/views/MAIN_ARTICLE_MENU.jsp"%>
	<div class="">
                <div class="bottom">
                    <div class="content p20">
                        <div class="content-text">
                            <div class="page-wrap">
                                <div class="container bg-white m-t10">
                                    <div class="title m-t20 weight700">
                                		<h3>게시글 작성</h3>
                            		</div>
                                    <div class="board-insert m-b40">
                                    <form id="frm" method="post" enctype="multipart/form-data" autocomplete="off">
										<input type="hidden" name="boardCode" value="${boardCode}" />
                                        <table>
                                            <tr>
                                                <td class="td-10 center weight700 noto  bg-gray"
                                                	style="background-color:${boardColor}">게시글 분류</td>
                                                <td class="td-40 p-lr3" colspan="3">
	                                                <select name="division" class="sel-135">
	                                                	<option value="Y"><c:if test="${ArticleModify.division eq 'Y'}"></c:if>공지게시글</option>
														<option value="N"><c:if test="${ArticleModify.division eq 'N'}"></c:if>일반게시글</option>
													</select>
												</td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td-10 center weight700 noto bg-gray" style="background-color:${boardColor}">게시글 제목</td>
                                                <td colspan="3" class="td-90 p-lr3">
                                                	<input value="${ArticleModify.subject }" type="text" name="subject" class="input-100" maxlength="50" required />
												</td>
                                            </tr>
                                            <tr>
                                                <td class="td-10 center weight700 noto bg-gray" style="background-color:${boardColor}">작성자</td>
                                                <td colspan="3" class="td-90 p-lr3">
                                                	<input value="${ArticleModify.writer}" type="text" name="writer" class="input-100" maxlength="5" value="${sessionScope.empName}" required/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td-10 center weight700 noto bg-gray" style="background-color:${boardColor}">게시글 내용</td>
                                                <td colspan="3" class="td-90 p-lr3" style="padding-top: 2px; padding-bottom: 2px;">
	                                                <textarea name="content" id="editor" style="width: 100%; height: 300px; border: 1px solid #ccc; padding: 10px; border-radius: 2px;" class="noto">${ArticleModify.content}</textarea>
	                                                <script>
														CKEDITOR.replace('editor');
														CKEDITOR.config.height = 300;
													</script>
												</td>
                                            </tr>
                                            <tr>
                                                <td class="td-10 center weight700 noto bg-gray" style="background-color:${boardColor}">첨부파일</td>
                                                <td colspan="3" class="td-90 p-lr3">
                                                	<input type="file" name="files" class="input-100" />
                                                </td>
                                            </tr>
                                            <c:if test="${ArticleModify.fileOriName != null}">
						                        <tr>
						                            <td colspan="3" class="td-90 p-lr3 weight700">
														<span class="kr">기존 파일 : <a href="/article/download?aid=${ArticleModify.aid}&boardCode=${boardCode}">${ArticleModify.fileOriName}</a></span>
						                            </td>
						                        </tr>
					                        </c:if>
                                        </table>
                                        <div class="btn-grp center m-t10">
											<button type="submit" class="btn-off">수정완료</button>
											<button type="button" onClick="location.href='${pageContext.request.contextPath}/article/grp_article_list?boardCode=${boardCode}&articleid=${article.articleid}'" class="btn-on">게시글목록</button>
										</div>
									</form>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
            </body>
<%@ include file="/WEB-INF/views/MAIN_FOOTER.jsp"%>