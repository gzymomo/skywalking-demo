package com.example.servicea;

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
public class ServiceAApplication {

    private final static Logger log = LoggerFactory.getLogger(ServiceAApplication.class);
    @Autowired
    private RestTemplate restTemplate;

    public static void main(String[] args) {
        SpringApplication.run(ServiceAApplication.class, args);
    }



    @RequestMapping("/service-a")
    public String servicea(){
        log.info("request: /service-a  Result:"+  "this is service-a!");
        return "this is service-a!";
    }

    @RequestMapping("/service-b")
    public String serviceb(){
        String result = restTemplate.getForObject("http://localhost:9002/service-b", String.class);
        log.info("request: /service-b  Result:" + "this is from B to A! B result: " + result);
        return "this is from B to A! B result: " + result;
    }


}
