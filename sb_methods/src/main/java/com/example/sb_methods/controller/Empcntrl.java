package com.example.sb_methods.controller;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Empcntrl {

    @GetMapping("getData") // retrieve data
    public String getData() {
        return "Data will be retrieved here!!: ";
    }

    @PostMapping("InsertData") // send or create data
    public String InsertData() {
        return "Data will be inserted here!!: ";
    }

    @PutMapping("updateData") // update data
    public String updateData() {
        return "Data will be updated here!!: ";
    }

    @DeleteMapping("deleteData") // delete data permanently
    public String deleteData() {
        return "Data will be deleted here!!: ";
    }

}
