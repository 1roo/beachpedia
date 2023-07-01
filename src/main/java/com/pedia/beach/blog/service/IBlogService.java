package com.pedia.beach.blog.service;

import com.pedia.beach.command.BlogVO;
import com.pedia.beach.util.PageVO;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface IBlogService {

	//글 등록
	void register(BlogVO vo, MultipartFile file);
	
	//글 목록
	List<BlogVO> getList(PageVO paging);
	
	//상세보기
	BlogVO getArticle(int blogNo, String userId);
	
	//수정
	void update(BlogVO vo);
	
	//삭제
	void delete(int blogNo);
	
	//홈화면 리스트
	List<BlogVO> getListHome();
	
}
