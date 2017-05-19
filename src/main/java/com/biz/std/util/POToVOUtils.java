package com.biz.std.util;

import com.biz.std.model.GradePO;
import com.biz.std.model.StudentPO;
import com.biz.std.model.SubjectPO;
import com.biz.std.vo.GradeVO;
import com.biz.std.vo.StudentVO;
import com.biz.std.vo.SubjectVO;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/5/8.
 */
public class POToVOUtils {
    public static StudentVO studentPOToVO(StudentPO studentPO) {
        StudentVO studentVO = new StudentVO();
        studentVO.setId(studentPO.getId());
        studentVO.setName(studentPO.getName());
        studentVO.setGender(studentPO.getGender());
        studentVO.setBirthday(new Date(studentPO.getBirthday().getTime()));
        studentVO.setAvgScore(studentPO.getAvgScore());
        studentVO.setImageUrl(studentPO.getImageUrl());
        studentVO.setGradeVO(gradePOToVO(studentPO.getGradePO()));
        studentVO.setSubjectVOList(subjectVOListPOToVO(studentPO.getSubjectPOList()));
        return studentVO;
    }

    /**
     * GradePO转GradeVO
     */
    public static GradeVO gradePOToVO(GradePO gradePO) {
        GradeVO gradeVO = new GradeVO();
        gradeVO.setId(gradePO.getId());
        gradeVO.setName(gradePO.getName());
        gradeVO.setAvgScore(gradePO.getAvgScore());
        gradeVO.setStudentNumber(gradePO.getStudentNumber());
        return gradeVO;
    }

    public static SubjectVO subjectPOToVO(SubjectPO subjectPO) {
        SubjectVO subjectVO = new SubjectVO();
        subjectVO.setId(subjectPO.getId());
        subjectVO.setName(subjectPO.getName());
        subjectVO.setAvgScore(subjectPO.getAvgScore());
        subjectVO.setStudentNumber(subjectPO.getStudentNumber());
        return subjectVO;
    }

    public static List<StudentVO> studentVOListPOToVO(List<StudentPO> studentPOList) {
        List<StudentVO> studentVOList = new ArrayList<StudentVO>();
        for (StudentPO studentPO : studentPOList) {
            studentVOList.add(studentPOToVO(studentPO));
        }
        return studentVOList;
    }

    public static List<SubjectVO> subjectVOListPOToVO(List<SubjectPO> subjectPOList) {
        List<SubjectVO> subjectVOList = new ArrayList<SubjectVO>();
        for (SubjectPO subjectPO : subjectPOList) {
            subjectVOList.add(subjectPOToVO(subjectPO));
        }
        return subjectVOList;
    }
}
