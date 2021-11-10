package com.jassikdan.recipeCourse;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jassikdan.recipe.model.Recipe;

@RestController
public class RecipeCourseRestController {

	@PostMapping("/recipe/insert")
	public Map<String, Object> recipeInsert(
			@ModelAttribute Recipe recipe
			, HttpServletRequest request){
		HttpSession session = request.getSession();
		
		//id 가져와서 재료등록
		//id 가져와서 세션에 저장
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		
		
		
		
		
		
		
		
		result.put("result", "success");
		return result;
	}
}
