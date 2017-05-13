package com.biz.std.model;

import com.biz.std.model.StudentPO;
import com.biz.std.model.SubjectPO;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/5/8.
 */
@Entity
@Table(name = "mark")
public class MarkPO {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;
    @Column(name = "score", columnDefinition = "decimal(5,2)")
    private float score;
    @ManyToOne
    private StudentPO studentPO;
    @ManyToOne
    private SubjectPO subjectPO;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public StudentPO getStudentPO() {
        return studentPO;
    }

    public void setStudentPO(StudentPO studentPO) {
        this.studentPO = studentPO;
    }

    public SubjectPO getSubjectPO() {
        return subjectPO;
    }

    public void setSubjectPO(SubjectPO subjectPO) {
        this.subjectPO = subjectPO;
    }

    @Override
    public String toString() {
        return "MarkPO{" +
                "id=" + id +
                ", score=" + score +
                ", studentPO=" + studentPO +
                ", subjectPO=" + subjectPO +
                '}';
    }
}
