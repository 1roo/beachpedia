package com.spring.beachpedia.like.mapper;

import com.spring.beachpedia.command.LikeVO;

public interface ILikeMapper {
	
	void insertLike(LikeVO vo);
	
	void deleteLike(LikeVO vo);

}
