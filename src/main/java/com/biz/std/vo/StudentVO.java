package com.biz.std.vo;


import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/5/8.
 */
public class StudentVO {
    private int id;
    private String name;
    private String gender;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;
    private float avgScore;
    private String imageUrl;
    private GradeVO gradeVO;
    private List<SubjectVO> subjectVOList;

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

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
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

    public GradeVO getGradeVO() {
        return gradeVO;
    }

    public void setGradeVO(GradeVO gradeVO) {
        this.gradeVO = gradeVO;
    }

    public List<SubjectVO> getSubjectVOList() {
        return subjectVOList;
    }

    public void setSubjectVOList(List<SubjectVO> subjectVOList) {
        this.subjectVOList = subjectVOList;
    }

    @Override
    public String toString() {
        return "StudentVO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", birthday=" + birthday +
                ", avgScore=" + avgScore +
                ", imageUrl='" + imageUrl + '\'' +
                ", gradeVO=" + gradeVO +
                ", subjectVOList=" + subjectVOList +
                '}';
    }
}
