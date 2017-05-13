package com.biz.std.controller;

import com.biz.std.service.StudentService;
import com.biz.std.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2017/5/6.
 */
@Controller
public class SubjectController {
    @Autowired
    private SubjectService subjectService;
    @Autowired
    private StudentService studentService;

    @RequestMapping("/subjectMain")
    public String subjectMain(Model model) {
        model.addAttribute("subjectVOList", subjectService.getAllSubject());

        return "subjectMain";
    }

    @RequestMapping("/addSubject")
    public String addSubject(String name) {
        subjectService.saveSubject(name);
        return "redirect:/subjectMain";
    }

    @RequestMapping("/deleteSubject")
    @ResponseBody
    public boolean deleteSubject(int id) {
        try {
            System.out.println(id);
            subjectService.deleteSubject(id);
            return true;
        } catch (Exception e) {
            System.out.println("Exception");
            return false;
        }
    }

    @RequestMapping("/updateSubject")
    @ResponseBody
    public boolean updateSubject(int id, String name) {
        subjectService.updateSubjectName(id, name);
        return true;
    }
}
