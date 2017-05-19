package com.biz.std.repository;

import com.biz.std.model.GradePO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/5/6.
 */
@Repository
public interface GradeJpaRepository extends JpaRepository<GradePO, Integer> {
    @Modifying
    @Query("update GradePO g set g.studentNumber=?1,g.avgScore=?2 where g.id = ?3")
    void updateStudentNumberAndAvgScore(Integer studentNumber, Float avgScore, Integer id);

    @Modifying
    @Query("update GradePO g set g.name=?1 where g.id=?2")
    void updateName(String name, Integer id);

    List<GradePO> findAllByName(String name);
}
