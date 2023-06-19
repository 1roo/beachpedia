package com.spring.beachpedia.user.service;

import org.springframework.stereotype.Service;

import com.spring.beachpedia.command.UserVO;
import com.spring.beachpedia.util.PageVO;

@Service
public interface IUserService {
	
	//아이디 중복 확인
	int idCheck(String userId);
	
	//회원가입
	void join(UserVO vo);
	
	//로그인
	UserVO login(String userId, String userPw);


	//회원 정보 얻기
	UserVO getInfo(String userId, PageVO vo);

	//회원 정보 수정
	void updateUser(UserVO vo);
	
	//회원탈퇴
	void deleteUser(UserVO vo) throws Exception;
	
	
	
}
