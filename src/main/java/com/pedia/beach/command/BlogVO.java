package com.pedia.beach.command;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/*
CREATE TABLE blogs (
    blog_no INT PRIMARY KEY AUTO_INCREMENT,
    beach_no INT NOT NULL,
    writer VARCHAR(50) NOT NULL,
    comment VARCHAR(600) NOT NULL,
    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME DEFAULT NULL,
    upload_path VARCHAR(50),
    file_name VARCHAR(200) NOT NULL,
    view_num INT DEFAULT 0,
    like_num INT DEFAULT 0
);
*/


@Getter @Setter @ToString
public class BlogVO {
	
	private int blogNo, beachNo, viewNum, likeNum;
	private String writer, comment, uploadPath, fileName;
	private LocalDateTime regDate, updateDate;
	
	
	

}
