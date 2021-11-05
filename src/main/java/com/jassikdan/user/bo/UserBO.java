package com.jassikdan.user.bo;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jassikdan.user.dao.UserDAO;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;

	// 아이디 중복확인
	public boolean loginIdIsDupliated(String loginId) {
		return userDAO.loginIdIsDupliated(loginId);
	}
	
	// 회원가입
	public void insertUser(String loginId, String password, String name, String birth, String gender, String email,
			String profileImage) {
		userDAO.insertUser(loginId, password, name, birth, gender, email, profileImage);
	}}
