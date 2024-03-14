<%@ page import="org.example.jspajaxproject.simpleboard.SimpleBoardDto" %>
<%@ page import="org.example.jspajaxproject.simpleboard.SimpleBoardDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>Insert title here</title>
    <style>
        body * {
            font-size: 11pt;
            font-family: 'Noto Serif KR';
        }
        span.day {
            color: #ccc;
            font-size: 0.8em;

        }
    </style>
</head>
<%
    String num = request.getParameter("num");
    SimpleBoardDao dao = new SimpleBoardDao();

    dao.updateReadCount(num);
    SimpleBoardDto dto = dao.getContent(num);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

%>
<body>
<div style="margin: 50px 100px; width: 500px">
    <table class="table table-bordered">
        <caption align="top"><b style="font-size:15pt"><%=dto.getSubject()%></b></caption>
        <tr>
            <td>
                <b>작성자:<%=dto.getWriter()%></b><br>
                <span><%=sdf.format(dto.getWriteday())%></span>
                &nbsp;&nbsp;&nbsp;&nbsp;조회:<%=dto.getReadcount()%>
            </td>
        </tr>
        <tr>
            <td>
                <%=dto.getContent().replace("\n","<br>")%>
            </td>
        </tr>

        <tr>
            <td>
                <button type="button" class="btn btn-outline-info" onclick="location.href='addform.jsp'">
                    <i class="bi bi-pencil-square"></i>글쓰기</button>

                <button type="button" class="btn btn-outline-success" onclick="location.href='boardlist.jsp'">
                    <i class="bi bi-list-check"></i>목록</button>

                <button type="button" class="btn btn-outline-primary" onclick="location.href='updatepassform.jsp?num=<%=dto.getNum()%>'">
                    <i class="bi bi-pencil-square"></i>수정</button>

                <button type="button" class="btn btn-outline-danger" onclick="location.href='deletepassform.jsp?num=<%=dto.getNum()%>'">
                    <i class="bi bi-trash3"></i>삭제</button>

            </td>
        </tr>

    </table>

</div>
</body>
</html>