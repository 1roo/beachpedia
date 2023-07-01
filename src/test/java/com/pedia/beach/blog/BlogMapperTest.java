package com.pedia.beach.blog;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.pedia.beach.blog.mapper.IBlogMapper;
import com.pedia.beach.command.BlogVO;

import lombok.extern.slf4j.Slf4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/config/db-config.xml"})
@Slf4j
public class BlogMapperTest {
	
	@Autowired
	private IBlogMapper mapper;
	
	@Test
	@DisplayName("블로그 글 등록하기")
	void registTest() {
		for(int i=1; i<11; i++) {
			BlogVO vo = new BlogVO();
			vo.setWriter("길동이"+ i);
			vo.setBeachNo(i);
			vo.setComment("봉포해수욕장 좋았어요" + i);
			vo.setFileName("파일명" + i);
			
			mapper.regist(vo);
		}
	}
	
	
	
}
