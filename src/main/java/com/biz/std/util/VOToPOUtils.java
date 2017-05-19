package com.biz.std.util;

import com.biz.std.model.GradePO;
import com.biz.std.model.MarkPO;
import com.biz.std.model.StudentPO;
import com.biz.std.model.SubjectPO;
import com.biz.std.vo.GradeVO;
import com.biz.std.vo.MarkVO;
import com.biz.std.vo.StudentVO;
import com.biz.std.vo.SubjectVO;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/5/8.
 */
public class VOToPOUtils {
    public static StudentPO studentVOToPO(StudentVO studentVO) {
        StudentPO studentPO = new StudentPO();
        studentPO.setId(studentVO.getId());
        studentPO.setName(studentVO.getName());
        studentPO.setGender(studentVO.getGender());
        studentPO.setBirthday(new Timestamp(studentVO.getBirthday().getTime()));
        studentPO.setAvgScore(studentVO.getAvgScore());
        studentPO.setImageUrl(studentVO.getImageUrl());
        studentPO.setGradePO(VOToPOUtils.gradeVoToPo(studentVO.getGradeVO()));
        if (studentVO.getSubjectVOList() != null) {
            studentPO.setSubjectPOList(subjectListVOToPO(studentVO.getSubjectVOList()));
        }
        return studentPO;
    }

    public static GradePO gradeVoToPo(GradeVO gradeVO) {
        GradePO gradePO = new GradePO();
        gradePO.setId(gradeVO.getId());
        gradePO.setName(gradeVO.getName());
        gradePO.setAvgScore(gradeVO.getAvgScore());
        gradePO.setStudentNumber(gradeVO.getStudentNumber());
        return gradePO;
    }

    public static SubjectPO subjectVOToPO(SubjectVO subjectVO) {
        SubjectPO subjectPO = new SubjectPO();
        subjectPO.setId(subjectVO.getId());
        subjectPO.setName(subjectVO.getName());
        subjectPO.setAvgScore(subjectVO.getAvgScore());
        subjectPO.setStudentNumber(subjectVO.getStudentNumber());
        return subjectPO;
    }

    public static List<SubjectPO> subjectListVOToPO(List<SubjectVO> subjectVOList) {
        List<SubjectPO> subjectPOList = new ArrayList<SubjectPO>();
        for (SubjectVO subjectVO : subjectVOList) {
            subjectPOList.add(subjectVOToPO(subjectVO));
        }
        return subjectPOList;
    }

    public static MarkPO markPOVOToPO(MarkVO markVO) {
        MarkPO markPO = new MarkPO();
        markPO.setId(markVO.getId());
        markPO.setScore(markVO.getScore());
        markPO.setStudentPO(VOToPOUtils.studentVOToPO(markVO.getStudentVO()));
        markPO.setSubjectPO(VOToPOUtils.subjectVOToPO(markVO.getSubjectVO()));
        return markPO;
    }
}
