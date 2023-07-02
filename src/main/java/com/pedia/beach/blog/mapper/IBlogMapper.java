package com.pedia.beach.blog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pedia.beach.command.BlogVO;
import com.pedia.beach.util.PageVO;

public interface IBlogMapper {

	//블로그 등록
	void regist(BlogVO vo);
	
	//블로그 목록
	List<BlogVO> getList(PageVO vo);
	
	//블로그 상세보기
	BlogVO getArticle(@Param("blogNO") int blogNo);
	
	//블로그 수정
	void update(BlogVO vo);
	
	//블로그 삭제
	void delete(int blogNo);
	
	
	//홈 리스트
	List<BlogVO> getListHome();

	//총 게시물 수 구하기
	int getTotal(PageVO vo);
	
	
}
