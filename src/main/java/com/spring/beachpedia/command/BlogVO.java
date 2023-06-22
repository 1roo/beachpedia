package com.spring.beachpedia.command;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
	CREATE TABLE blogs (
	    blog_no INT PRIMARY KEY AUTO_INCREMENT,
		beach_code INT NOT NULL,
	    writer VARCHAR(50) NOT NULL,
	    title VARCHAR(100) NOT NULL,
	    content VARCHAR(3000) NOT NULL,
	    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	    file_name VARCHAR(200) NOT NULL,
	    upload_path VARCHAR(50),
	    like_count INT DEFAULT 0
	);
*/



@Getter @Setter
@ToString
public class BlogVO {
	
	private int blogNo, beachCode, likeCount;
	private String writer, title, content, fileName, uploadPath;
	private LocalDateTime regDate;

}
