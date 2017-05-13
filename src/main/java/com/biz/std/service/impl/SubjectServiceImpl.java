package com.biz.std.service.impl;

import com.biz.std.model.GradePO;
import com.biz.std.model.MarkPO;
import com.biz.std.model.StudentPO;
import com.biz.std.model.SubjectPO;
import com.biz.std.repository.MarkJpaRepository;
import com.biz.std.repository.StudentJpaRepository;
import com.biz.std.repository.SubjectJpaRepository;
import com.biz.std.service.SubjectService;
import com.biz.std.util.ObjectUtils;
import com.biz.std.util.POToVOUtils;
import com.biz.std.vo.MarkVO;
import com.biz.std.vo.StudentVO;
import com.biz.std.vo.SubjectVO;
import net.sf.json.JSONArray;
import net.sf.json.util.JSONUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/5/6.
 */
@Service("subjectService")
public class SubjectServiceImpl implements SubjectService {
    @Autowired
    private SubjectJpaRepository subjectJpaRepository;
    @Autowired
    private StudentJpaRepository studentJpaRepository;
    @Autowired
    private MarkJpaRepository markJpaRepository;

    public void saveSubject(String name) {
        //课程名称存在则不作处理，不存在则存入学科信息
        if (subjectJpaRepository.findAllByName(name).size() == 0) {
            subjectJpaRepository.save(new SubjectPO(name, 0, 0));
        }
    }

    public List<SubjectVO> getAllSubject() {
        List<SubjectPO> subjectPOList = subjectJpaRepository.findAll();
        List<SubjectVO> subjectVOList = new ArrayList<SubjectVO>();
        for (SubjectPO subjectPO : subjectPOList) {
            subjectVOList.add(POToVOUtils.subjectPOToVO(subjectPO));
        }
        return subjectVOList;
    }

    public void deleteSubject(int id) {
        subjectJpaRepository.delete(id);
    }


    public List<SubjectVO> getAllSubjectById(List<Integer> idList) {
        return POToVOUtils.subjectVOListPOToVO(subjectJpaRepository.findAll(idList));
    }

    @Transactional
    public void updateSubjectName(int id, String name) {
        subjectJpaRepository.updateName(name, id);
    }

    /**
     * 添加课程和成绩
     * 1、学生平均成绩重新计算
     * 2、班级平均分和人数更新
     * 3、课程平均成绩计算
     * 4、存入课程成绩
     */
    @Transactional
    public void addSubject(int studentId, String subjects, String scores) {
        StudentPO studentPO = studentJpaRepository.findOne(studentId);
        Integer[] subjectsId = ObjectUtils.batchObjectToInt(JSONArray.fromObject(subjects).toArray());
        Float[] score = ObjectUtils.batchObjectToFloat(JSONArray.fromObject(scores).toArray());
        SubjectPO subjectPO = null;
        float sum = 0;
        for (Float f : score) {
            sum += f;
        }
        float studentAvgScore = (studentPO.getAvgScore() * studentPO.getSubjectPOList().size() + sum) / (studentPO.getSubjectPOList().size() + score.length);

        //班级平均分
        GradePO gradePO = studentPO.getGradePO();
        float gradeAvgScore = (gradePO.getAvgScore() * gradePO.getStudentNumber() +studentAvgScore - studentPO.getAvgScore())/gradePO.getStudentNumber();
        studentPO.getGradePO().setAvgScore(gradeAvgScore);

        //学生平均分修改
        studentPO.setAvgScore(studentAvgScore);
        List<MarkPO> markPOList = new ArrayList<MarkPO>();
        List<SubjectPO> subjectPOList = studentPO.getSubjectPOList();
        for (int i = 0; i < subjectsId.length; i++) {
            MarkPO markPO = new MarkPO();
            markPO.setScore(score[i]);
            markPO.setStudentPO(studentPO);
            subjectPO = subjectJpaRepository.findOne(subjectsId[i]);
            //科目平均分修改
            float subjectAvgScore = (subjectPO.getAvgScore() * subjectPO.getStudentNumber() + score[i]) / (subjectPO.getStudentNumber() + 1);
            subjectPO.setAvgScore(subjectAvgScore);
            subjectPO.setStudentNumber(subjectPO.getStudentNumber() + 1);
            markPO.setSubjectPO(subjectPO);
            subjectPOList.add(subjectPO);
            markPOList.add(markPO);
        }
        studentPO.setSubjectPOList(subjectPOList);
        markJpaRepository.save(markPOList);
    }
}
