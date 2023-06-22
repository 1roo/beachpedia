package com.spring.beachpedia.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		vo.setCpp(10);
		return service.getList(vo);
	}
	
	// 블로그 작성 페이지로 이동
	@GetMapping("/blogRegister")
	public void register() {
		
	}
	
	// 블로그 등록
	@PostMapping("/blogRegister")
	public String registerBlog(BlogVO vo, MultipartFile file) {
		service.register(vo, file);
		
		return "redirect:/blog/blogList";
	}
	
	// 이미지 파일 전송
	@GetMapping("/getImg/{fileName}")
	public ResponseEntity<byte[]> getFile(@PathVariable String fileName) {
		
		log.info("filename: " + fileName);
		
		File file = new File("C:/beachpedia/upload/blog/" + fileName);
		log.info(file.toString());
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content_Type", Files.probeContentType(file.toPath()));
			headers.add("hi", "hello");
			
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
			result = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	
	// 홈화면 블로그 불러오기
	@ResponseBody
	@GetMapping("/getListHome")
	public List<BlogVO> getListHome() {
		return service.getListHome();
	}
	
	
}
