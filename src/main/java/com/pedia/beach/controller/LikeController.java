package com.pedia.beach.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pedia.beach.command.LikeVO;
import com.pedia.beach.like.service.ILikeService;

@RestController
@RequestMapping("/insertLike")
public class LikeController {
	
	@Autowired
	private ILikeService service;
	
	@PostMapping("/like")
	public String insertLike(@RequestBody LikeVO vo) {
		service.insertLike(vo);
		
		return "success";
	}

	
	@PostMapping("deleteLike")
	public String deleteLike(@RequestBody LikeVO vo) {
		service.deleteLike(vo);
		
		return "success";
	}
	
}
