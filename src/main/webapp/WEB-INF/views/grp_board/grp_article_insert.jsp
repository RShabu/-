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
                                    <form id="frm" method="post" action="${pageContext.request.contextPath}/article/grp_article_insert" enctype="multipart/form-data" autocomplete="off">
										<input type="hidden" name="boardCode" value="${boardCode}" />
                                        <table>
                                            <tr>
                                                <td class="td-10 center weight700 noto  bg-gray"
                                                	style="">게시글 분류</td>
                                                <td class="td-40 p-lr3" colspan="3">
	                                                <select name="division" class="sel-135">
	                                                	<option value="Y">공지게시글</option>
														<option value="N">일반게시글</option>
													</select>
												</td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td-10 center weight700 noto  bg-gray">게시글 제목</td>
                                                <td colspan="3" class="td-90 p-lr3">
                                                	<input type="text" name="subject" class="input-100" maxlength="50" required />
												</td>
                                            </tr>
                                            <tr>
                                                <td class="td-10 center weight700 noto  bg-gray">작성자</td>
                                                <td colspan="3" class="td-90 p-lr3">
                                                	<input type="text" name="writer" class="" maxlength="5" value="${sessionScope.empName}" required/>
												</td>
                                            </tr>
                                            <tr>
                                                <td class="td-10 center weight700 noto  bg-gray">게시글 내용</td>
                                                <td colspan="3" class="td-90 p-lr3" style="padding-top: 2px; padding-bottom: 2px;">
	                                                <textarea name="content" id="editor" style="width: 100%; height: 300px; border: 1px solid #ccc; padding: 10px; border-radius: 2px;" class="noto"></textarea>
	                                                <script>
														CKEDITOR.replace('editor');
														CKEDITOR.config.height = 300;
													</script>
												</td>
                                            </tr>
                                            <tr>
                                                <td class="td-10 center weight700 noto  bg-gray">첨부파일</td>
                                                <td colspan="3" class="td-90 p-lr3">
                                                	<input type="file" name="files" class="input-100" />
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="btn-grp center m-t10">
											<button type="submit" class="btn-off">게시글작성</button>
											<button type="button" onClick="location.href='${pageContext.request.contextPath}/article/grp_article_list?boardCode=${boardCode}'" class="btn-on">게시글목록</button>
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