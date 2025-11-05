package com.example.testcase.controller;

import com.example.testcase.entity.TestCase;
import com.example.testcase.entity.TestRun;
import com.example.testcase.service.TestCaseService;
import com.example.testcase.service.TestRunService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
    public String list(@RequestParam(required = false) Long selectedTestCase,
                      @RequestParam(required = false) TestRun.Status selectedStatus,
                      @RequestParam(required = false) TestRun.Status filterStatus,
                      Model model) {
        // Get test runs - filtered or all
        List<TestRun> testRuns = (filterStatus != null) 
            ? runService.findByStatus(filterStatus) 
            : runService.findAll();
        
        model.addAttribute("testruns", testRuns);
        model.addAttribute("testcases", caseService.findAll());
        model.addAttribute("statuses", TestRun.Status.values());
        
        // Pass selected values to persist dropdown selections
        model.addAttribute("selectedTestCase", selectedTestCase);
        model.addAttribute("selectedStatus", selectedStatus != null ? selectedStatus : TestRun.Status.NOT_TESTED);
        model.addAttribute("filterStatus", filterStatus);
        
        return "testruns";
    }

    @PostMapping
    public String create(@RequestParam Long testCaseId, 
                        @RequestParam TestRun.Status status,
                        @RequestParam(required = false) TestRun.Status filterStatus) {
        TestRun run = new TestRun();
        TestCase tc = caseService.findById(testCaseId);
        run.setTestCase(tc);
        run.setStatus(status);
        runService.save(run);
        
        // Redirect with selected values and preserve filter
        String redirect = "redirect:/testruns?selectedTestCase=" + testCaseId + "&selectedStatus=" + status;
        if (filterStatus != null) {
            redirect += "&filterStatus=" + filterStatus;
        }
        return redirect;
    }
}