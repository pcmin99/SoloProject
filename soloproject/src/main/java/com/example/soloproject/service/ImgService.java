package com.example.soloproject.service;

import com.example.soloproject.domain.ImgVO;

public interface  ImgService {
    public void     postInsertImg(ImgVO vo);

    public int     selectNum();
}
