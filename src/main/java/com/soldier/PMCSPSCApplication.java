package com.soldier;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/*第二步：修改启动类，继承SpringBootServletInitializer类并重写configure方法 2019.12.24（第一步在pom）*/
@SpringBootApplication
public class PMCSPSCApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(PMCSPSCApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(PMCSPSCApplication.class, args);
	}
}