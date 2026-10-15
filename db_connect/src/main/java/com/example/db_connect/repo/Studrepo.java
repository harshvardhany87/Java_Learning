package com.example.db_connect.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.db_connect.entity.student_data;

public interface Studrepo extends JpaRepository<student_data, Integer> {

}