package com.spring.beachpedia.command;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE users(
   user_id VARCHAR(50) PRIMARY KEY,
   user_pw VARCHAR(300) NOT NULL,
   user_name VARCHAR(50) NOT NULL,
   user_nick VARCHAR(50) NOT NULL,
   user_email1 VARCHAR(50) NOT NULL,
   user_email2 VARCHAR(50) NOT NULL,
   reg_date DATETIME DEFAULT CURRENT_TIMESTAMP
);
*/	


@Getter
@Setter
@ToString
public class UserVO {
	


	private String userId, userPw, userName, userNick, userEmail1, userEmail2;
	private LocalDateTime regDate;
	
}
