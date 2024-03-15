<%@ page import="org.example.jspstudy.simpleboardanswer.SimpleAnswerDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%

   String idx = request.getParameter("idx");

   SimpleAnswerDao dao = new SimpleAnswerDao();
   dao.deleteAnswer(idx);
%>