package com.example.db_connect.cntrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.db_connect.entity.student_data;
import com.example.db_connect.repo.Studrepo;

@RestController
public class studentcntrl {

    @Autowired
    private Studrepo repo;

    @GetMapping("/student_data")
    public List<student_data> getStudentData() {
        return repo.findAll();
    }
}