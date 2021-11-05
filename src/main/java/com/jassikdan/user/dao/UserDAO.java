package com.jassikdan.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jassikdan.user.model.User;

@Repository
public interface UserDAO {
	
	//아이디 중복확인
	public boolean loginIdIsDupliated(String loginId);
	
	//회원가입
	public void insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("birth") String birth
			, @Param("gender") String gender
			, @Param("email") String email
			, @Param("profileImage") String profileImage
			);
	
	//로그인
	public User selectUserByLoginIdAndPw(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
	//user정보 가져오기
	public User selectUserById(int userId);

}
