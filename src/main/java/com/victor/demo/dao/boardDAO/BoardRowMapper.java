package com.victor.demo.dao.boardDAO;

import com.victor.demo.model.Board;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BoardRowMapper implements RowMapper<Board> {
    @Override
    public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
        Board b = new Board();
        b.setTableNum(rs.getInt("numero_mesa"));
        b.setPersonNum(rs.getInt("capacidad"));
        b.setIsBooked(rs.getInt("activa") == 1);

        return b;
    }
}