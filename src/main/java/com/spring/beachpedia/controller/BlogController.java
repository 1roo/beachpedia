package com.spring.beachpedia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.beachpedia.blog.service.IBlogService;
import com.spring.beachpedia.command.BlogVO;
import com.spring.beachpedia.util.PageVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/blog")
public class BlogController {

	@Autowired
	private IBlogService service;
	
	// 글 목록 가져오기
	@ResponseBody
	@GetMapping("/blogList/{page}")
	public List<BlogVO> blogList(@PathVariable int page) {
		System.out.println(page);
		PageVO vo = new PageVO();
		vo.setPageNum(page);
	}
	
	
	
}
