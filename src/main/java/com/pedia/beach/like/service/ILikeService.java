package com.pedia.beach.like.service;

import com.pedia.beach.command.LikeVO;

public interface ILikeService {
	
	void insertLike(LikeVO vo);
	
	void deleteLike(LikeVO vo);

}
