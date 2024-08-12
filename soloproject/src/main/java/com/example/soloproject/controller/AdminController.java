package com.example.soloproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.soloproject.domain.AdminVO;
import com.example.soloproject.service.AdminService;

@Controller
public class AdminController {


    @Autowired
    private AdminService adminService ;



    @GetMapping("/admins/onecolumn")
    public String AdminPage(Model model) {
        List<AdminVO> UserList = adminService.adminAll();
        model.addAttribute("UserList",UserList);
        return "admins/onecolumn";
    }

    

}