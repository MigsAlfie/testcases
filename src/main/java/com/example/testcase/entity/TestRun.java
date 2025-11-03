package com.example.testcase.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class TestRun {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "test_case_id")
    private TestCase testCase;

    @Enumerated(EnumType.STRING)
    private Status status;

    public enum Status {
        NOT_TESTED, PASSED, FAILED, SKIPPED
    }
}
