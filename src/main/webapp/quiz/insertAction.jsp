<%@ page import="org.example.jspstudy.quiz.model.QuizDto" %>
<%@ page import="org.example.jspstudy.quiz.model.QuizDao" %>
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
    QuizDto dto = new QuizDto();
    QuizDao dao = new QuizDao();

    String age = request.getParameter("age");
    String phone = request.getParameter("phone");
    String name = request.getParameter("name");
    String licCheck = request.getParameter("licence");
    int licence = 0;// 운전면허 없음
    if(licCheck!=null){
        licence = 1; //운전면허 있음
    }

    dto.setName(name);
    dto.setPhone(phone);
    dto.setAge(age);
    dto.setLicence(licence);

    dao.insertData(dto);
    response.sendRedirect("list.jsp");

%>

</body>
</html>