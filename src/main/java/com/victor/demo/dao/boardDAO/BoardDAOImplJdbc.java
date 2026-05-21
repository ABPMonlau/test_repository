package com.victor.demo.dao.boardDAO;

import com.victor.demo.model.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Query;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Repository
public class BoardDAOImplJdbc implements BoardDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private static final BoardRowMapper boardRowMapper = new BoardRowMapper();

    @Override
    public List<Board> get_by_personNum(int num) {
        String query = "SELECT * FROM mesas WHERE capacidad = ? AND activa = 1";

        return jdbcTemplate.query(query, boardRowMapper, num);
    }
}