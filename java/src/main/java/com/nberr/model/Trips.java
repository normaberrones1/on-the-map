package com.nberr.model;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Trips {

    private Long id;
    private Long userId;
    private String destination;
    private LocalDate startDate;
    private LocalDate endDate;
    private BigDecimal totalCost = BigDecimal.ZERO;
    private BigDecimal budget = BigDecimal.ZERO;
    private BigDecimal savings = BigDecimal.ZERO;

    public Trips(Long id, Long userId, String destination, LocalDate startDate, LocalDate endDate, BigDecimal totalCost, BigDecimal budget, BigDecimal savings) {
        this.id = id;
        this.userId = userId;
        this.destination = destination;
        this.startDate = startDate;
        this.endDate = endDate;
        this.totalCost = totalCost;
        this.budget = budget;
        this.savings = savings;
    }

    public Trips() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public BigDecimal getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(BigDecimal totalCost) {
        this.totalCost = totalCost;
    }

    public BigDecimal getBudget() {
        return budget;
    }

    public void setBudget(BigDecimal budget) {
        this.budget = budget;
    }

    public BigDecimal getSavings() {
        return savings;
    }

    public void setSavings(BigDecimal savings) {
        this.savings = savings;
    }
}
