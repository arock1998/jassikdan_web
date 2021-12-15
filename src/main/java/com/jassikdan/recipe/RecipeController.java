package com.jassikdan.recipe;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jassikdan.recipe.bo.RecipeBO;
import com.jassikdan.recipe.model.Recipe;
import com.jassikdan.recipeCourse.bo.RecipeCourseBO;
import com.jassikdan.recipeCourse.model.RecipeCourse;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeBO recipeBO;
	@Autowired
	private RecipeCourseBO recipeCourseBO;

	/**
	 * 레시피 등록 화면
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/recipe/create_view") 
	public String recipeCreateView(Model model
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		if(userId == null) {
			return "recirect:/user/sign_in_view";
		}
		model.addAttribute("viewName", "recipe/insert");
		return "template/layout";
	}

	//레시피 디테일 화면
	@RequestMapping("/recipe/detail_view")
	public String recipeCourseDetailView(
			@RequestParam(value="recipeId", defaultValue="0") Integer recipeId
			, Model model) {
		model.addAttribute("isNull", false);
		model.addAttribute("viewName", "recipe/detail");
		if(recipeId <= 0) {
			model.addAttribute("isNull", true);
			return "template/layout";
		}
		
		Recipe recipe = recipeBO.getRecipeById(recipeId);
		if(recipe == null) {
			model.addAttribute("isNull", true);
			return "template/layout";
		}
		model.addAttribute("recipe", recipe);
		List<RecipeCourse> courseList = recipeCourseBO.getRecipeCourseByRecipeId(recipeId);
		model.addAttribute("courseList", courseList);
	
		return "template/layout";
	}
}
