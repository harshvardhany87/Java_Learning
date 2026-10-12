package com.example.prac_project.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Testcntrl {
    @GetMapping("data")
    public String data() {
        return "Data will be here: ";
    }

}
