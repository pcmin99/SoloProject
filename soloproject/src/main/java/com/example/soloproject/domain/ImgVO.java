package com.example.soloproject.domain;

import lombok.Data;

@Data
public class ImgVO {
    
    private int imgfile_id ; 
    private String imgfile_name ; 
    private String imgfile_real_name ; 
    private String imgLength ; 
    private String imgSize ; 
    private String imgWidth ; 
    private String img_path;
    
    private int posts_id ;  // post id


}
