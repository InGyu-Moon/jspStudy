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
    <style>
        .mainImg {
            width: 120px;
        }
    </style>
</head>
<body>
   <h2>연예인 사진 20개 4행 5열 출력</h2>
<table>
   <%
      int a=0;

      for (int row=1;row<=4;row++)
      {%>
         <tr>
            <%
               for (int col=1;col<=5;col++)
               {
                  a++;
                  %>
            <td>
               <img class="mainImg" src="../image/연예인사진/<%=a%>.jpg">
            </td>
            <%}
            %>
         </tr>

      <%}
   %>
</table>
</body>
</html>