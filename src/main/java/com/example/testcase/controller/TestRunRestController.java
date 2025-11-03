package com.example.testcase.controller;

import com.example.testcase.entity.TestRun;
import com.example.testcase.service.TestRunService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/testruns")
public class TestRunRestController {
    private final TestRunService service;

    public TestRunRestController(TestRunService service) {
        this.service = service;
    }

    @GetMapping
    public List<TestRun> getAll() {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<TestRun> getById(@PathVariable Long id) {
        TestRun run = service.findById(id);
        return run != null ? ResponseEntity.ok(run) : ResponseEntity.notFound().build();
    }

    @PostMapping
    public TestRun create(@RequestBody TestRun testRun) {
        return service.save(testRun);
    }

    @PutMapping("/{id}")
    public ResponseEntity<TestRun> update(@PathVariable Long id, @RequestBody TestRun updated) {
        TestRun existing = service.findById(id);
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
