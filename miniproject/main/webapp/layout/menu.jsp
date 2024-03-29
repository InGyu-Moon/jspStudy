<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>

    <link rel="stylesheet" type="text/css" href="../menu/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="../menu/css/menu.css">

    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/function.js"></script>

    <title>Insert title here</title>
</head>
<%
    //프로젝트 경로
    String root=request.getContextPath();
%>
<body>
<%--<a href="<%=root%>/">메인</a>&nbsp;&nbsp;&nbsp;--%>
<%--<a href="<%=root%>/">로그인</a>&nbsp;&nbsp;&nbsp;--%>
<%--<a href="<%=root%>/index.jsp?main=member/addform.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;--%>
<%--<a href="<%=root%>/">Q & A</a>&nbsp;&nbsp;&nbsp;--%>
<%--<a href="<%=root%>/">방명록</a>&nbsp;&nbsp;&nbsp;--%>
<%--<a href="<%=root%>/">상품등록게시판</a>&nbsp;&nbsp;&nbsp;--%>
<%--<a href="<%=root%>/">이미지게시판</a>&nbsp;&nbsp;&nbsp;--%>


<%--<div style="background:#0099cc; font-size:22px; text-align:center; color:#FFF; font-weight:bold; height:100px; padding-top:50px;">Responsive Drop Down Menu jQuery CSS3 Using Icon Symbol</div>--%>
<div id="wrap">
    <header>
        <div class="inner relative">
            <a class="logo" href="http://www.freshdesignweb.com"></a>
            <a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
            <nav id="navigation">
                <ul id="main-menu">
                    <li class="current-menu-item"><a href="#">Home</a></li>
                    <li class="parent">
                        <a href="#">게시판</a>
                        <ul class="sub-menu">
                            <li><a href="#"><i class="icon-wrench"></i>고객 게시판</a></li>
                            <li><a href="#"><i class="icon-credit-card"></i>이미지 게시판</a></li>
                            <li><a href="#"><i class="icon-gift"></i>스마트 게시판</a></li>
                        </ul>
                    </li>
                    <li class="parent">
                        <a href="#">로그인</a>
                        <ul class="sub-menu">
                            <li><a href="<%=root%>/index.jsp?main=member/addform.jsp"><i class="icon-wrench"></i>회원가입</a></li>
                            <li><a href="#"><i class="icon-credit-card"></i>회원목록</a></li>
                            <li><a href="#"><i class="icon-gift"></i>마이페이지</a></li>
                        </ul>
                    </li>
                    <li class="parent">
                        <a href="#">방명록</a>
                        <ul class="sub-menu">
                            <li><a href="#">회원 방명록</a></li>
                            <li><a href="#">Medium Image</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
            <div class="clear"></div>
        </div>
    </header>
</div>
</body>
</html>
