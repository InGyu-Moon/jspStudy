<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
   String sCode = request.getParameter("name_sCode");
   String sName = request.getParameter("name_sName");
   String price = request.getParameter("name_price");
   String color = request.getParameter("name_color");

   JSONArray arr = new JSONArray();
   JSONObject ob = new JSONObject();

   ob.put("sCode", sCode);
   ob.put("sName", sName);
   ob.put("price", price);
   ob.put("color", color);

   arr.add(ob);

   System.out.println("ob = " + ob);
   System.out.println("arr = " + arr);
%>
<%=ob%>