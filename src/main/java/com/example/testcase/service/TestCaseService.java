package com.example.testcase.service;

import com.example.testcase.entity.TestCase;
import com.example.testcase.repository.TestCaseRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestCaseService {
    private final TestCaseRepository repo;

    public TestCaseService(TestCaseRepository repo) {
        this.repo = repo;
    }

    public List<TestCase> findAll() { return repo.findAll(); }

    public TestCase findById(Long id) { return repo.findById(id).orElse(null); }

    public TestCase save(TestCase testCase) { return repo.save(testCase); }

    public void delete(Long id) { repo.deleteById(id); }
}
