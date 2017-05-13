package com.biz.std.service.impl;

import com.biz.std.model.MarkPO;
import com.biz.std.repository.MarkJpaRepository;
import com.biz.std.repository.StudentJpaRepository;
import com.biz.std.repository.SubjectJpaRepository;
import com.biz.std.service.MarkService;
import com.biz.std.util.POToVOUtils;
import com.biz.std.util.VOToPOUtils;
import com.biz.std.vo.MarkVO;
import com.biz.std.vo.StudentVO;
import com.biz.std.vo.SubjectVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/5/9.
 */
@Service
public class MarkServiceImpl implements MarkService {
    @Autowired
    private StudentJpaRepository studentJpaRepository;
    @Autowired
    private SubjectJpaRepository subjectJpaRepository;
    @Autowired
    private MarkJpaRepository markJpaRepository;

    @Transactional
    public void addScore(int[] subjectId, float[] scores, int studentId) {
        StudentVO studentVO = POToVOUtils.studentPOToVO(studentJpaRepository.getOne(studentId));
        float scoreSum = 0;
        for (Float score : scores) {
            scoreSum += score;
        }
        //学生平均分
        studentVO.setAvgScore(scoreSum/(scores.length));
        List<MarkPO> markPOList = new ArrayList<MarkPO>();
        MarkVO markVO = new MarkVO();
        for (int i = 0; i < scores.length; i++) {
            SubjectVO subjectVO = POToVOUtils.subjectPOToVO(subjectJpaRepository.getOne(subjectId[i]));
            markVO.setScore(scores[i]);
            markVO.setStudentVO(studentVO);
            //计算科目平均分  选课人数加一
            float subjectAvgScore = (subjectVO.getAvgScore() * subjectVO.getStudentNumber() + scores[i])/(subjectVO.getStudentNumber()+1);
            subjectVO.setStudentNumber(subjectVO.getStudentNumber() + 1);
            studentVO.setAvgScore(subjectAvgScore);
            markVO.setSubjectVO(subjectVO);
            markPOList.add(VOToPOUtils.markPOVOToPO(markVO));
        }
        markJpaRepository.save(markPOList);
    }
}
