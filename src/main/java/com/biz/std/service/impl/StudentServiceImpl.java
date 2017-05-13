package com.biz.std.service.impl;

import com.biz.std.model.GradePO;
import com.biz.std.model.MarkPO;
import com.biz.std.model.StudentPO;
import com.biz.std.model.SubjectPO;
import com.biz.std.repository.GradeJpaRepository;
import com.biz.std.repository.MarkJpaRepository;
import com.biz.std.repository.StudentJpaRepository;
import com.biz.std.repository.SubjectJpaRepository;
import com.biz.std.service.StudentService;
import com.biz.std.util.POToVOUtils;
import com.biz.std.util.VOToPOUtils;
import com.biz.std.vo.GradeVO;
import com.biz.std.vo.MarkVO;
import com.biz.std.vo.StudentVO;
import com.biz.std.vo.SubjectVO;
import java.util.Iterator;
import net.sf.json.JSONArray;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/5/6.
 */
@Service("studentService")
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentJpaRepository studentJpaRepository;
    @Autowired
    private GradeJpaRepository gradeJpaRepository;
    @Autowired
    private SubjectJpaRepository subjectJpaRepository;
    @Autowired
    private MarkJpaRepository markJpaRepository;

    @Transactional
    public void saveStudent(StudentVO studentVO, Integer gradeId, MultipartFile[] myfiles, HttpServletRequest request) throws IOException {
        //上传
        for (MultipartFile myfile : myfiles) {
            if (myfile.isEmpty()) {
                System.out.println("文件未上传");
            } else {
                //如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\WEB-INF\\upload\\img文件夹中
                String realPath = request.getSession().getServletContext().getRealPath("/upload/img");
                studentVO.setImageUrl("/upload/img/" + myfile.getOriginalFilename());
                //这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
                FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, myfile.getOriginalFilename()));
            }
        }
        GradeVO gradeVO = POToVOUtils.gradePOToVO(gradeJpaRepository.findOne(gradeId));
        studentVO.setGradeVO(gradeVO);
        int newStudentNumber = gradeVO.getStudentNumber() + 1;
        float newAvgScore = (gradeVO.getAvgScore() * gradeVO.getStudentNumber() + studentVO.getAvgScore()) / newStudentNumber;
        gradeJpaRepository.updateStudentNumberAndAvgScore(newStudentNumber, newAvgScore, gradeId);//更新班级人数和平均分
        studentJpaRepository.save(VOToPOUtils.studentVOToPO(studentVO)); //存学生
    }

    @Transactional
    public void updateStudent(StudentVO studentVO, Integer gradeId, Integer oldGradeId, MultipartFile[] myfiles, HttpServletRequest request) throws IOException {
        //班级发生改变，需要修改原来班级的信息
        studentVO.setSubjectVOList(POToVOUtils.subjectVOListPOToVO(studentJpaRepository.getOne(studentVO.getId()).getSubjectPOList()));
        if (gradeId != oldGradeId) {
            GradePO gradePO = gradeJpaRepository.getOne(oldGradeId);
            int newStudentNumber = gradePO.getStudentNumber() - 1;
            float newAvgScore;
            if (newStudentNumber == 0) {
                newAvgScore = 0;
            } else {
                newAvgScore = (gradePO.getAvgScore() * gradePO.getStudentNumber() - studentVO.getAvgScore()) / newStudentNumber;
            }
            gradeJpaRepository.updateStudentNumberAndAvgScore(newStudentNumber, newAvgScore, gradePO.getId());//更新grade的学生人数和平均分
        }
        saveStudent(studentVO, gradeId, myfiles, request);
    }

    public Page<StudentVO> getOnePage(int curPage, int pageSize) {
        Page<StudentPO> studentPOPage = studentJpaRepository.findAll(new PageRequest(curPage, pageSize));

        List<StudentVO> studentVOList = new ArrayList<StudentVO>();
        for (StudentPO studentPO : studentPOPage) {
            studentVOList.add(POToVOUtils.studentPOToVO(studentPO));
        }
        Page<StudentVO> studentVOPage = new PageImpl<StudentVO>(studentVOList);
        return studentVOPage;
    }

    @Transactional
    public void deleteStudent(int id) {
        StudentPO studentPO = studentJpaRepository.findOne(id);
        System.out.println(studentPO);
        GradePO gradePO = studentPO.getGradePO();
        int newGradeStudentNumber = gradePO.getStudentNumber() - 1;
        float newGradeAvgScore;
        if (newGradeStudentNumber == 0) {
            newGradeAvgScore = 0;
        } else {
            newGradeAvgScore = (gradePO.getAvgScore() * gradePO.getStudentNumber() - studentPO.getAvgScore()) / newGradeStudentNumber;
        }
        for (SubjectPO subjectPO : studentPO.getSubjectPOList()) {
            subjectPO.setStudentNumber(subjectPO.getStudentNumber() - 1);
            //修改课程平均分
            float newSubjectAvgScore = 0;
            if (subjectPO.getStudentNumber() - 1 > 0) {
                float subjectScore = markJpaRepository.findByStudentPOAndAndSubjectPO(studentPO, subjectPO).getScore();
                newSubjectAvgScore = (subjectPO.getAvgScore() * subjectPO.getStudentNumber() - subjectScore) / (subjectPO.getStudentNumber() - 1);
            }
            subjectPO.setAvgScore(newSubjectAvgScore);
        }
        //删除该学生所有课程成绩
        markJpaRepository.delete(markJpaRepository.findAllByStudentPO(studentPO));

        //        System.out.println(studentPO);
        subjectJpaRepository.save(studentPO.getSubjectPOList());//更新选课人数
        gradeJpaRepository.updateStudentNumberAndAvgScore(newGradeStudentNumber, newGradeAvgScore, gradePO.getId());//更新grade的学生人数和平均分
        studentJpaRepository.delete(id);//删除学生
    }

    public StudentVO getStudentById(int id) {
        return POToVOUtils.studentPOToVO(studentJpaRepository.findOne(id));
    }

    public boolean existsStudent(int id) {
        return studentJpaRepository.exists(id);
    }

    public List<SubjectVO> uncheckedSubject(int id) {
        List<SubjectVO> checkedSubject = POToVOUtils.subjectVOListPOToVO(studentJpaRepository.findOne(id).getSubjectPOList());
        List<SubjectVO> allSubject = POToVOUtils.subjectVOListPOToVO(subjectJpaRepository.findAll());
        Iterator<SubjectVO> it = allSubject.iterator();
        while (it.hasNext()) {
            SubjectVO subjectVO = it.next();
            for (SubjectVO subjectVO2 : checkedSubject) {
                if (subjectVO.getId() == subjectVO2.getId()) {
                    System.out.println("equals");
                    it.remove();
                }
            }
        }
        return allSubject;
    }
}
