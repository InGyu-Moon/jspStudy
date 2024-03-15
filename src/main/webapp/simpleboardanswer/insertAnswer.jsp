<%@ page import="org.example.jspstudy.simpleboardanswer.SimpleAnswerDto" %>
<%@ page import="org.example.jspstudy.simpleboardanswer.SimpleAnswerDao" %>
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
    SimpleAnswerDao dao = new SimpleAnswerDao();
    SimpleAnswerDto dto = new SimpleAnswerDto();

    String num = request.getParameter("num");
    String nickname = request.getParameter("nickname");
    String content = request.getParameter("content");

    dto.setNum(num);
    dto.setNickname(nickname);
    dto.setContent(content);

    dao.insertAnswer(dto);

    response.sendRedirect("../simpleboard/contentview.jsp?num="+num);

%>
</body>
</html>