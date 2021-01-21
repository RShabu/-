<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/grp_employee/CHART_HEADER.jsp"%>
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.orgchart.css">
<script src="https://kit.fontawesome.com/b0d47d0840.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/jquery.orgchart.js"></script>
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>	
<style>
    .orgchart .top-level .title{
        background-color: #f1801f;
        text-shadow: 1px 1px 1px rgba(255, 255, 255, 0.5);;
    }
    .orgchart .high-level .title{
        background-color: #777;
        color: #fff;
    }
    .orgchart .middle-level .title{
        background-color: #bcbcbc;
        color: #fff;
    }
    .orgchart .low-level .title{
        background-color: #e0e0e0;
    }
    .orgchart .bottom-level .title{
        background-color: #f0f0f0;
    }
</style>

               	<div class="admin-right width89 p20"style="border-left: 1px solid #ccc;">
                    <div class="content">
                        <div class="title-box center font14 line50 height50 weight700"
                        style="width: 250px; border-radius: 2px; background-color: #eeeeee; border: 1px solid #ccc;">
                            <span>사내 조직도</span>
                        </div>
                        <div class="content-text">
                            <div class="title m-t20">
                                <h3>사내조직/연락처 > 조직도</h3>
                            </div>
                            <div class="page-content center">
                                <div id="chart-container"></div>
                            </div>
                        </div>
                    </div>
                </div>

</body>
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_FOOTER.jsp"%>

<script type="text/javascript">
    $(function () {
        var datascource = {
            'name': '대표이사',
            'title': 'CEO',
            'className': 'top-level',
            'children': [{
                    'name': '관리부',
                    'title': '관리부장',
                    'className': 'high-level',
                    'children': [{
                        'name': '관리과',
                        'title': '관리과장',
                        'className': 'middle-level',
                        'children': [{
                            'name': '관리과',
                            'title': '대리',
                            'className': 'low-level',
                            'children': [{
                                'name': '관리과',
                                'title': '사원',
                                'className': 'bottom-level'
                            }]
                        }]
                    }]

                },
                {
                    'name': '기획부',
                    'title': '기획부장',
                    'className': 'high-level',
                    'children': [{
                            'name': '기획과',
                            'title': '기획과장',
                            'className': 'middle-level',
                            'children': [{
                                'name': '기획과',
                                'title': '대리',
                                'className': 'low-level',
                                'children': [{
                                    'name': '기획과',
                                    'title': '사원',
                                    'className': 'bottom-level'

                                }]
                            }]
                        }, {
                            'name': 'TF팀',
                            'title': 'TF팀장',
                            'className': 'middle-level',
                            'children': [{
                                'name': 'TF팀',
                                'title': '팀원',
                                'className': 'low-level',

                            }]
                        }

                    ]

                },
                {
                    'name': '인사부',
                    'title': '인사부장',
                    'className': 'high-level',
                    'children': [{
                            'name': '총무과',
                            'title': '총무과장',
                            'className': 'middle-level',
                            'children': [{
                                'name': '총무과',
                                'title': '대리',
                                'className': 'low-level',
                                'children': [{
                                    'name': '총무과',
                                    'title': '사원',
                                    'className': 'bottom-level'

                                }]
                            }]
                        },
                        {
                            'name': '인사과',
                            'title': '인사과장',
                            'className': 'middle-level',
                            'children': [{
                                'name': '인사과',
                                'title': '대리',
                                'className': 'low-level',
                                'children': [{
                                    'name': '인사과',
                                    'title': '사원',
                                    'className': 'bottom-level'
                                }]
                            }]
                        }
                    ]
                },
                {
                    'name': '영업부',
                    'title': '영업부장',
                    'className': 'high-level',
                    'children': [{
                        'name': '영업부',
                        'title': '영업과장',
                        'className': 'middle-level'
                    }, {
                        'name': '영업외주',
                        'title': '영업팀장',
                        'className': 'middle-level'
                    }]
                },
                {
                    'name': '생산부',
                    'title': '생산부장',
                    'className': 'high-level',
                    'children': [{
                        'name': '생산부',
                        'title': '공장장',
                        'className': 'middle-level'
                    }]
                },
                {
                    'name': '자재부',
                    'title': '자재부장',
                    'className': 'high-level',
                    'children': [{
                        'name': '재재부',
                        'title': '자재처리부',
                        'className': 'middle-level',
                    }]
                }
            ]
        };

        $('#chart-container').orgchart({
            'visibleLevel': 5,
            'pan': true,
            'data': datascource,
            'nodeContent': 'title',
        });

    });
</script>
</html>