package org.example.data.dao;


import org.example.data.dto.MemberDto;
import org.example.db.DbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    public List<MemberDto> getAllMembers(){
        List<MemberDto> list = new ArrayList<>();
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from member order by name";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                MemberDto dto = new MemberDto();
                dto.setNum(rs.getString("num"));
                dto.setId(rs.getString("id"));
//                dto.setPass(rs.getString("pass"));
                dto.setAddr(rs.getString("addr"));
                dto.setHp(rs.getString("hp"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
                dto.setGaipday(rs.getTimestamp("gaipday"));
                list.add(dto);
            }
        } catch (SQLException e) {
            System.out.println("e = " + e);
        }finally {
            db.dbClose(rs, pstmt, conn);
        }
        return list;
    }

    public void deleteMemberByNum(String num) {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        String sql = "delete from member where num = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            pstmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            db.dbClose(pstmt, conn);
        }
    }
    public boolean isEqualPass(String num,String pass)
    {
        boolean b=false;

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="select * from member where num=? and pass=?";
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, num);
            pstmt.setString(2, pass);
            rs=pstmt.executeQuery();

            if(rs.next())
                b=true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            db.dbClose(rs, pstmt, conn);
        }
        return b;
    }

    public boolean isIdPass(String id,String pass)
    {
        boolean b=false;

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="select * from member where id=? and pass=?";
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pass);
            rs=pstmt.executeQuery();

            if(rs.next())
                b=true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            db.dbClose(rs, pstmt, conn);
        }
        return b;
    }

    public MemberDto getDataMember(String num) {
        MemberDto dto = new MemberDto();
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from member where num = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto.setNum(rs.getString("num"));
                dto.setId(rs.getString("id"));
                dto.setAddr(rs.getString("addr"));
                dto.setHp(rs.getString("hp"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
                dto.setGaipday(rs.getTimestamp("gaipday"));
            }
        } catch (SQLException e) {
            System.out.println("e = " + e);
        }finally {
            db.dbClose(rs, pstmt, conn);
        }
        return dto;
    }

    public void updateMember(MemberDto dto) {

        System.out.println("updateMember");
        System.out.println("dto.toString() = " + dto.toString());
        System.out.println("====================================");

        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        String sql = "update member set name=?,hp=?,addr=?,email=? where num=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,dto.getName());
            pstmt.setString(2,dto.getHp());
            pstmt.setString(3,dto.getAddr());
            pstmt.setString(4,dto.getEmail());
            pstmt.setString(5,dto.getNum());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("e = " + e);
        }finally {
            db.dbClose(pstmt, conn);
        }
    }


}
