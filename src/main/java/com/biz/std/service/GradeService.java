package com.biz.std.service;

import com.biz.std.model.GradePO;
import com.biz.std.vo.GradeVO;

import java.util.List;


/**
 * Created by Administrator on 2017/5/6.
 */
public interface GradeService {
    void saveGrade(String name);

    List<GradeVO> getAllGrade();

    GradeVO getGrade(int id);

    void deleteGrade(int id);

    void updateName(int id, String name);
}
