<%@ page import="org.example.jspstudy.ajaxboard.AjaxBoardDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AjaxBoardDao dao = new AjaxBoardDao();
    String num = request.getParameter("num");

    dao.deleteBoard(num);

    System.out.println("num = " + num);
%>