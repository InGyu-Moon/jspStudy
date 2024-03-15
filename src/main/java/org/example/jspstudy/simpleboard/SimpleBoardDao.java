package org.example.jspstudy.simpleboard;

import org.example.jspstudy.mysql.db.DbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SimpleBoardDao {
    DbConnect db = new DbConnect();

    //getAllDatas
    public List<SimpleBoardDto> getAllDatas() {
        List<SimpleBoardDto> list = new ArrayList<>();

        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from simpleboard order by num desc";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                SimpleBoardDto dto = new SimpleBoardDto();

                dto.setNum(rs.getString("num"));
                dto.setWriter(rs.getString("writer"));
                dto.setPass(rs.getString("pass"));
                dto.setSubject(rs.getString("subject"));
                dto.setContent(rs.getString("content"));
                dto.setReadcount(rs.getInt("readcount"));
                dto.setWriteday(rs.getTimestamp("writeday"));

                list.add(dto);
            }
        } catch (SQLException e) {
            System.out.println("e = " + e);
        } finally {
            db.dbClose(rs, pstmt, conn);
        }
        return list;
    }

    // 삽입
    public void insertData(SimpleBoardDto dto) {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        String sql = "insert into simpleboard values(null,?,?,?,?,0,now())";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getWriter());
            pstmt.setString(2, dto.getPass());
            pstmt.setString(3, dto.getSubject());
            pstmt.setString(4, dto.getContent());
            pstmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            db.dbClose(pstmt, conn);
        }
    }

    // 내용보기
    public SimpleBoardDto getContent(String num) {
        SimpleBoardDto dto = new SimpleBoardDto();
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from simpleboard where num = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto.setNum(rs.getString("num"));
                dto.setWriter(rs.getString("writer"));
                dto.setPass(rs.getString("pass"));
                dto.setSubject(rs.getString("subject"));
                dto.setContent(rs.getString("content"));
                dto.setReadcount(rs.getInt("readcount"));
                dto.setWriteday(rs.getTimestamp("writeday"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            db.dbClose(rs, pstmt, conn);
        }

        return dto;
    }

    public void updateReadCount(String num) {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;

        String sql = "update simpleboard set readcount=readcount+1 where num=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            pstmt.execute();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public int getMaxNum() {
        int max = 0;
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        String sql = "select max(num) from simpleboard";
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                max = rs.getInt("max(num)");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            db.dbClose(rs, pstmt, conn);
        }
        return max;
    }

    // 페이징 1. 전체 개수 반환 , 2. 부분조회 startnum 부터 perpage 개수 만큼
    public int getTotalCount() {
        int cnt = 0;
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select count(*) from simpleboard";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                cnt = rs.getInt("count(*)");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return cnt;
    }

    // 부분 조회
    public List<SimpleBoardDto> getPagingList(int startNum, int perPage) {

        List<SimpleBoardDto> list = new ArrayList<>();


        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from simpleboard order by num desc limit ?,?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, startNum);
            pstmt.setInt(2, perPage);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                SimpleBoardDto dto = new SimpleBoardDto();

                dto.setNum(rs.getString("num"));
                dto.setWriter(rs.getString("writer"));
                dto.setPass(rs.getString("pass"));
                dto.setSubject(rs.getString("subject"));
                dto.setContent(rs.getString("content"));
                dto.setReadcount(rs.getInt("readcount"));
                dto.setWriteday(rs.getTimestamp("writeday"));
                list.add(dto);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            db.dbClose(rs, pstmt, conn);
        }
        return list;
    }

    public void deleteData(String num) {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        String sql = "delete from simpleboard where num = ?";

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

    public boolean checkPassword(String num, String inputPass) {
        boolean result = false;
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select pass from simpleboard where num = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                String dbPass = rs.getString("pass");
                if(dbPass.equals(inputPass))
                    result = true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            db.dbClose(rs, pstmt, conn);
        }
        return result;

    }
    public void updateData(SimpleBoardDto dto)
    {
        //subject,content 만수정
        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;

        String sql="update simpleboard set subject=?,content=?,writer=? where num=?";

        try {
            pstmt=conn.prepareStatement(sql);

            pstmt.setString(1, dto.getSubject());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getWriter());
            pstmt.setString(4, dto.getNum());
            pstmt.execute();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            db.dbClose(pstmt, conn);
        }

    }

}
