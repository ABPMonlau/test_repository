package com.book_api.dao.tablesDAO;

import com.book_api.model.classes.tables;
import com.book_api.model.enums.tableStates;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class tableRowMapper implements RowMapper<tables> {
    @Override
    public tables mapRow(ResultSet rs, int rowNum) throws SQLException {
        tables t = new tables();
        t.setId(rs.getInt("id_mesa"));
        t.setCapacity(rs.getInt("capacidad"));
        t.setState((rs.getInt("activa") == 0) ? tableStates.BOOKED : tableStates.FREE);
        t.setLocation(rs.getString("ubicacion"));

        return t;
    }
}