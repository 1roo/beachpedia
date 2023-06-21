package com.spring.beachpedia.blog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.beachpedia.command.BlogVO;
import com.spring.beachpedia.util.PageVO;

public interface IBlogMapper {

	// 글 등록
	void regist(BlogVO vo);
	
	// 글 목록
	List<BlogVO> getList(PageVO vo);
	
	// 상세보기
	BlogVO getArticle(@Param("blogNO") int blogNo, @Param("userId") String userId);
	
	// 글 삭제
	void delete (int blogNo);
	
	// 홈화면 리스트
	List<BlogVO> getListHome();
	
}
