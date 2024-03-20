package org.example.model1miniproject.data.dao;

import org.example.model1miniproject.data.dto.MemberDto;
import org.example.model1miniproject.db.DbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {
    DbConnect db = new DbConnect();

    public int isIdCheck(String id){
        int isId = 0;

        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select count(*) from member where id = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getInt(1) == 1) {
                    isId = 1;
                }


                isId = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("e = " + e);
        }finally {
            db.dbClose(rs, pstmt, conn);
        }
        return isId;
    }

    public void insertMember(MemberDto dto) {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;

        String sql = "insert into member values(null,?,?,?,?,?,?,now())";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,dto.getName());
            pstmt.setString(2,dto.getId());
            pstmt.setString(3,dto.getPass());
            pstmt.setString(4,dto.getHp());
            pstmt.setString(5,dto.getAddr());
            pstmt.setString(6,dto.getEmail());
            pstmt.execute();
        } catch (SQLException e) {
            System.out.println("e = " + e);
        }finally {
            db.dbClose(pstmt, conn);
        }
    }

    public String getNameById(String id) {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select name from member where id = ?";

        String name = "";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                name = rs.getString("name");
            }
        } catch (SQLException e) {
            System.out.println("e = " + e);
        }finally {
            db.dbClose(rs, pstmt, conn);
        }
        return name;
    }
}
