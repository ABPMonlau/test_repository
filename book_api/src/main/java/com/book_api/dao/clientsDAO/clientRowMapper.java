package com.book_api.dao.clientsDAO;

import com.book_api.model.classes.clients;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class clientRowMapper implements RowMapper<clients> {
    @Override
    public clients mapRow(ResultSet rs, int i) throws SQLException {
        clients c = new clients();
        c.setId(rs.getInt("id_cliente"));
        c.setName(rs.getString("nombre"));
        c.setEmail(rs.getString("email"));
        c.setPhone(rs.getString("telefono"));
        c.setBookDate(rs.getDate("fecha_registro"));

        return c;
    }
}