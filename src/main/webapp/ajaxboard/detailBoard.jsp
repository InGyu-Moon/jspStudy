<%@ page import="org.example.jspstudy.ajaxboard.AjaxBoardDao" %>
<%@ page import="org.example.jspstudy.ajaxboard.AjaxBoardDto" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
   AjaxBoardDao dao = new AjaxBoardDao();

   String num = request.getParameter("num");
   AjaxBoardDto dto = dao.getDataByNum(num);

   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");

   JSONObject ob = new JSONObject();
   ob.put("num", num);
   ob.put("writer", dto.getWriter());
   ob.put("subject", dto.getSubject());
   ob.put("content", dto.getContent());
   ob.put("avata", dto.getAvata());
   ob.put("writeday", sdf.format(dto.getWriteday()));

%>
<%=ob%>
