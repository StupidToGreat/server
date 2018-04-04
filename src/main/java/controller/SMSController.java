package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SMSController {
    @RequestMapping(value = "list.do",
            params = "format=json", produces = {"application/json"})
    public void list(int id, String msg) {
        System.out.println(id);
    }
}
