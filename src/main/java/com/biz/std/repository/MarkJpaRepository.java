package com.biz.std.repository;

import com.biz.std.model.MarkPO;
import com.biz.std.model.StudentPO;
import com.biz.std.model.SubjectPO;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2017/5/8.
 */
@Repository
public interface MarkJpaRepository extends JpaRepository<MarkPO, Integer> {
    List<MarkPO> findAllByStudentPO(StudentPO studentPO);
    MarkPO findByStudentPOAndAndSubjectPO(StudentPO studentPO, SubjectPO subjectPO);
}
