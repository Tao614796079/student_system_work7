package com.biz.std.service;


import com.biz.std.vo.StudentVO;
import com.biz.std.vo.SubjectVO;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by Administrator on 2017/5/6.
 */
public interface StudentService {
    void saveStudent(StudentVO studentVO, Integer gradeId, MultipartFile[] myfiles, HttpServletRequest request) throws IOException;

    void updateStudent(StudentVO studentVO, Integer gradeId, Integer oldGradeId, MultipartFile[] myfiles, HttpServletRequest request) throws IOException;

    Page<StudentVO> getOnePage(int curPage, int pageSize);

    void deleteStudent(int id);

    StudentVO getStudentById(int id);

    boolean existsStudent(int id);

    List<SubjectVO> uncheckedSubject(int id);
}
