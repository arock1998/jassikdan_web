package com.jassikdan;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
@SpringBootApplication
public class JassikdanApplication {

	public static void main(String[] args) {
		SpringApplication.run(JassikdanApplication.class, args);
	}

}
