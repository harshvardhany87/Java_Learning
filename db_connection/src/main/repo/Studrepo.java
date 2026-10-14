package com.example.db_connection.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.db_connection.entity.Stud;

public interface Studrepo extends JpaRepository<Stud, Integer> {
}