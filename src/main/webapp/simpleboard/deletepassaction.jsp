<%@ page import="org.example.jspstudy.simpleboard.SimpleBoardDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>Insert title here</title>
</head>
<body>

<%
    String num = request.getParameter("num");
    String inputPass = request.getParameter("pass");

    SimpleBoardDao dao = new SimpleBoardDao();

    boolean bool = dao.checkPassword(num, inputPass);

    // 비밀번호가 일치하면 데이터 삭제
    if (bool) {
        dao.deleteData(num);
        response.sendRedirect("boardlist.jsp");
    }else{
%>
<script>
    alert("비밀번호를 다시 확인하세요");
    history.back();
</script>
    <%
    }

%>


</body>
</html>