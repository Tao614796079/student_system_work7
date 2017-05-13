package com.biz.std.vo;

/**
 * Created by Administrator on 2017/5/6.
 */
public class SubjectVO {
    private int id;
    private String name;
    private float avgScore;
    private int studentNumber;

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
        return "SubjectVO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", avgScore=" + avgScore +
                ", studentNumber=" + studentNumber +
                '}';
    }
}
