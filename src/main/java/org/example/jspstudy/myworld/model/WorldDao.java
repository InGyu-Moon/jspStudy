package org.example.jspstudy.myworld.model;

import org.example.jspstudy.mysql.db.DbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

public class WorldDao {

    DbConnect db=new DbConnect();

    public void insertWorld(WorldDto dto)
    {
        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="insert into myworld values(null,?,?,?,now())";

        try {
            pstmt=conn.prepareStatement(sql);

            pstmt.setString(1, dto.getWriter());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getAvata());

            pstmt.execute();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            db.dbClose(pstmt, conn);
        }


    }


    public List<WorldDto> getAllMyWorld()
    {
        List<WorldDto> list=new Vector<WorldDto>();

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="select * from myworld order by num desc";

        try {
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();

            while(rs.next())
            {
                WorldDto dto=new WorldDto();

                dto.setNum(rs.getString("num"));
                dto.setWriter(rs.getString("writer"));
                dto.setContent(rs.getString("content"));
                dto.setAvata(rs.getString("avata"));
                dto.setWriteday(rs.getTimestamp("writeday"));

                list.add(dto);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            db.dbClose(rs, pstmt, conn);
        }


        return list;
    }

}