
package com.example.db_connect;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.persistence.autoconfigure.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan(basePackages = "com.example.db_connect.entity")
@EnableJpaRepositories(basePackages = "com.example.db_connect.repo")
public class DbConnectApplication {

	public static void main(String[] args) {
		SpringApplication.run(DbConnectApplication.class, args);
		System.out.println("Loaded Successfully...!");
	}
}
