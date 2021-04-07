<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MAIN_HEADER.jsp"%>
    <style>
        body {
            background-color: #fff;
        }

        header {
            width: 100%;
            height: 80px;
            /* position: fixed;
            top: 0;
            left: 0;
            right: 0; */
        }

        .company-img {
            width: 100%;
            height: 500px;
            object-fit: none;
        }

        a:visited {
            text-decoration: none;
            color: #000;
            list-style: none;
        }

        .cont-main {
            width: 380px;
            height: 300px;
        }

        .cont-main-t {
            width: 1200px;
            height: 300px;
        }

        .cont-img {
            width: 380px;
            height: 200px;
            background-size: cover;
        }

        .cont-main td {
            font-size: 12px;
        }
    </style>
<%@ include file="/WEB-INF/views/MAIN_MENU.jsp"%>
    <div class="content" style="margin: 20px auto; width: 1200px;">
        <div class="con-first  flex flex-justify" style="border-bottom: 1px solid #e7e7e7;">
            <div class="cont-main">
                <table class="table table-hover" style="border-bottom: 1px solid #e7e7e7;">
                    <thead>
                        <h1><b>NOTICE</b></h1>
                    </thead>
                    <tr>
                        <td>
                            <a href="${pageContext.request.contextPath}/article/grp_article_list?boardCode=NOTICE">
                            <i class="fas fa-exclamation-circle font16"></i> 공지사항</a>

                        </td>
                        <td class="right p-lr10">
                            <a href="${pageContext.request.contextPath}/article/grp_article_list?boardCode=NOTICE">2021.01.02</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">사원 공지</a>
                        </td>
                        <td class="right p-lr10">
                            <a href="#">2021.01.06</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">임원 공지</a>
                        </td>
                        <td class="right p-lr10">
                            <a href="#">2021.01.06</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">업데이트 확인</a>

                        </td>
                        <td class="right p-lr10">
                            <a href="#">2021.01.01</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">웹사이트 오픈</a>
                        </td>
                        <td class="right p-lr10">
                            <a href="#">2021.12.31</a>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="cont-main">
                <table class="table table-hover" style="border-bottom: 1px solid #e7e7e7;">
                    <thead>
                        <h1><b>SERVICE CENTER</b></h1>
                    </thead>
                    <tr>
                        <td class="">
                            대표전화
                        </td>
                        <td class="right p-lr10">
                            000-0000-0000
                        </td>
                    </tr>
                    <tr>
                        <td class="">
                            FAQ 자주 묻는 질문
                        </td>
                        <td class="right p-lr10 ">
                            <a href="#">바로가기
                                <i class="fas fa-arrow-right"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td class="">
                            1:1 문의
                        </td>
                        <td class="right p-lr10 ">
                            <a href="#">신청
                                <i class="fas fa-search-plus"></i></a>
                        </td>
                    </tr>
                     <tr>
                        <td class="">
                           <a href="${pageContext.request.contextPath}/article/grp_article_list?boardCode=CUSBULBOARD">
                           <i class="fas fa-clipboard-list font16"></i> ${boardTitle} 게시판</a>
                        </td>
                        <td class="right p-lr10 ">
                            <a href="${pageContext.request.contextPath}/article/grp_article_list?boardCode=CUSBULBOARD" style="color:#000;">바로가기
                                <i class="fas fa-arrow-right"></i></a>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="cont-main m-b10">
                <h1><b>GALLERY</b></h1>
                <div class="owl-carousel owl-theme">
                    <div class="item cont-img ">
                        <img src="${pageContext.request.contextPath}/images/main/1.jpg" />
                    </div>
                    <div class="item cont-img ">
                        <img src="${pageContext.request.contextPath}/images/main/2.jpg" />
                    </div>
                    <div class="item cont-img ">
                        <img src="${pageContext.request.contextPath}/images/main/3.jpg" />
                    </div>
                    <div class="item cont-img ">
                        <img src="${pageContext.request.contextPath}/images/main/4.jpg" />
                    </div>
                </div>
            </div>
        </div>
        <div class="con-two m-t20 flex">
            <div class="cont-main-t m-b10">
                <h1><b>COMPANY</b></h1>
                <div>
                    <ul>
                        <li> Repellendus at facere distinctio, cupiditate deleniti porro? Eum, veniam velit vero corrupti, quam sint dicta quaerat, inventore blanditiis fugit rerum perspiciatis assumenda.</li>
                        <li>Omnis nostrum minima aliquid maxime ducimus harum deserunt modi excepturi. Ducimus nostrum, id porro neque illum eveniet voluptas vel laborum suscipit sunt obcaecati, hic dolore fugiat esse quae ipsam molestias, beatae sequi voluptatum quo magnam? Voluptas id voluptatem quos, beatae sunt libero?</li>
                        <li>Quam hic laboriosam adipisci eum voluptates officia.</li>
                    </ul>
                    <ul>
                        <li>Molestiae ducimus soluta, in amet architecto quod ipsum eaque hic accusantium tempore totam debitis veniam quas? Quae, distinctio suscipit, amet quis velit dolor incidunt, mollitia hic aliquam quia deserunt nisi. Sit at cum deserunt unde, minima laudantium architecto necessitatibus ad nostrum eveniet sed magnam inventore dignissimos molestias, odio eligendi modi illum accusantium, officiis cumque sapiente possimus? Nisi aut accusamus soluta dolorum? Omnis!</li>
                    </ul>
                </div>
            </div> 
        </div>
    </div>
<%@ include file="/WEB-INF/views/MAIN_FOOTER.jsp"%>