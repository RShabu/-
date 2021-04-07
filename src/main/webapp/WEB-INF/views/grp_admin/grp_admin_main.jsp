<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_HEADER.jsp"%>
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_MENU.jsp"%>
            <div class="admin-right width89 p20">
                <div class="flex flex-justify">
                    <div class="p10" style="width: 40%; height: 300px;  border: 1px solid #ccc;">
                        <div class="title">
                        	<a href="${pageContext.request.contextPath}/article/grp_article_list?boardCode=NOTICE">
                            <h2 class="noto font16 m-b10" style="color:#000; text-decoration:none;">
                            공지사항 알림글</h2></a>
                        </div>
                        <div class="notice-wrap p-lr10">
                        <table>
                            <div class="notice-content flex flex-justify p-tb10" style="border-bottom: 1px solid #e7e7e7;">
                                <div class="notice-content-left">
                                    <div class="notice-content">
                                        <p class="subject noto weight700 font14">
                                            <span style="color: #d92550; margin-right: 10px;">${article.division }</span> 운영자
                                            확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                        </p>
                                    </div>
                                </div>
                                <div class="notice-content-right" style="width: 50px;">
                                    <span class="noto font14" style="color: #555">09-14</span>
                                </div>
                            </div>
                            <div class="notice-content flex flex-justify p-tb10" style="border-bottom: 1px solid #e7e7e7;">
                                <div class="notice-content-left">
                                    <div class="notice-content">
                                        <p class="subject noto weight700 font14">
                                            <span style="color: #d92550; margin-right: 10px;">[공지]</span> 운영자
                                            확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                        </p>
                                    </div>
                                </div>
                                <div class="notice-content-right" style="width: 50px;">
                                    <span class="noto font14" style="color: #555">09-14</span>
                                </div>
                            </div>
                            <div class="notice-content flex flex-justify p-tb10" style="border-bottom: 1px solid #e7e7e7;">
                                <div class="notice-content-left">
                                    <div class="notice-content">
                                        <p class="subject noto weight700 font14">
                                            <span style="color: #d92550; margin-right: 10px;">[공지]</span> 운영자
                                            확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                        </p>
                                    </div>
                                </div>
                                <div class="notice-content-right" style="width: 50px;">
                                    <span class="noto font14" style="color: #555">09-14</span>
                                </div>
                            </div>
                            <div class="notice-content flex flex-justify p-tb10" style="border-bottom: 1px solid #e7e7e7;">
                                <div class="notice-content-left">
                                    <div class="notice-content">
                                        <p class="subject noto weight700 font14">
                                            <span style="color: #d92550; margin-right: 10px;">[공지]</span> 운영자
                                            확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                        </p>
                                    </div>
                                </div>
                                <div class="notice-content-right" style="width: 50px;">
                                    <span class="noto font14" style="color: #555">09-14</span>
                                </div>
                            </div>
                            <c:forEach var="article" items="${list}" varStatus="status">
                            <tr class="center font14" style="border-bottom: 1px solid #ccc;">
                                <td>
                                    <c:if test="${article.division eq 'Y'}">
                                        <span class="notice">공지사항</span>
                                    </c:if>
                                    <c:if test="${article.division eq 'N'}">
                                        <span class="normal">일반</span>
                                    </c:if>
                                </td>
                                <td class="left p-lr10">
                                    <c:forEach begin="1" end="${article.re_level}">
                                        &nbsp;<img src="${pageContext.request.contextPath}/images/icon_reply.gif" />
                                    </c:forEach>
                                    <a href="${pageContext.request.contextPath}/article/grp_article_view?boardCode=${boardCode}&articleid=${article.articleid}"
                                        class="under weight700" target="_blank">${article.subject}</a>
                                </td>
                                <td>${article.regdate}</td>
                            </tr>
                        </c:forEach>
                        </table>
                        </div>
                    </div>
                    <div class="공지 p10" style="width: 59%; height: 300px;  border: 1px solid #ccc;">
                        <div class="title">
                            <h2 class="noto font16 m-b10">부서 게시판</h2>
                        </div>
                        <div class="notice-wrap p-lr10">
                            <div class="notice-content flex flex-justify p-tb10"
                                style="border-bottom: 1px solid #e7e7e7;">
                                <div class="notice-content-left">
                                    <div class="notice-content">
                                        <p class="subject noto weight700 font14">
                                            <span style="margin-right: 10px;">[일반]</span> 운영자
                                            확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                        </p>
                                    </div>
                                </div>
                                <div class="notice-content-right" style="width: 50px;">
                                    <span class="noto" style="color: #555">09-14</span>
                                </div>
                            </div>
                            <div class="notice-content flex flex-justify p-tb10"
                                style="border-bottom: 1px solid #e7e7e7;">
                                <div class="notice-content-left">
                                    <div class="notice-content">
                                        <p class="subject noto weight700 font14">
                                            <span style="margin-right: 10px;">[일반]</span> 운영자
                                            확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                        </p>
                                    </div>
                                </div>
                                <div class="notice-content-right" style="width: 50px;">
                                    <span class="noto" style="color: #555">09-14</span>
                                </div>
                            </div>
                            <div class="notice-content flex flex-justify p-tb10"
                                style="border-bottom: 1px solid #e7e7e7;">
                                <div class="notice-content-left">
                                    <div class="notice-content">
                                        <p class="subject noto weight700 font14">
                                            <span style="margin-right: 10px;">[일반]</span> 운영자
                                            확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                        </p>
                                    </div>
                                </div>
                                <div class="notice-content-right" style="width: 50px;">
                                    <span class="noto" style="color: #555">09-14</span>
                                </div>
                            </div>
                            <div class="notice-content flex flex-justify p-tb10"
                                style="border-bottom: 1px solid #e7e7e7;">
                                <div class="notice-content-left">
                                    <div class="notice-content">
                                        <p class="subject noto weight700 font14">
                                            <span style="margin-right: 10px;">[일반]</span> 운영자
                                            확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                        </p>
                                    </div>
                                </div>
                                <div class="notice-content-right" style="width: 50px;">
                                    <span class="noto" style="color: #555">09-14</span>
                                </div>
                            </div>
                            <div class="notice-content flex flex-justify p-tb10"
                                style="border-bottom: 1px solid #e7e7e7;">
                                <div class="notice-content-left">
                                    <div class="notice-content">
                                        <p class="subject noto weight700 font14">
                                            <span style="margin-right: 10px;">[일반]</span> 운영자
                                            확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                        </p>
                                    </div>
                                </div>
                                <div class="notice-content-right" style="width: 50px;">
                                    <span class="noto" style="color: #555">09-14</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="flex flex-justify width100 m-tb20">
                    <div class="RecentPosts" style="width: 68%; height: 600px;  border: 1px solid #ccc;">
                        <div class="공지 p10" style="width: 100%; ">
                            <div class="title">
                                <h2 class="noto font16 m-b10">전체 게시판</h2>
                            </div>
                            <div class="notice-wrap p-lr10">
                                <div class="notice-content flex flex-justify p-tb10"
                                    style="border-bottom: 1px solid #e7e7e7;">
                                    <div class="notice-content-left">
                                        <div class="notice-content">
                                            <p class="subject noto weight700 font14">
                                                <span style="color: #d92550; margin-right: 10px;">[공지]</span> 운영자
                                                확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="notice-content-right" style="width: 50px;">
                                        <span class="noto" style="color: #555">09-14</span>
                                    </div>
                                </div>
                                <div class="notice-content flex flex-justify p-tb10"
                                    style="border-bottom: 1px solid #e7e7e7;">
                                    <div class="notice-content-left">
                                        <div class="notice-content">
                                            <p class="subject noto weight700 font14">
                                                <span style="color: #d92550; margin-right: 10px;">[공지]</span> 운영자
                                                확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="notice-content-right" style="width: 50px;">
                                        <span class="noto" style="color: #555">09-14</span>
                                    </div>
                                </div>
                                <div class="notice-content flex flex-justify p-tb10"
                                    style="border-bottom: 1px solid #e7e7e7;">
                                    <div class="notice-content-left">
                                        <div class="notice-content">
                                            <p class="subject noto weight700 font14">
                                                <span style="color: #d92550; margin-right: 10px;">[공지]</span> 운영자
                                                확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="notice-content-right" style="width: 50px;">
                                        <span class="noto" style="color: #555">09-14</span>
                                    </div>
                                </div>
                                <div class="notice-content flex flex-justify p-tb10"
                                    style="border-bottom: 1px solid #e7e7e7;">
                                    <div class="notice-content-left">
                                        <div class="notice-content">
                                            <p class="subject noto weight700 font14">
                                                <span style="margin-right: 10px;">[일반]</span> 운영자
                                                확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="notice-content-right" style="width: 50px;">
                                        <span class="noto" style="color: #555">09-14</span>
                                    </div>
                                </div>
                                <div class="notice-content flex flex-justify p-tb10"
                                    style="border-bottom: 1px solid #e7e7e7;">
                                    <div class="notice-content-left">
                                        <div class="notice-content">
                                            <p class="subject noto weight700 font14">
                                                <span style="margin-right: 10px;">[일반]</span> 운영자
                                                확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="notice-content-right" style="width: 50px;">
                                        <span class="noto" style="color: #555">09-14</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="" style="width: 30%; height: auto;">
                        <div class="main-right-top bg-white p20" style="border: 1px solid #5ebfd9;">
                            <h2 class="noto font16 m-b10">근태관리</h2>
                            <p class="noto font14 right">[ 2021년 01월 8일 금요일 ]</p>
                            <div class="attend flex flex-justify font14 noto weight700 m-tb20">
                                <span class="">출근시간</span> <span class="">AM 08:58</span>
                            </div>
                            <div class="attend flex flex-justify font14 noto weight700 m-tb20">
                                <span class="">퇴근시간</span> <span class="">PM 19:58</span>
                            </div>
                            <div class="attend flex flex-justify font14 noto weight700 m-tb20">
                                <span class="">현재상태</span> <span class="">업무중</span>
                            </div>
                            <div class="attend flex flex-justify font14 noto weight700 m-t20">
                                <button
                                    style="width: 220px; border: 1px solid #5ebfd9; color: #5ebfd9; border-radius: 50px; padding: 10px 0;"
                                    class="noto font14 weight700">출근하기</button>
                                <button
                                    style="width: 220px; border: 1px solid #ccc; color: #ccc; border-radius: 50px; padding: 10px 0;"
                                    class="noto font14 weight700">퇴근하기</button>
                            </div>
                        </div>
                        <div class="m-t20" style="width: 100%; height: 50%; border: 1px solid #00f;">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<%@ include file="/WEB-INF/views/grp_admin/ADMIN_FOOTER.jsp"%>