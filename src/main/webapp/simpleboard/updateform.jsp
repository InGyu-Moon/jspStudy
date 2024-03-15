<%@ page import="org.example.jspstudy.simpleboard.SimpleBoardDao" %>
<%@ page import="org.example.jspstudy.simpleboard.SimpleBoardDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>Insert title here</title>
    <style type="text/css">
        #preshow{
            position: absolute;
            left: 650px;
            top: 100px;
        }
    </style>
</head>
<body>

<%
    String num = request.getParameter("num");

    SimpleBoardDao dao = new SimpleBoardDao();
    SimpleBoardDto dto = dao.getContent(num);

    System.out.println("updateform.jsp");
    System.out.println("num = " + num);
%>



<div style="margin: 50px 100px; width: 500px;">
    <form action="updateaction.jsp" method="post">
        <input hidden value="<%=num%>" name="num">
        <table class="table table-bordered">
            <tr>
                <th width="100" class="table-info">작성자</th>
                <td>
                    <input type="text" name="writer" class="form-control"
                           style="width: 120px;" required="required" value="<%=dto.getWriter()%>">
                </td>
            </tr>

            <tr>
                <th width="100" class="table-info">제목</th>
                <td>
                    <input type="text" name="subject" class="form-control"
                           style="width: 300px;" required="required" value="<%=dto.getSubject()%>">
                </td>
            </tr>

            <tr>
                <td colspan="2">
             <textarea style="width: 480px; height: 100px;"
                       class="form-control" name="content" required="required"><%=dto.getContent()%></textarea>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <button type="submit" style="width: 100px;" class="btn btn-success btn-md">수정하기</button>
                    <button type="button" style="width: 100px;" class="btn btn-warning btn-md" onclick="location.href='boardlist.jsp'">목록보기</button>
                    <!-- type이 image submit일 경우 기본기능이 submit -->
                    <%--                    <input type="image" src="" style="width: 100px" onclick="location.href='addaction.jsp'">--%>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>