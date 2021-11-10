package com.jassikdan.recipeCourse;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jassikdan.ingrdIhave.bo.IngrdIhaveBO;
import com.jassikdan.ingrdIhave.model.IngrdIhave;
import com.jassikdan.recipeCourse.bo.RecipeCourseBO;
import com.jassikdan.recipeCourse.model.RecipeCourse;
import com.jassikdan.recipeIngrd.bo.RecipeIngrdBO;
import com.jassikdan.recipeIngrd.model.RecipeIngrd;

@Controller
public class RecipeCourseController {
	//다른 controller로 이동해야 할 것 같다. 
	
	@Autowired
	private RecipeCourseBO recipeCourseBO;
	@Autowired
	private RecipeIngrdBO recipeIngrdBO;
	@Autowired
	private IngrdIhaveBO ingrdIhaveBO;

	/**
	 * 레시피 과정정보 가져오기
	 * @param model
	 * @param recipeId
	 * @param cookingNo
	 * @return
	 */
	@GetMapping("/recipe/detail_view")
	public String recipeCourseDetailView(Model model
			, @RequestParam("recipeId") int recipeId
			, @RequestParam(value="cookingNo", defaultValue="1") int cookingNo
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		//레시피 과정 가져오기
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
		
		//레시피에 필요한 재료 목록 가져오기
		List<RecipeIngrd> recipeIngrdList = recipeIngrdBO.getRecipeIngrdById(recipeId);
		model.addAttribute("recipeIngrdList", recipeIngrdList);
		List<IngrdIhave> ingrdIhaveList = ingrdIhaveBO.getIngrdIhaveByUserId(userId);
		
		//내가 가지고 있는 재료인지 확인하기 
		//TODO : 재료 남은량을 확인하지 않았다.
		model.addAttribute("isEnough", true);
		for(RecipeIngrd item : recipeIngrdList) {
			int ingrdId = item.getIngrdId();
			boolean isEnough = false;
			for(IngrdIhave item2 : ingrdIhaveList) {
				if(item2.getIngrdId() == ingrdId) {
					isEnough = true;
					break;
				}
			}
			if(isEnough == false) {
				model.addAttribute("isEnough", false);
				break;
			}
		}
		model.addAttribute("viewName", "recipe/detail");
		return "template/layout";
	}

	//레시피 썸네일 등록
	@RequestMapping("/recipe/insert_view")
	public String recipeInsertView(Model model) {
		model.addAttribute("viewName", "recipe/insert");
		return "template/layout";
	}
	
	//
	@GetMapping("/recipe/insert_detail_view")
	public String recipeInsertDetailView(
			@RequestParam("cookingNo") int cookingNo
			, Model model
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
			model.addAttribute("cookingNo", cookingNo);
		return "template/layout";
	}
	
	
	
}
