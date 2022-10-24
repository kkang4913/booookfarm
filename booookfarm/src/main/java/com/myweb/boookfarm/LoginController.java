package com.myweb.boookfarm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping(value = "/login")
    public String login() {
        return "login";
    }

    @GetMapping(value = "/join")
    public String join() {
        return "join";
    }

    @GetMapping(value = "/find")
    public String find() { return "find"; }

}
