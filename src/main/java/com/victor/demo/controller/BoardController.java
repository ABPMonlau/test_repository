package com.victor.demo.controller;

import com.victor.demo.dao.boardDAO.BoardDAO;
import com.victor.demo.model.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
public class BoardController {
    @Autowired
    private BoardDAO boardDAO;

    @GetMapping("/mesas/{num}")
    public ResponseEntity<ArrayList<Board>> get_by_personNum(@PathVariable int num) {
        System.out.println("Getting boards by person num");

        ArrayList<Board> list = new ArrayList<>();

        for (Board b : boardDAO.get_by_personNum(num)) {
            list.add(b);
        }
        
        if (list.isEmpty()) System.out.println("No free boards found.");

        return new ResponseEntity<>(list, HttpStatus.OK);
    }
}