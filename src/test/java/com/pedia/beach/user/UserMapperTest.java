package com.pedia.beach.user;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.pedia.beach.command.UserVO;
import com.pedia.beach.user.mapper.IUserMapper;

import lombok.extern.slf4j.Slf4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/config/db-config.xml"})
@Slf4j
public class UserMapperTest {


	@Autowired
	private IUserMapper mapper;


	@Test
	@DisplayName("회원가입을 진행했을 때 회원가입에 성공해야 한다.")
	void joinTest() {
		UserVO vo = new UserVO();
		vo.setUserId("abc1234");
		vo.setUserPw("aaa1111!");
		vo.setUserName("홍길동");
		vo.setUserEmail1("abc1234");
		vo.setUserEmail2("gmail.com");

		mapper.join(vo);
	}


	@Test
	@DisplayName("존재하는 회원 아이디를 조회했을 때 1이 리턴돼야 한다.")
	void idCheckTest() {
		String userId = "abc1234";
		
		assertEquals(1, mapper.idCheck(userId));
	}

	
	@Test
	@DisplayName("올바른 아이디를 주면 DB의 비밀번호가 리턴돼야 한다.")
	void loginTest() {
		String userId = "abc1234";
		
		assertNotNull(mapper.login(userId));
	}


}
