<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    .form-icon {
        top: 50%;
        right: 28px;
    }
</style>

<body>
    <div class="admin">
        <header class="height50 line50" style="border-bottom: 1px solid #ccc; background-color: #F8F8F8;">
            <div class="nav p-lr20">
                <div class="mainMenu flex flex-justify center">
               		<h2 class="roboto"><a href="${pageContext.request.contextPath}/admin/grp_admin_main" style="text-decoration: none; color: #000;">GROUPWARE
                            SYSTEM</a></h2>
	                <p class="p-lr10"  style="margin: 0px auto; width: 1200px;">
		                <span class="noto font14 weight700 flex" style="justify-content: flex-start;">
							${sessionScope.empBuseoName} ${sessionScope.empGradeName} ${sessionScope.empName}(${sessionScope.empNum}) 
							- 권한 : ${sessionScope.empAuth}
						</span>
		                <c:if test = "${sessionScope.empName != null}">
		               		<ul class="subMenu flex flex-justify"">
		                		<li class="noto weight700 font18 m-lr20"><a href="${pageContext.request.contextPath}" 
	                        	style="color:#000;"><i class="fas fa-home"></i></a></li>
		                		<li><a href="${pageContext.request.contextPath}/grp_login" id="logout" class="noto font14" style="color:#000;">로그아웃</a></li>
	                		</ul>
	                	</c:if>
	                </p>
                </div>
            </div>
        </header>
        <div class="admin-main flex flex-justify height100">
            <div class="admin-left width11" style="border-right: 1px solid #ccc;">
                <form>
                    <div class="main-menu">
                        <div class="p10 flex" style="position: relative;">
                            <input type="text" name="" id="" class="input-150" autofocus tabindex="1"
                                placeholder="Search..." required  maxlength='10' />
                            <button class="s-btn" style="cursor:pointer"><i class="fas fa-search form-icon"></i></button>
                        </div>
                        <div class="tab-button noto left font14 width100 p-l20">사내조직/연락처</div>
                        <div class="sub-menu">
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/employee/grp_employee_list">사원목록</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/employee/grp_employee_register">사원등록</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/employee/grp_employee_chart">조직도</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-button noto left font14 width100 p-l20">게시판관리</div>
                        <div class="sub-menu">
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/board/grp_board_main">게시판</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-button noto left font14 width100 p-l20">전자결재</div>
                        <div class="sub-menu">
                            <ul>
                                <li><a href="#">전자결재</a></li>
                            </ul>
                        </div>
                        <div class="tab-button noto left font14 width100 p-l20">일정관리</div>
                        <div class="sub-menu">
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/calendar/grp_calendar_main">일정관리</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-button noto left font14 width100 p-l20">근태관리</div>
                        <div class="sub-menu">
                            <ul>
                                <li><a href="#">내 근태현황</a></li>
                            </ul>
                        </div>
                        <div class="tab-button noto left font14 width100 p-l20">자료실</div>
                        <div class="sub-menu">
                            <ul>
                                <li><a href="#">문서양식</a></li>
                                <li><a href="#">제품소개서</a></li>
                            </ul>
                        </div>
                        <div class="tab-button noto left font14 width100 p-l20">회사기본정보</div>
                        <div class="sub-menu">
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/company/grp_company_main">회사기본정보</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </form>
            </div>