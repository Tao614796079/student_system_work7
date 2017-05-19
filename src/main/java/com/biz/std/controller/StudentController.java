package com.biz.std.controller;

import com.biz.std.service.GradeService;
import com.biz.std.service.StudentService;
import com.biz.std.service.SubjectService;
import com.biz.std.vo.StudentVO;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Administrator on 2017/5/5.
 */
@Controller
public class StudentController {
    private static final int PAGESIZE = 5;
    @Autowired
    private StudentService studentService;
    @Autowired
    private GradeService gradeService;
    @Autowired
    private SubjectService subjectService;

    @RequestMapping("/studentMain")
    public String list(Model model, int curPage) {
        Page<StudentVO> page = studentService.getOnePage(curPage - 1, PAGESIZE);
        model.addAttribute("curPage", curPage);
        model.addAttribute("totalPage", studentService.getTotalPage(PAGESIZE));
        model.addAttribute("subjectVOList", subjectService.getAllSubject());
        model.addAttribute("studentVOList", page.getContent());
        model.addAttribute("gradeVOList", gradeService.getAllGrade());
        return "studentMain";
    }

    @RequestMapping(value = "addStudent", method = RequestMethod.POST)
    public String addStudent(StudentVO studentVO, Integer gradeId, @RequestParam MultipartFile[] myfiles, HttpServletRequest request) throws IOException {
        //学号已存在则不存信息
        if (!studentService.existsStudent(studentVO.getId())) {
            studentService.saveStudent(studentVO, gradeId, myfiles, request);
        }
        return "redirect:/studentMain?curPage=1";
    }

    @RequestMapping("/deleteStudent")
    public String deleteStudent(Integer id) {
        studentService.deleteStudent(id);
        return "redirect:/studentMain?curPage=1";
    }

    @RequestMapping("/addSubjectAndScoreToStudent")
    @ResponseBody
    public Boolean addSubjectAndScoreToStudent(int studentId, String subjects, String scores) {
        subjectService.addSubject(studentId, subjects, scores);
        return true;
    }

    @RequestMapping("/goUpdateStudentForm")
    public String goUpdateStudentForm(int id, Model model) {
        model.addAttribute("studentVO", studentService.getStudentById(id));
        model.addAttribute("gradeVOList", gradeService.getAllGrade());
        return "studentUpdateForm";
    }

    @RequestMapping("/updateStudentForm")
    public String updateStudentForm(StudentVO studentVO, Integer gradeId, Integer oldGradeId, @RequestParam MultipartFile[] myfiles, HttpServletRequest request) throws IOException {
        studentService.updateStudent(studentVO, gradeId, oldGradeId, myfiles, request);
        return "redirect:/studentMain?curPage=1";
    }

    @RequestMapping("/goAddSubjectAndScoreForm")
    public String goAddSubjectAndScoreForm(int id, Model model) {
        model.addAttribute("uncheckedSubjectList", studentService.uncheckedSubject(id));
        model.addAttribute("studentId", id);
        return "addSubjectAndScoreForm";
    }
}
