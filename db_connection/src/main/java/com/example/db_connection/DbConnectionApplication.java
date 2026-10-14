package com.example.db_connection;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan(basePackages = "com.example.db_connection")
@EntityScan(basePackages = "com.example.db_connection.entity")
@EnableJpaRepositories(basePackages = "com.example.db_connection.repo")
public class DbConnectionApplication {

	public static void main(String[] args) {
		SpringApplication.run(DbConnectionApplication.class, args);
		System.out.println("Loaded Successfully...!");
	}
}