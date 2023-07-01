package com.pedia.beach.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE likes(
	like_num INT DEFAULT 0,
    blog_no INT PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL
);
*/

@Setter @Getter @ToString
public class LikeVO {
	
	private int likeNum, blogNo;
	private String userId;

}
