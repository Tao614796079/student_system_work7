package com.biz.std.vo;

/**
 * Created by Administrator on 2017/5/8.
 */
public class GradeVO {
    private int id;
    private String name;
    private float avgScore;
    private int studentNumber;

    public GradeVO() {
    }

    public GradeVO(String name, float avgScore, int studentNumber) {
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
}
