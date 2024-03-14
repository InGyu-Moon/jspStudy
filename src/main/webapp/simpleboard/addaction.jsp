<%@ page import="org.example.jspajaxproject.simpleboard.SimpleBoardDto" %>
<%@ page import="org.example.jspajaxproject.simpleboard.SimpleBoardDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf-8");

    String writer = request.getParameter("writer");
    String subject = request.getParameter("subject");
    String pass = request.getParameter("pass");
    String content = request.getParameter("content");

    SimpleBoardDto dto = new SimpleBoardDto();
    dto.setWriter(writer);
    dto.setPass(pass);
    dto.setSubject(subject);
    dto.setContent(content);

    SimpleBoardDao dao = new SimpleBoardDao();
    dao.insertData(dto);

//    response.sendRedirect("boardlist.jsp");

    // insert후 목록이 아닌 디테일 페이지로 가기
    int num = dao.getMaxNum();
    response.sendRedirect("contentview.jsp?num=" + num);

%>