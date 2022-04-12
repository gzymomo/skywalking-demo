package com.example.gateway;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
@RestController
@Slf4j
public class GatewayApplication {

    //private final static Logger log = LoggerFactory.getLogger(GatewayApplication.class);
    @Autowired
    private RestTemplate restTemplate;

    public static void main(String[] args) {
        SpringApplication.run(GatewayApplication.class, args);
    }

    @RequestMapping("/gateway")
    public String gateway(){
        log.info("request: /gateway");
        return "this is gateway!";
    }


    @RequestMapping("/service-a")
    public String servicea(){
        String result = restTemplate.getForObject("http://localhost:9001/service-a", String.class);
        log.info("request: /service-a");
        return "this is from Gateway to A! A result: " + result;
    }

    @RequestMapping("/service-b")
    public String serviceb(){
        String result = restTemplate.getForObject("http://localhost:9001/service-b", String.class);
        log.info("request: /service-b");
        return "this is from Gateway to A to B !  result: " + result;
    }

}
