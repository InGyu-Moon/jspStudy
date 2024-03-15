package org.example.jspstudy.simpleboardanswer;


import org.example.jspstudy.mysql.db.DbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SimpleAnswerDao {

    DbConnect db=new DbConnect();

    public void insertAnswer(SimpleAnswerDto dto)
    {
        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;

        String sql="insert into simpleboardanswer values (null,?,?,?,now())";

        try {
            pstmt=conn.prepareStatement(sql);

            pstmt.setString(1, dto.getNum());
            pstmt.setString(2, dto.getNickname());
            pstmt.setString(3, dto.getContent());
            pstmt.execute();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            db.dbClose(pstmt, conn);
        }
    }

    public List<SimpleAnswerDto> getAllAnswers(){
        List<SimpleAnswerDto> list = new ArrayList<>();

        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from simpleboardanswer";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                SimpleAnswerDto dto = new SimpleAnswerDto();
                dto.setNickname(rs.getString("nickname"));
                dto.setContent(rs.getString("content"));
                list.add(dto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            db.dbClose(rs, pstmt, conn);
        }
        return list;
    }

    public List<SimpleAnswerDto> getAnswerList(String num) {
        List<SimpleAnswerDto> list = new ArrayList<>();
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from simpleboardanswer where num = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                SimpleAnswerDto dto = new SimpleAnswerDto();
                dto.setNum(rs.getString("num"));
                dto.setContent(rs.getString("content"));
                dto.setNickname(rs.getString("nickname"));
                dto.setWriteday(rs.getTimestamp("writeday"));
                dto.setIdx(rs.getString("idx"));

                list.add(dto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            db.dbClose(rs, pstmt, conn);
        }
        return list;
    }

    public void deleteAnswer(String idx){

        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;

        String sql = "delete from simpleboardanswer where idx = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, idx);
            pstmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            db.dbClose(pstmt,conn);
        }
    }

    public void updateAnswer(SimpleAnswerDto dto){

        System.out.println("====================");

        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;

        String sql="update simpleboardanswer set content=?,nickname=? where idx=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getContent());
            pstmt.setString(2, dto.getNickname());
            pstmt.setString(3, dto.getIdx());
            pstmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            db.dbClose(pstmt,conn);
        }
    }



}