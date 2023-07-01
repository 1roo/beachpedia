package com.pedia.beach.like.mapper;

import com.pedia.beach.command.LikeVO;

public interface ILikeMapper {

		void insertLike(LikeVO vo);
		
		void deleteLike(LikeVO vo);
	
}
