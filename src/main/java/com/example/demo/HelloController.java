package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.stereotype.Controller;

@Controller
public class HelloController {

    @GetMapping("/")
    public String sayHello() {
        return "index.html";
    }

}
