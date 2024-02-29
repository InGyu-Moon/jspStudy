package org.example.jspstudy.quiz.model;

import org.example.jspstudy.oracle.db.DbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class QuizDao {

    DbConnect db = new DbConnect();


    public void insertData(QuizDto dto){
        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;

        String sql="insert into quiz values(seq_quiz.nextval,?,?,?,?,sysdate)";

        try {
            pstmt=conn.prepareStatement(sql);

            //?바인딩0
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getAge());
            pstmt.setString(3, dto.getPhone());
            pstmt.setInt(4, dto.getLicence());

            //업데이트
            pstmt.execute();
        } catch (SQLException e) {
            System.out.println("insertData_e = " + e);
        }finally {
            db.dbClose(pstmt, conn);
        }
    }

    public ArrayList<QuizDto> getAllData(){
        ArrayList<QuizDto> list = new ArrayList<>();

        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from quiz";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                QuizDto dto = new QuizDto();
                dto.setNum(rs.getString("num"));
                dto.setAge(rs.getString("age"));
                dto.setName(rs.getString("name"));
                dto.setPhone(rs.getString("phone"));
                dto.setLicence(rs.getInt("licence"));
                dto.setDate(rs.getTimestamp("join_date"));
                list.add(dto);
            }

        } catch (SQLException e) {
            System.out.println("getAllData_e = " + e);
        }finally {
            db.dbClose(rs,pstmt,conn);
        }

        return list;
    }

    public void deleteData(String num){
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;

        String sql = "delete from quiz where num = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,num);
            pstmt.execute();
        } catch (SQLException e) {
            System.out.println("deleteData_e = " + e);
        }finally {
            db.dbClose(pstmt,conn);
        }
    }
}
