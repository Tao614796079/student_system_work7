package com.biz.std.repository;

import com.biz.std.model.GradePO;
import com.biz.std.model.StudentPO;
import com.biz.std.model.SubjectPO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/5/6.
 */
@Repository
public interface StudentJpaRepository extends JpaRepository<StudentPO, Integer>{
    List<StudentPO> findAllByGradePO(GradePO gradePO);
}
