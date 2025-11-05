package com.example.testcase.service;

import com.example.testcase.entity.TestRun;
import com.example.testcase.repository.TestRunRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestRunService {
    private final TestRunRepository repo;

    public TestRunService(TestRunRepository repo) {
        this.repo = repo;
    }

    public List<TestRun> findAll() { return repo.findAll(); }

    // ADD THIS METHOD
    public List<TestRun> findByStatus(TestRun.Status status) { 
        return repo.findByStatus(status); 
    }

    public TestRun findById(Long id) { return repo.findById(id).orElse(null); }

    public TestRun save(TestRun run) { return repo.save(run); }

    public void delete(Long id) { repo.deleteById(id); }
}