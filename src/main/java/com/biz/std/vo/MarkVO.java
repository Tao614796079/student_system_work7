package com.biz.std.vo;

import com.biz.std.model.StudentPO;
import com.biz.std.model.SubjectPO;

/**
 * Created by Administrator on 2017/5/9.
 */
public class MarkVO {
    private int id;
    private float score;
    private StudentVO studentVO;
    private SubjectVO subjectVO;

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

    public StudentVO getStudentVO() {
        return studentVO;
    }

    public void setStudentVO(StudentVO studentVO) {
        this.studentVO = studentVO;
    }

    public SubjectVO getSubjectVO() {
        return subjectVO;
    }

    public void setSubjectVO(SubjectVO subjectVO) {
        this.subjectVO = subjectVO;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("MarkVO{");
        sb.append("id=").append(id);
        sb.append(", score=").append(score);
        sb.append(", studentVO=").append(studentVO);
        sb.append(", subjectVO=").append(subjectVO);
        sb.append('}');
        return sb.toString();
    }
}
