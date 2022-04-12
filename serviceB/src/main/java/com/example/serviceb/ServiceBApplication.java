package com.example.serviceb;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class ServiceBApplication {

    private final static Logger log = LoggerFactory.getLogger(ServiceBApplication.class);


    public static void main(String[] args) {
        SpringApplication.run(ServiceBApplication.class, args);
    }

    @RequestMapping("/service-b")
    public String serviceb(){
        log.info("request: /service-b  Result:"+ "this is service-b!");
        return "this is service-b!";
    }

}
