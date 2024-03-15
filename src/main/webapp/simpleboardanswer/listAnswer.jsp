<%@ page import="org.example.jspstudy.simpleboardanswer.SimpleAnswerDao" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.jspstudy.simpleboardanswer.SimpleAnswerDto" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String num = request.getParameter("num");
    SimpleAnswerDao dao = new SimpleAnswerDao();
    List<SimpleAnswerDto> list = dao.getAnswerList(num);

    JSONArray arr = new JSONArray();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");


    for (SimpleAnswerDto dto : list) {
        JSONObject ob = new JSONObject();
        ob.put("idx", dto.getIdx());
        ob.put("num", dto.getNum());
        ob.put("nickname", dto.getNickname());
        ob.put("content", dto.getContent());
        ob.put("writeday", sdf.format(dto.getWriteday()));

        arr.add(ob);
    }

%>
<%=arr%>