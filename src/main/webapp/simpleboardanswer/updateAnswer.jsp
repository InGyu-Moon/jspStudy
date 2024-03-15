<%@ page import="org.example.jspstudy.simpleboardanswer.SimpleAnswerDao" %>
<%@ page import="org.example.jspstudy.simpleboardanswer.SimpleAnswerDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String idx = request.getParameter("idx");
    String nickname = request.getParameter("nickname");
    String content = request.getParameter("content");

    System.out.println("content = " + content);
    System.out.println("idx = " + idx);
    System.out.println("nickname = " + nickname);

    SimpleAnswerDao dao = new SimpleAnswerDao();
    SimpleAnswerDto dto = new SimpleAnswerDto();


    dto.setIdx(idx);
    dto.setNickname(nickname);
    dto.setContent(content);

    dao.updateAnswer(dto);

%>