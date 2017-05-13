package com.biz.std.repository;

import com.biz.std.model.SubjectPO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/5/6.
 */
@Repository
public interface SubjectJpaRepository extends JpaRepository<SubjectPO, Integer>{
    List<SubjectPO> findAllByName(String name);
    @Modifying
    @Query("update SubjectPO s set s.name=?1 where s.id=?2")
    void updateName(String name, Integer id);
}
