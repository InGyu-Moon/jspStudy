<%@ page import="java.util.List" %>
<%@ page import="org.example.jspstudy.Student" %>
<%@ page import="java.util.ArrayList" %>
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
    <h3 class="alert alert-info">여기는 stuRedirect_11.jsp 파일 입니다.</h3>
<%
    List<Student> list = (ArrayList<Student>) request.getAttribute("list");

    // redirect로 이동시 request는 새로생성
    if (list == null) {
        System.out.println("list가 없어요");
    } else {
        System.out.println("list가 있어요");
    }
%>
</body>
</html>