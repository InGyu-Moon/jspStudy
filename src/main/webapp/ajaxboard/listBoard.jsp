<%@ page import="org.example.jspstudy.ajaxboard.AjaxBoardDao" %>
<%@ page import="org.example.jspstudy.ajaxboard.AjaxBoardDto" %>
<%@ page import="java.util.List" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    
    AjaxBoardDao dao = new AjaxBoardDao();
    List<AjaxBoardDto> list = dao.getAllData();
    JSONArray arr = new JSONArray();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
    for (AjaxBoardDto dto : list) {
        JSONObject ob = new JSONObject();
        ob.put("num", dto.getNum());
        ob.put("writer", dto.getWriter());
        ob.put("subject", dto.getSubject());
        ob.put("content", dto.getContent());
        ob.put("avata", dto.getAvata());
        ob.put("writeday", sdf.format(dto.getWriteday()));

        arr.add(ob);
    }
%>
<%=arr%>