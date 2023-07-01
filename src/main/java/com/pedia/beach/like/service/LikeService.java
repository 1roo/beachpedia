package com.pedia.beach.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pedia.beach.command.LikeVO;
import com.pedia.beach.like.mapper.ILikeMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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
