package com.victor.demo.dao.boardDAO;

import com.victor.demo.model.Board;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BoardRowMapper implements RowMapper<Board> {
    @Override
    public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
        Board b = new Board();
        b.set_tableNum(rs.getInt("numero_mesa"));
        b.set_personNum(rs.getInt("capacidad"));
        b.set_isBooked(rs.getBoolean("activa"));

        return b;
    }
}