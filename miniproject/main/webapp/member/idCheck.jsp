<%@ page import="org.example.model1miniproject.data.dao.MemberDao" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
   String id = request.getParameter("id");
   MemberDao dao = new MemberDao();
   int count = dao.isIdCheck(id);

   JSONObject ob = new JSONObject();
   ob.put("count", count);

   System.out.println("hi");
%>
<%=ob%>