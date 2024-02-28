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
    String city1 = request.getParameter("city1");
    String[] city2 = request.getParameterValues("city2");
%>
<h4 class="alert alert-info">
    1순위 지역 <%=city1%> <br><br>
    2순위 지역
<%
        if(city2==null){
            %>
    <font color="red">2순위는 지역선택 안하겠음</font>

<%
        }else {
            for(String c : city2){%>
                [<%=c%>] &nbsp;&nbsp;
            <%}
        }
%>
</h4>

</body>
</html>