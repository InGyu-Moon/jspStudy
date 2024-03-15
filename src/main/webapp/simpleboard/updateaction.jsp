<%@ page import="org.example.jspstudy.simpleboard.SimpleBoardDto" %>
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
    request.setCharacterEncoding("utf-8");
    SimpleBoardDao dao = new SimpleBoardDao();
    SimpleBoardDto dto = new SimpleBoardDto();
    String num = request.getParameter("num");
    dto.setNum(num);
    dto.setWriter(request.getParameter("writer"));
    dto.setSubject(request.getParameter("subject"));
    dto.setContent(request.getParameter("content"));

    System.out.println("updateaction.jsp");
    System.out.println("num = " + num);
    System.out.println("dto.toString() = " + dto.toString());

    dao.updateData(dto);

    response.sendRedirect("contentview.jsp?num="+num);

%>


</body>
</html>