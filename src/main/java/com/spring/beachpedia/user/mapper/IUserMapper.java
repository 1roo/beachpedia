package com.spring.beachpedia.user.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.beachpedia.command.UserVO;
import com.spring.beachpedia.util.PageVO;

public interface IUserMapper {

	// 아이디 중복 확인
	int idCheck(String userId);

	// 회원 가입
	void join(UserVO vo);

	// 로그인
	String login(String userId);

	// 회원정보 얻기
	UserVO getInfo(@Param("userId") String userId, @Param("paging") PageVO vo);

	// 회원 닉네임 수정
	void updateUserNick(UserVO vo);
	
	// 회원삭제
	void deleteUser(UserVO vo);
	
	// 유저정보 가져오기
	UserVO getUser(String userId);

	

}
