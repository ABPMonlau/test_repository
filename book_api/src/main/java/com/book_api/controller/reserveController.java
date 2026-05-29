package com.book_api.controller;

import com.book_api.model.enums.bookStates;
import com.book_api.model.enums.timeShiftStates;

import com.book_api.model.classes.books;
import com.book_api.dao.booksDAO.bookDAO;

import com.book_api.model.classes.clients;
import com.book_api.dao.clientsDAO.clientDAO;

import com.book_api.model.classes.tables;
import com.book_api.dao.tablesDAO.tableDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class reserveController {
    @Autowired
    private bookDAO bookDAO;

    @Autowired
    private clientDAO clientDAO;

    @Autowired
    private tableDAO tableDAO;

    @PostMapping("/agregar/cliente")
    public ResponseEntity<String> addClient(@RequestBody clients c) {
        System.out.print("Adding client...");

        int cRows = clientDAO.addClient(c);

        if (cRows == 0) {
            System.out.println("Error creating client!");

            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        System.out.println("Done!");

        return new ResponseEntity<>("Successfully created", HttpStatus.CREATED);
    }

    @PostMapping("/reservar")
    public ResponseEntity<String> addReserve(@RequestBody books b) {
        if (b == null || b.getClient() == null) {
            System.out.println("Invalid request!");

            return new ResponseEntity<>("Invalid Request", HttpStatus.BAD_REQUEST);
        }

        System.out.print("Checking for client...");

        clients c = clientDAO.getClient(b.getClient().getId());

        if (c == null) {
            System.out.println("Client not found!");

            return new ResponseEntity<>("Client not found!", HttpStatus.NOT_FOUND);
        }

        System.out.println("Client found!");
        System.out.print("Booking...");

        b.setState(bookStates.Pendiente);

        int bRows = bookDAO.addReserve(b);

        if (bRows == 0) {
            System.out.println("Error creating reserve!");

            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        tableDAO.setDeactive(b.getTable().getId());

        System.out.println("Done!");

        return new ResponseEntity<>("Successfully reserved", HttpStatus.CREATED);
    }

    @GetMapping("/cancelar/{id}")
    public ResponseEntity<String> cancelReserve(@PathVariable int id) {
        System.out.print("Canceling...");

        books b = bookDAO.getReserveById(id);

        if (b == null || b.getTable() == null) return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

        int tID = b.getTable().getId();

        int bRows = bookDAO.cancelReserve(id);

        if (bRows == 0) return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

        int tRows = tableDAO.setActive(tID);

        if (tRows == 0) return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

        System.out.println("Done!");

        return new ResponseEntity<>("Successfully Cancelled", HttpStatus.ACCEPTED);
    }

    @GetMapping("/buscar/libres")
    public ResponseEntity<?> checkReserve() {
        System.out.print("Checking for tables...");

        List<tables> tableList = tableDAO.getAvaliableTables(0, timeShiftStates.maniana);

        if (tableList.isEmpty()) {
            System.out.println("No available tables found!");

            return new ResponseEntity<>("No available tables found!", HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(tableList, HttpStatus.OK);
    }

    @GetMapping("/buscar/libres/{b}")
    public ResponseEntity<?> checkReserve(@PathVariable books b) {
        System.out.print("Checking for tables...");

        List<tables> tableList = tableDAO.getAvaliableTables(b.getGuests(), timeShiftStates.maniana);

        if (tableList.isEmpty()) {
            System.out.println("No available tables found!");

            return new ResponseEntity<>("No available tables found!", HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(tableList, HttpStatus.OK);
    }
}