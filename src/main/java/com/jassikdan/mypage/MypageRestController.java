package com.jassikdan.mypage;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jassikdan.mypage.bo.ContentBO;

@RestController
public class MypageRestController {
	
	@Autowired
	private ContentBO contentBO;
	
	//레시피 선택으로 냉장고속 재료 사용
	@RequestMapping("/mypage/use_recipe")
	public Map<String, Object> mypageUseRecipe(
			@RequestParam("recipeId") int recipeId
			, HttpServletRequest request
			){
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		contentBO.useRecipe(userId, recipeId);
		
		result.put("result", "success");
		return result;
	}
	
	
	
	
	
}
