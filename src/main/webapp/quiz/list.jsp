<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
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

<%
   QuizDao dao = new QuizDao();
   ArrayList<QuizDto> list = dao.getAllData();

   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<div style="margin: 50px 100px">
   <button type="button" class="btn btn-info"
           onclick="location.href='insertForm.jsp'">입력폼</button>

   <hr>
   <table class="table table-bordered" style="width: 800px;">
      <caption align="top"><b>QUIZ 전체목록</b></caption>
      <tr class="table-success">
         <th width="80">No.</th>
         <th width="200">이름</th>
         <th width="200">나이</th>
         <th width="350">핸드폰</th>
         <th width="200">운전면허</th>
         <th width="200">가입날짜</th>
         <th width="200">수정/삭제</th>

      </tr>
      <%
         for(int i=0;i<list.size();i++)
         {
            QuizDto dto=list.get(i);
      %>
      <tr>
         <td align="center"><%=i+1 %></td>
         <td><%=dto.getName() %></td>
         <td><%=dto.getAge() %></td>
         <td><%=dto.getPhone() %></td>
         <td><%=dto.getLicence()==1?"있음":"없음" %></td>
         <%--        <td><%=dto.getSdate() %></td>--%>
         <td><%=sdf.format(dto.getDate()) %></td>
         <td>
            <button type="button" class="btn btn-info btn-sm" onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
            <button type="button" class="btn btn-danger btn-sm" onclick="location.href='deleteQuiz.jsp?num=<%=dto.getNum()%>'">삭제</button>
         </td>
      </tr>
      <%}
      %>
   </table>
</div>
</body>
</html>