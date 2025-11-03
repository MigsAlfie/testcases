package com.example.testcase.controller;

import com.example.testcase.entity.TestCase;
import com.example.testcase.service.TestCaseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/testcases")
public class TestCaseController {
    private final TestCaseService service;

    public TestCaseController(TestCaseService service) {
        this.service = service;
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("testcases", service.findAll());
        return "testcases";
    }

    @GetMapping("/new")
    public String form(Model model) {
        model.addAttribute("testcase", new TestCase());
        return "testcase_form";
    }

    @PostMapping
    public String save(@ModelAttribute TestCase testCase) {
        service.save(testCase);
        return "redirect:/testcases";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("testcase", service.findById(id));
        return "testcase_form";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        service.delete(id);
        return "redirect:/testcases";
    }
}
