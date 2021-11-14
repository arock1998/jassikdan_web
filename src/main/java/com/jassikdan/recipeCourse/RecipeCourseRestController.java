package com.jassikdan.recipeCourse;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jassikdan.recipe.model.Recipe;
import com.jassikdan.recipeCourse.model.RecipeCourse;

@RestController
public class RecipeCourseRestController {

	//레시피 썸네일 세션에 저장
	@PostMapping("/recipe/insert")
	public Map<String, Object> recipeInsert(
//			@ModelAttribute Recipe recipe
			@RequestParam("description") String description
			, HttpServletRequest request){
		HttpSession session = request.getSession();
		//id 가져와서 재료등록
		//id 가져와서 세션에 저장
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		//저장된 recipe를 세션에 저장해둔다.
//		session.setAttribute("recipe", recipe);
		result.put("result", "success");
		return result;
	}
	
	//view에서 get으로 받은 cookingNo를 받아서 순서대로 저장하자
	@PostMapping("/recipe/insert_detail")
	public Map<String, Object> recipeInsertDetail(
			@ModelAttribute RecipeCourse recipeCourse
			, @RequestParam("cookingNo") int cookingNo
			, HttpServletRequest request){
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		//순서대로 저장
		HttpSession session = request.getSession();
		session.setAttribute("recipeCourse" + cookingNo, recipeCourse);
		
		result.put("result", "success");
		return result;
	}
	
	//세션에 저장해둔 모든 레시피 과정 등록
	@Transactional
	@PostMapping("/recipe/insert_final")
	public Map<String, Object> recipeInsertFinal(
			HttpServletRequest request ){
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		
		HttpSession session = request.getSession();
		//usedGenseratedKey
		Recipe recipe = (Recipe) session.getAttribute("recipe");
		//BO 불러서 recipe 저장 그리고 생성된 키도 불러온다.
		int recipeId = 33888888;
		
		//사용된 재료 저장
		
		int i = 1;
		while(session.getAttribute("cookingNo") != null) {
			RecipeCourse recipeCourse = (RecipeCourse) session.getAttribute("cookingNo" + i);
			i++;
			//BO로 불러서 저장!
		}
		
		result.put("result", "success");
		return result;
	}
	
	
}
