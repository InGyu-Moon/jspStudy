<%@ page import="org.json.simple.JSONObject" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String foodPhoto = request.getParameter("foodPhoto");
    String foodName = request.getParameter("foodName");
    String avg = request.getParameter("avg");

    JSONObject ob = new JSONObject();

    ob.put("foodPhoto", foodPhoto);
    ob.put("foodName", foodName);
    ob.put("avg", avg);
%>
<%=ob%>