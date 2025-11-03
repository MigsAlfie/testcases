package com.example.testcase.controller;

import com.example.testcase.entity.TestCase;
import com.example.testcase.entity.TestRun;
import com.example.testcase.service.TestCaseService;
import com.example.testcase.service.TestRunService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/testruns")
public class TestRunController {
    private final TestRunService runService;
    private final TestCaseService caseService;

    public TestRunController(TestRunService runService, TestCaseService caseService) {
        this.runService = runService;
        this.caseService = caseService;
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("testruns", runService.findAll());
        model.addAttribute("testcases", caseService.findAll());
        model.addAttribute("statuses", TestRun.Status.values());
        return "testruns";
    }

    @PostMapping
    public String create(@RequestParam Long testCaseId, @RequestParam TestRun.Status status) {
        TestRun run = new TestRun();
        TestCase tc = caseService.findById(testCaseId);
        run.setTestCase(tc);
        run.setStatus(status);
        runService.save(run);
        return "redirect:/testruns";
    }
}
