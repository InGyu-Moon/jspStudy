package org.example.jspstudy.mysql.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
    static final String MYSQL_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String MYSQL_URL = "jdbc:mysql://localhost:3306/ajax";


    public DbConnect(){
        try {
            Class.forName(MYSQL_DRIVER);
            System.out.println("mysql 드라이버 연결 성공");
        } catch (ClassNotFoundException e) {
            System.out.println("mysql 드라이버 실패 : "+e.getMessage());
        }
    }

    public Connection getConnection(){
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(MYSQL_URL,"root","1234");
            System.out.println("mysql 계정 연결 성공");
        } catch (SQLException e) {
            System.out.println("mysql 연결 실패 : "+e.getMessage());
        }
        return conn;
    }

    public void dbClose(ResultSet rs, Statement stmt, Connection conn) {
        try {
            if(rs != null) rs.close();
            if(stmt != null) stmt.close();
            if(conn != null) conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void dbClose(Statement stmt, Connection conn) {
        try {
            if(stmt != null) stmt.close();
            if(conn != null) conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void dbClose(PreparedStatement pstmt, Connection conn) {
        try {
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {

        DbConnect db = new DbConnect();
        Connection conn = db.getConnection();
        System.out.println("conn = " + conn);
    }



}
