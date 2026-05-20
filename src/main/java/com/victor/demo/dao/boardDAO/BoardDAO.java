package com.victor.demo.dao.boardDAO;

import com.victor.demo.model.Board;

import java.util.List;

public interface BoardDAO {
    //Gets all free boards with the selected number
    List<Board> get_by_personNum(int num);
}