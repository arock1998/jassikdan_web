package com.jassikdan.recipeLike;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jassikdan.recipeLike.bo.RecipeLikeBO;

@RestController
public class RecipeLikeRestController {
	
	@Autowired
	private RecipeLikeBO recipeLikeBO;
	
	/**
	 * 좋아요 클릭
	 * @param recipeId
	 * @param request
	 * @return
	 */
	@PostMapping("/recipe_like/create")
	public Map<String, Object> recipeLikeCreate(
			@RequestParam("recipeId") int recipeId
			, HttpServletRequest request){
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		
		recipeLikeBO.insertRecipeLike(userId, recipeId);
		result.put("result", "success");
		return result;
	}
	
	/**
	 * 좋아요 해제
	 * @param recipeId
	 * @param request
	 * @return
	 */
	@PostMapping("/recipe_like/delete")
	public Map<String, Object> recipeLikeDelete(
			@RequestParam("recipeId") int recipeId
			, HttpServletRequest request){
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		
		recipeLikeBO.deleteRecipeLike(userId, recipeId);
		result.put("result", "success");
		return result;
	}

}
