package org.example.jspstudy.ajaxboard;

import org.example.jspstudy.mysql.db.DbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AjaxBoardDao {

    DbConnect db = new DbConnect();

    // insert
    public void insertBoard(AjaxBoardDto dto) {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;

        String sql = "insert into ajaxboard values (null, ?,?,?,?,now())";
//        String sql = "insert into ajaxboard (writer,subject,content,avata,writeday)values (?,?,?,?,now())";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getWriter());
            pstmt.setString(2, dto.getSubject());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getAvata());
            pstmt.execute();
        } catch (SQLException e) {
            System.out.println("e = " + e);
        } finally {
            db.dbClose(pstmt, conn);
        }
    }

    // 전체 출력
    public List<AjaxBoardDto> getAllData(){
        List<AjaxBoardDto> list = new ArrayList<>();
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from ajaxboard order by num desc";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                AjaxBoardDto dto = new AjaxBoardDto();
                dto.setNum(rs.getString("num"));
                dto.setWriter(rs.getString("writer"));
                dto.setSubject(rs.getString("subject"));
                dto.setContent(rs.getString("content"));
                dto.setAvata(rs.getString("avata"));
                dto.setWriteday(rs.getTimestamp("writeday"));
                list.add(dto);
            }
        } catch (SQLException e) {
            System.out.println("e = " + e);
        }finally {
            db.dbClose(rs,pstmt,conn);
        }
        return list;
    }

    public AjaxBoardDto getDataByNum(String num){
        AjaxBoardDto dto = new AjaxBoardDto();

        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from ajaxboard where num = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto.setNum(rs.getString("num"));
                dto.setWriter(rs.getString("writer"));
                dto.setSubject(rs.getString("subject"));
                dto.setContent(rs.getString("content"));
                dto.setAvata(rs.getString("avata"));
                dto.setWriteday(rs.getTimestamp("writeday"));
            }else{
                System.out.println("getDataByNum에서 rs가 없음");
            }
        } catch (SQLException e) {
            System.out.println("e = " + e);
        }finally {
            db.dbClose(rs, pstmt, conn);
        }
        System.out.println("getDataByNum = " + dto.toString());

        return dto;
    }

    public void deleteBoard(String num) {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;

        String sql = "delete from ajaxboard where num = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            pstmt.execute();
        } catch (SQLException e) {
            System.out.println("e = " + e);
        }finally {
            db.dbClose(pstmt, conn);
        }
    }

    public void updateBoard(AjaxBoardDto dto) {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;

        String sql = "update ajaxboard " +
                "set writer = ?, subject = ?, content = ?, avata = ?" +
                "where num = ?";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, dto.getWriter());
            pstmt.setString(2, dto.getSubject());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getAvata());
            pstmt.setString(5, dto.getNum());
            pstmt.execute();
        } catch (SQLException e) {
            System.out.println("e = " + e);
        }finally {
            db.dbClose(pstmt, conn);
        }
    }

}
