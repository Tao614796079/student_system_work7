package com.biz.std.controller;

import com.biz.std.service.MarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Administrator on 2017/5/9.
 */
@Controller
public class MarkController {
    @Autowired
    private MarkService markService;

    @RequestMapping(value = "/addScore", method = RequestMethod.POST)
    public String addScore(float[] scores, int[] subjectId, int studentId) {
        markService.addScore(subjectId, scores, studentId);
        return "redirect:/studentMain";
    }
}
