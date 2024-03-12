<%@ page import="org.example.jspstudy.ajaxboard.AjaxBoardDao" %>
<%@ page import="org.example.jspstudy.ajaxboard.AjaxBoardDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    AjaxBoardDao dao = new AjaxBoardDao();

    String num = request.getParameter("num");
    String writer = request.getParameter("writer");
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");
    String avata = request.getParameter("avata");

    System.out.println("updateBoard - num = " + num);

    AjaxBoardDto dto = dao.getDataByNum(num);

    System.out.println("1. dto.toString() = " + dto.toString());

    dto.setWriter(writer);
    dto.setSubject(subject);
    dto.setContent(content);
    dto.setAvata(avata);

    System.out.println("2. dto.toString() = " + dto.toString());


    dao.updateBoard(dto);

%>