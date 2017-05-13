package com.biz.std.model;

import javax.persistence.*;
/**
 * Created by Administrator on 2017/5/5.
 */
@Entity
@Table(name = "grade")
public class GradePO {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;
    @Column(length = 20)
    private String name;
    @Column(name = "avg_score", columnDefinition = "decimal(5,2)")
    private float avgScore;
    @Column
    private int studentNumber;

    public GradePO() {
    }

    public GradePO(String name, float avgScore, int studentNumber) {
        this.name = name;
        this.avgScore = avgScore;
        this.studentNumber = studentNumber;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getAvgScore() {
        return avgScore;
    }

    public void setAvgScore(float avgScore) {
        this.avgScore = avgScore;
    }

    public int getStudentNumber() {
        return studentNumber;
    }

    public void setStudentNumber(int studentNumber) {
        this.studentNumber = studentNumber;
    }

    @Override
    public String toString() {
        return "GradePO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", avgScore=" + avgScore +
                ", studentNumber=" + studentNumber +
                '}';
    }
}
