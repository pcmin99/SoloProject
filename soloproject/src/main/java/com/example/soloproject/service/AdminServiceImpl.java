package com.example.soloproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.soloproject.dao.MemberLoginDAO;
import com.example.soloproject.domain.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private MemberLoginDAO memberLoginDAO ; 
    
            public List<AdminVO> adminAll() {
            List<AdminVO> adminAll = memberLoginDAO.adminAll();
            return adminAll;
        }

    
}
