package com.example.testcase.controller;

import com.example.testcase.entity.TestCase;
import com.example.testcase.service.TestCaseService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/testcases")
public class TestCaseRestController {
    private final TestCaseService service;

    public TestCaseRestController(TestCaseService service) {
        this.service = service;
    }

    @GetMapping
    public List<TestCase> getAll() {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<TestCase> getById(@PathVariable Long id) {
        TestCase tc = service.findById(id);
        return tc != null ? ResponseEntity.ok(tc) : ResponseEntity.notFound().build();
    }

    @PostMapping
    public TestCase create(@RequestBody TestCase testCase) {
        return service.save(testCase);
    }

    @PutMapping("/{id}")
    public ResponseEntity<TestCase> update(@PathVariable Long id, @RequestBody TestCase updated) {
        TestCase existing = service.findById(id);
        if (existing == null) return ResponseEntity.notFound().build();
        updated.setId(id);
        return ResponseEntity.ok(service.save(updated));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
