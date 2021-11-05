package com.jassikdan.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jassikdan.common.EncryptUtils;
import com.jassikdan.user.bo.UserBO;

@RestController
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	/**
	 * 아이디 중복확인
	 * @param loginId
	 * @return
	 */
	@PostMapping("/user/is_duplicated")
	public Map<String, Boolean> idDuplicated(
			@RequestParam("loginId") String loginId){
		Map<String, Boolean> result = new HashMap<>();
			result.put("result", userBO.loginIdIsDupliated(loginId));
		return result;
	}
	
	/**
	 * 회원가입
	 * @param loginId
	 * @param password
	 * @param name
	 * @param birth
	 * @param gender
	 * @param email
	 * @param profileImage
	 * @return
	 */
	@PostMapping("/user/sign_up")
	public Map<String, Object> userSignUp(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("birth") String birth
			, @RequestParam("gender") String gender
			, @RequestParam("email") String email
			, @RequestParam( value="profileImage", required=false,  defaultValue ="") String profileImage
			, HttpServletRequest request
			){
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		
		//비밀번호 변환
		String encryptPassword = EncryptUtils.md5(password);
		userBO.insertUser(loginId, encryptPassword, name, birth, gender, email, profileImage);
		
		result.put("result", "success"); 
		return result;
	}

}
