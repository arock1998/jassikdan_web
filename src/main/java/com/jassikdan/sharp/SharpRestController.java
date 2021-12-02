package com.jassikdan.sharp;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jassikdan.sharp.bo.SharpBO;

@RestController
public class SharpRestController {
	
	@Autowired
	private SharpBO sharpBO;
	
	//샾 키워드 추가
	@RequestMapping("/sharp/insert")
	public Map<String, Object> sharp( 
			@RequestParam ("keyword") String keyword
			, HttpServletRequest request ){
		HttpSession session = request.getSession();
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "error");
		
		Integer userId = (Integer) session.getAttribute("userId");
		sharpBO.insertSharp(userId, keyword);
		
		result.put("result", "success");
		return result;
	}
	
}
