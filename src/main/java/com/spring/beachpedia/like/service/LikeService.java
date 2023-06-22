package com.spring.beachpedia.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.beachpedia.command.LikeVO;
import com.spring.beachpedia.like.mapper.ILikeMapper;

@Service
public class LikeService implements ILikeService {
	
	@Autowired
	private ILikeMapper mapper;

	@Override
	public void insertLike(LikeVO vo) {
		mapper.insertLike(vo);
	}

	@Override
	public void deleteLike(LikeVO vo) {
		mapper.deleteLike(vo);
	}

}
