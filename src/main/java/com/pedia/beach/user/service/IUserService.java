package com.pedia.beach.user.service;

import com.pedia.beach.command.UserVO;
import com.pedia.beach.util.PageVO;

public interface IUserService {

	//아이디 중복 확인
	int idCheck(String userId);

	//회원가입
	void join(UserVO vo);

	//로그인
	String login(String userId, String userPw);
	

	//회원 정보 얻기
	UserVO getInfo(String userId, PageVO vo);

	//회원 정보 수정
	void updateUser(UserVO vo);
	
	//회원탈퇴
	void deleteUser(UserVO vo) throws Exception;



}
