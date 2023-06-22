package com.spring.beachpedia.like.service;

import com.spring.beachpedia.command.LikeVO;

public interface ILikeService {
	
	void insertLike(LikeVO vo);
	
	void deleteLike(LikeVO vo);

}
