<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="org.example.jspajaxproject.memberjoin.model.MemberJoinDao" %>
<%@ page import="org.example.jspajaxproject.memberjoin.model.MemberJoinDto" %>
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
    String realPath = session.getServletContext().getRealPath("/upload");
    int uploadSize = 1024 * 1024 * 5;

    MultipartRequest multi = null;
    MemberJoinDao dao = new MemberJoinDao();
    MemberJoinDto dto = new MemberJoinDto();

    dto.setM_id(multi.getParameter("m_id"));
    dto.setM_pass(multi.getParameter("m_pass"));
    dto.setM_hp(multi.getParameter("m_hp"));
    dto.setM_name(multi.getParameter("m_name"));
    dto.setM_num(multi.getParameter("m_num"));

    String photo = multi.getFilesystemName("m_photo");
    dto.setM_photo(photo);

%>
</body>
</html>