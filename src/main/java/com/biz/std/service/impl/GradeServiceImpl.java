package com.biz.std.service.impl;

import com.biz.std.model.GradePO;
import com.biz.std.model.StudentPO;
import com.biz.std.repository.GradeJpaRepository;
import com.biz.std.repository.StudentJpaRepository;
import com.biz.std.service.GradeService;
import com.biz.std.util.POToVOUtils;
import com.biz.std.util.VOToPOUtils;
import com.biz.std.vo.GradeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/5/6.
 */
@Service("gradeService")
public class GradeServiceImpl implements GradeService {
    @Autowired
    private GradeJpaRepository gradeJpaRepository;
    @Autowired
    private StudentJpaRepository studentJpaRepository;

    //班级不存在，存一个班级；不存在暂不处理
    public void saveGrade(String name) {
        if (gradeJpaRepository.findAllByName(name).size() == 0) {
            gradeJpaRepository.save(VOToPOUtils.gradeVoToPo(new GradeVO(name, 0, 0)));
        }
    }

    public List<GradeVO> getAllGrade() {
        List<GradePO> gradePOList = gradeJpaRepository.findAll();
        List<GradeVO> gradeVOList = new ArrayList<GradeVO>();
        for (GradePO gradePO : gradePOList) {
            gradeVOList.add(POToVOUtils.gradePOToVO(gradePO));
        }
        return gradeVOList;
    }

    public GradeVO getGrade(int id) {
        return POToVOUtils.gradePOToVO(gradeJpaRepository.findOne(id));
    }

    @Transactional
    public void deleteGrade(int id) {
        GradePO gradePO = gradeJpaRepository.findOne(id);
        List<StudentPO> studentPOList = studentJpaRepository.findAllByGradePO(gradePO);
        studentJpaRepository.delete(studentPOList);//删除班级学生
        gradeJpaRepository.delete(id);//删除班级
    }

    @Transactional
    public void updateName(int id, String name) {
        gradeJpaRepository.updateName(name, id);
    }
}
