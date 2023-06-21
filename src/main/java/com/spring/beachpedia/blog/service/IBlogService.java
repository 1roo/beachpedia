package com.spring.beachpedia.blog.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.beachpedia.command.BlogVO;
import com.spring.beachpedia.util.PageVO;


public interface IBlogService {

	// 글 등록
	void register(BlogVO vo, MultipartFile file);
	
	// 글 목록
	List<BlogVO> getList(PageVO paging);
	
	// 상세보기
	BlogVO getArticle(int blogNo, String userId);
	
	// 글 삭제
	void delete(int blogNo);
	
	// 홈 화면 리스트
	List<BlogVO> getListHome();
	
	
	
}
