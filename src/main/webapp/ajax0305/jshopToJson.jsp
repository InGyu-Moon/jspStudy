<%@ page import="org.example.jspstudy.mysql.db.DbConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    JSONArray arr = new JSONArray();

    DbConnect db = new DbConnect();
    Connection conn = db.getConnection();
    Statement stmt = null;
    ResultSet rs = null;

    String sql = "select * from jshop order by num";

    try {
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);



        while (rs.next()) {
            String num = rs.getString("num");
            String sangpum = rs.getString("sangpum");
            String color = rs.getString("color");
            String price = rs.getString("price");
            String imagename = rs.getString("imagename");

            JSONObject ob = new JSONObject();
            ob.put("num", Integer.parseInt(num));
            ob.put("sangpum", sangpum);
            ob.put("color", color);
            ob.put("price", Integer.parseInt(price));
            ob.put("imagename", imagename);

            arr.add(ob);
        }

    }
    catch (SQLException e) {
        System.out.println("e = " + e);
    }finally {
        db.dbClose(rs, stmt, conn);
    }

%>
<%=arr%>
