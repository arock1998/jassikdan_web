package com.jassikdan.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jassikdan.user.dao.UserDAO;
import com.jassikdan.user.model.User;

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
	}
		
	// 로그인
	public User getUserByLoginIdAndPw(String loginId, String password) {
	return userDAO.selectUserByLoginIdAndPw(loginId, password);
	}
	

	// user의 프로필정보 가지고 오기
	public User getUserById(int userId) {
		return userDAO.selectUserById(userId);
	}
	
}
