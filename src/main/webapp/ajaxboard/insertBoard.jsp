<%@ page import="org.example.jspstudy.ajaxboard.AjaxBoardDto" %>
<%@ page import="org.example.jspstudy.ajaxboard.AjaxBoardDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String writer = request.getParameter("writer");
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");
    String avata = request.getParameter("avata");

    AjaxBoardDto dto = new AjaxBoardDto();
    dto.setWriter(writer);
    dto.setSubject(subject);
    dto.setContent(content);
    dto.setAvata(avata);


    AjaxBoardDao dao = new AjaxBoardDao();
    dao.insertBoard(dto);
%>