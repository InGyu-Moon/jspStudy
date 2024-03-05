<%@ page import="org.example.jspstudy.mysql.db.DbConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    DbConnect db = new DbConnect();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String sql = "select * from info order by num";

    String s = "[";

    try {
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        while (rs.next()) {
            String num = rs.getString("num");
            String name = rs.getString("name");
            String hp = rs.getString("hp");
            String age = rs.getString("age");
            String photo = rs.getString("photo");

            //json 파싱
            s += "{";
            s += "\"num\":" + num + ",";
            s += "\"name\":" + "\"" + name + "\"" +",";
            s += "\"hp\":" + "\"" + hp + "\"" + ",";
            s += "\"age\":" + age + ",";
            s += "\"photo\":" + "\"" + photo + "\"";
            s += "},";
        }
        //마지막 ',' 제거
        s = s.substring(0, s.length() - 1);
    } catch (SQLException e) {
        System.out.println("e = " + e);
    }finally {
        db.dbClose(rs,pstmt,conn);
    }
    s += "]";
    System.out.println(s);
%>
<%=s%>