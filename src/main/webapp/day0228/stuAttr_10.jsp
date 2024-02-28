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
   <h3>request 에 Vector 저장후 불러오는 연습</h3>
   <%
      List<Student> list = new ArrayList<>();
      list.add(new Student("홍길동","서초구",88));
      list.add(new Student("유재석","강남구",78));
      list.add(new Student("강호동","동작구",76));
      list.add(new Student("지석진","관악구",96));
      list.add(new Student("이수근","송파구",100));

      request.setAttribute("list", list);

   %>
   <jsp:forward page="stuFoward_10.jsp"></jsp:forward>
</body>
</html>