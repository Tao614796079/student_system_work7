package com.biz.std.controller;

import com.biz.std.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * Created by Administrator on 2017/5/6.
 */
@Controller
public class GradeController {

    @Autowired
    private GradeService gradeService;

    @RequestMapping("/gradeMain")
    public String gradeMain(Model model) {
        model.addAttribute("gradeVOList", gradeService.getAllGrade());
        return "gradeMain";
    }

    @RequestMapping("/deleteGrade")
    @ResponseBody
    public boolean deleteGrade(Integer id) {
        try {
            gradeService.deleteGrade(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @RequestMapping(value = "/addGrade", method = RequestMethod.POST)
    public String toAddGrade(String name) {
        gradeService.saveGrade(name);
        return "redirect:/gradeMain";
    }

    @RequestMapping(value = "/updateGrade", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateGrade(int id, String name) {
        gradeService.updateName(id, name);
        return true;
    }
}
