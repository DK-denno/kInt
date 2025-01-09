package com.kyosk.interview;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

// Define this class as a REST controller
@RestController
public class ApiController {

    // Simple GET endpoint
    @GetMapping("/books")
    public List<Map<String, String>> sayHello() {

        List<Map<String, String>> res = new ArrayList<>();
        Map<String, String> result = new HashMap<>();
        // List<Books> result = new ArrayList<>();
        for (Books book: Books.values()) {
            result.put("name", book.name());
            result.put("value", book.toString());

            res.add(result);
        }
        return res;
    }
}