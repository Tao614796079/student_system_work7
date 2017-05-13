package com.biz.std.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by Administrator on 2017/5/5.
 */
@Entity
@Table(name = "student")
public class StudentPO {
    /**
     * 学号
     */
    @Id
    private int id;
    /**
     * 姓名
     */
    @Column(length = 20)
    private String name;
    /**
     * 性别
     */
    @Column(length = 2)
    private String gender;
    /**
     * 出生日期
     */
    @Column
    private Timestamp birthday;
    /**
     * 平均分
     */
    @Column(name = "avg_score", columnDefinition = "decimal(5,2)")
    private float avgScore;
    /**
     * 头像上传地址
     */
    @Column(name = "image_url", length = 80)
    private String imageUrl;
    /**
     * 班级
     */
    @ManyToOne(fetch = FetchType.EAGER)
    private GradePO gradePO;
    /**
     *选修的课程
     */
    @ManyToMany(fetch = FetchType.EAGER)
    private List<SubjectPO> subjectPOList;

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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getBirthday() {
        return birthday;
    }

    public void setBirthday(Timestamp birthday) {
        this.birthday = birthday;
    }

    public float getAvgScore() {
        return avgScore;
    }

    public void setAvgScore(float avgScore) {
        this.avgScore = avgScore;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public GradePO getGradePO() {
        return gradePO;
    }

    public void setGradePO(GradePO gradePO) {
        this.gradePO = gradePO;
    }

    public List<SubjectPO> getSubjectPOList() {
        return subjectPOList;
    }

    public void setSubjectPOList(List<SubjectPO> subjectPOList) {
        this.subjectPOList = subjectPOList;
    }

    @Override
    public String toString() {
        return "StudentPO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", birthday=" + birthday +
                ", avgScore=" + avgScore +
                ", imageUrl='" + imageUrl + '\'' +
                ", gradePO=" + gradePO +
                ", subjectPOList=" + subjectPOList +
                '}';
    }
}
