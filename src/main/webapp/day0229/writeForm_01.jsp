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
    String grade = request.getParameter("grade");
    String[] langs = request.getParameterValues("lang");
    String like = request.getParameter("like");
    int height = Integer.parseInt(request.getParameter("height"));
    int weight = Integer.parseInt(request.getParameter("weight"));
    String date = request.getParameter("birth");
%>

<h3 class="alert alert-info">사원정보<br><br>
    최종학력: <b><%=grade%></b><br>
    가능한 컴퓨터 언어:<br>
    <%
        if(langs==null)
        {%>
            <font color="green">아무 언어도 못합니다<br></font>
        <%}
        else
        {
            for(int i=0;i< langs.length;i++)
            {%>
                &nbsp;&nbsp;<b><%=langs[i]%></b><br>
            <%}
        }
    %>
    같은조 하고 싶은 사람: <b><%=like%></b><br>
    키: <b><%=height%></b><br>
    몸무게: <b><%=weight%></b><br>
    입사일자: <b><%=date%></b><br>


</h3>


</body>
</html>