package com.jassikdan.user.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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

}
