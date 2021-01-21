<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MAIN_HEADER.jsp"%>

<%@ include file="/WEB-INF/views/MAIN_ARTICLE_MENU.jsp"%>
    <div class="content" style="margin: 20px auto; width: 1200px;">
        <div class="page-wrap" style="padding:20px 0;">
            <div class="container p10 bg-white" style="height:700px;">
                <div class="title">
                    <h3 class="font18 noto m-tb20">
                        ${boardTitle}
                    </h3>
                </div>
                <div class="search-wrap m-tb10 bg-white left">
                    <span class="font12">전체게시물 ${count}개 / ${totalPage}PAGE</span>
                </div>
                <div class="btn-grp flex flex-justify m-b2">
                    <div>
                        <button class="btn-red" style="width: 80px; height: 30px; line-height: 10px;"
                            id="articleDeleteAll">선택삭제</button>
                    </div>
                    <form method="POST" action="${pageContext.request.contextPath}/article/grp_article_list">
                        <input type="hidden" name="boardCode" value="${boardCode}" />
                        <select class="" name="searchOpt">
                            <option value="all">전체검색</option>
                            <option value="subject">게시물제목</option>
                            <option value="writer">작성자</option>
                        </select>
                        <input type="text" name="words" required
                            style="margin-left:-2px; border: 1px solid #ccc; height: 35px; border-radius: 2px;" autocomplete=”off”/>
                        <button type="submit" class="btn-off" style="margin-left:-2px" >게시글검색</button>

                    </form>
                </div>
                <div class="board-wrap bg-white m-t5" style="height:400px">
                    <table style="table-layout: fixed; ">
                        <tr class="weight700 center tr-color f6 font14"
                            style="border-bottom: 1px solid #000; border-top: 3px solid #000;">
                            <td class="td-3">
                                <input type="checkbox" onClick="chkAll();" id="chkAll" />
                            </td>
                            <td class="td-5">번호</td>
                            <td class="td-7">분류</td>
                            <td style="text-align:left; padding-left: 10px;">게시물제목</td>
                            <td class="td-7">작성자</td>
                            <td class="td-5">조회</td>
                            <td class="td-10">날짜</td>
                            <td class="td-7">관리</td>
                        </tr>
                        <c:forEach var="articleList" items="${list}" varStatus="status">
                            <tr class="center font14" style="border-bottom: 1px solid #ccc;">
                                <td>
                                    <input type="checkbox" name="chk" class="chk" data-uid="${articleList.articleid}"
                                        data-code="${boardCode}" />
                                </td>
                                <td>
                                    <c:if test="${articleList.division eq 'N'}">
                                        ${(count - status.index) - ((curPage - 1) * end)}
                                    </c:if>
                                    <c:if test="${articleList.division eq 'Y'}">
                                        -
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${articleList.division eq 'Y'}">
                                        <span class="notice">공지사항</span>
                                    </c:if>
                                    <c:if test="${articleList.division eq 'N'}">
                                        <span class="normal">일반</span>
                                    </c:if>
                                </td>
                                <td class="left p-lr10">
                                    <c:forEach begin="1" end="${articleList.re_level}">
                                        &nbsp;<img src="${pageContext.request.contextPath}/images/icon_reply.gif" />
                                    </c:forEach>
                                    <a href="${pageContext.request.contextPath}/article/grp_article_view?boardCode=${boardCode}&articleid=${articleList.articleid}"
                                        class="under weight700">${articleList.subject}</a>
                                    <span class="tomato">(${articleList.cnt})</span>
                                    <c:set var="fileName" value="${fn:toLowerCase(articleList.fileOriName)}" />
                                    <c:forTokens var="ext" items="${fileName}" delims="." varStatus="status">
                                        <c:if test="${status.last}">
                                            <c:choose>
                                                <c:when
                                                    test="${ext eq 'xls' || ext eq 'xlsx' || ext eq 'ppt' || ext eq 'pptx' || ext eq 'hwp' || ext eq 'pdf'}">
                                                    <i class="far fa-file-alt"></i>
                                                </c:when>

                                                <c:when test="${ext eq 'jpg' || ext eq 'png' || ext eq 'gif'}">
                                                    <i class="far fa-file-image"></i>
                                                </c:when>
                                            </c:choose>
                                        </c:if>
                                    </c:forTokens>
                                </td>
                                <td>${articleList.writer}</td>
                                <td>${articleList.hit}</td>
                                <td>${articleList.regdate}</td>
                                <td>
                                    <button type="button" class="s-btn-on"
                                        onClick="location.href='${pageContext.request.contextPath}/article/grp_article_modify?boardCode=${boardCode}&articleid=${articleList.articleid}'">수정</button>
                                    <button type="button" class="s-btn-off"
                                        onClick="articleDelete('${boardCode}', ${articleList.articleid});">삭제</button>
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
                <div>
            		<button type="button" class="btn-off m-tb30" style="float: right;"
                		onClick="location.href='${pageContext.request.contextPath}/article/grp_article_insert?boardCode=${boardCode}'">게시글작성</button>
                </div>
            </div>
        </div>

</body>
<%@ include file="/WEB-INF/views/MAIN_FOOTER.jsp"%>