package com.spring.beachpedia.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class LikeVO {
	
	private int likeNo, blogNo;
	private String userId;

}
