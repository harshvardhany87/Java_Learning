package com.example.db_connection.cntrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.db_connection.entity.Stud;
import com.example.db_connection.repo.Studrepo;

@RestController
public class studentcntrl {

    @Autowired
    private Studrepo repo;

    @GetMapping("/student_data")
    public List<Stud> getstudent_data() {
        return repo.findAll();
    }

    @GetMapping("test")
    public String test() {
        return "Controller is working!";
    }
}