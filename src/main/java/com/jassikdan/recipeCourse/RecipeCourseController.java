package com.jassikdan.recipeCourse;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jassikdan.recipeCourse.bo.RecipeCourseBO;
import com.jassikdan.recipeCourse.model.RecipeCourse;

@Controller
public class RecipeCourseController {
	
	@Autowired
	private RecipeCourseBO recipeCourseBO;

	/**
	 * 레시피 과정정보 가져오기
	 * @param model
	 * @param recipeId
	 * @param cookingNo
	 * @return
	 */
	@GetMapping("/recipe_course/detail_view")
	public String recipeCourseDetailView(Model model
			, @RequestParam("recipeId") int recipeId
			, @RequestParam(value="cookingNo", defaultValue="1") int cookingNo) {
		
		List<RecipeCourse> courseList =  recipeCourseBO.getRecipeCourseByRecipeId(recipeId);
		if(0 < cookingNo && cookingNo - 1 <= courseList.size()) {
			model.addAttribute("course", courseList.get(cookingNo-1));
		} else if(cookingNo - 1 > courseList.size()) {
			model.addAttribute("course", courseList.get(courseList.size()));
		} else {
			model.addAttribute("course", courseList.get(0));
		}
		model.addAttribute("count", courseList.size());
		model.addAttribute("cookingNo", cookingNo);
		model.addAttribute("recipeId", recipeId);
		model.addAttribute("viewName", "recipe/detail");
		return "template/layout";
	}
}
