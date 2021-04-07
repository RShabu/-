<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer>
        <div class="footer" style="border-top: 1px solid #e7e7e7;">
            <div class="footer-logo-wrap flex m-tb30">
                <div class="footer-logo">
                    <a href="${pageContext.request.contextPath}">
                        <img src="${pageContext.request.contextPath}/images/main/logo1.jpg" width="120px" height="70px"/>
                    </a>
                </div>
                <div class="footer-nav">
                    <ul class="flex">
                        <li><a href="#" class="noto weight700 font14" style="color:#888">회사소개</a></li>
                        <li><a href="#" style="margin-left:40px; color:#888" class="noto weight700">고객센터</a></li>
                        <li><a href="#" style="margin-left:40px; color:#888" class="noto weight700">포트폴리오</a></li>
                        <li><a href="#" style="margin-left:40px; color:#888" class="noto weight700">서비스</a></li>
                        <li><a href="#" style="margin-left:40px; color:#888" class="noto weight700">제품소개</a></li>
                        <li><a href="#" style="margin-left:40px; color:#888" class="noto weight700">오시는길</a></li>
                    </ul>
                    <p style="color:#888;margin-top:3px;" class="noto weight700 font12">
                        GRPDESIGN   | | 경상남도 김해시 분성로
                    </p>
                    <p style="color:#888;margin-top:3px;" class="noto weight700 font12 m-b40">
                        <i class="fas fa-phone-alt" style="margin-right: 5px;"></i>:
                        <span style="margin-left: 5px;">000-0000-0000 |  055) 321-4321</span>
                        <span style="margin-left: 40px;">대표자 : 홍길동</span></br>
                    </p>
                </div>
            </div>
        </div>
    </footer>
</body>
<script>
    $(function () {
        var owl = $('.owl-carousel');
        owl.owlCarousel({
            autoplay: true,
            autoplayTimeout: 6000,
            autoplayHoverPause: true,
            margin: 10,
            loop: true,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1
                },
                800: {
                    items: 1
                },
                1200: {
                    items: 1,
                    dots: true,
                }
            }
        });
    });
</script>
<script>
	$(function() {
		$("#logout").click(function() {
			$.ajax({
				url		: "${pageContext.request.contextPath}/grp_logout",
				type	: "POST",
				data	: "",
				success : function(data) {
					if( data == "success" ) {
						alert("로그아웃 되었습니다..");
						window.location.href = '${pageContext.request.contextPath}/grp_login';
					}
				},
				error	: function() {
					alert("시스템 에러!!");
				}
			});
		});
	});
</script>
<script>
function articleDelete(boardCode, articleid) {
	var str = confirm("삭제 후 복구는 불가능합니다.\n선택하신 정보를 삭제하시겠습니까?");
	var formData  = {
			boardCode : boardCode,
			articleid : articleid
	};
    
    if( str ) {

        //alert(boardCode);
        //alert(aid);
                
        $.ajax({
        	url 	: "${pageContext.request.contextPath}/article/grp_article_delete",
        	type 	: "POST", 	
        	data 	: formData,
        	success	: function (resData) {
        		alert("삭제되었습니다.");
        		window.location.href = '${pageContext.request.contextPath}/article/grp_article_list?boardCode=${boardCode}';
            },
            error 	: function() {
            	alert("선택하신 정보가 없습니다.");
            }
        });
    }
}
</script>
</html>