package com.jassikdan.recipeCourse;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jassikdan.recipeCourse.bo.RecipeCourseBO;
import com.jassikdan.recipeCourse.model.RecipeCourse;

@Controller
public class RecipeCourseController {

	

	/*삭제예정	*//**
			 * 레시피 과정정보 가져오기
			 * @param model
			 * @param recipeId
			 * @param cookingNo
			 * @return
			 *//* --> 여기서 cookingNo를 따로 파라미터로 받아서 사용했었다. 좋지 않은 방법인 것 같아서 파기
				 * @GetMapping("/recipe/detail_view") public String recipeCourseDetailView(Model
				 * model , @RequestParam("recipeId") int recipeId
				 * , @RequestParam(value="cookingNo", defaultValue="1") int cookingNo ,
				 * HttpServletRequest request) { HttpSession session = request.getSession();
				 * Integer userId = (Integer) session.getAttribute("userId");
				 * 
				 * //레시피 과정 가져오기 List<RecipeCourse> courseList =
				 * recipeCourseBO.getRecipeCourseByRecipeId(recipeId); if(0 < cookingNo &&
				 * cookingNo - 1 <= courseList.size()) { model.addAttribute("course",
				 * courseList.get(cookingNo-1)); } else if(cookingNo - 1 > courseList.size()) {
				 * model.addAttribute("course", courseList.get(courseList.size())); } else {
				 * model.addAttribute("course", courseList.get(0)); }
				 * model.addAttribute("count", courseList.size());
				 * model.addAttribute("cookingNo", cookingNo); model.addAttribute("recipeId",
				 * recipeId);
				 * 
				 * //레시피에 필요한 재료 목록 가져오기 List<RecipeIngrd> recipeIngrdList =
				 * recipeIngrdBO.getRecipeIngrdById(recipeId);
				 * model.addAttribute("recipeIngrdList", recipeIngrdList); List<IngrdIhave>
				 * ingrdIhaveList = ingrdIhaveBO.getIngrdIhaveByUserId(userId);
				 * 
				 * //내가 가지고 있는 재료인지 확인하기 //TODO : 재료 남은량을 확인하지 않았다.
				 * model.addAttribute("isEnough", true); for(RecipeIngrd item : recipeIngrdList)
				 * { int ingrdId = item.getIngrdId(); boolean isEnough = false; for(IngrdIhave
				 * item2 : ingrdIhaveList) { if(item2.getIngrdId() == ingrdId) { isEnough =
				 * true; break; } } if(isEnough == false) { model.addAttribute("isEnough",
				 * false); break; } } model.addAttribute("viewName", "recipe/detail"); return
				 * "template/layout"; }
				 * 
				 * //레시피 썸네일 등록
				 * 
				 * @RequestMapping("/recipe/create_view") public String recipeInsertView(Model
				 * model , HttpServletRequest request) { HttpSession session =
				 * request.getSession(); Integer userId = (Integer)
				 * session.getAttribute("userId"); if(userId == null) { return
				 * "redirect:/user/sign_in_view"; } model.addAttribute("viewName",
				 * "recipe/insert"); return "template/layout"; }
				 * 
				 * //레시피 조리과정을 등록 순서 별로 보여주는 뷰
				 * 
				 * @GetMapping("/recipe/create_detail_view") public String
				 * recipeInsertDetailView(
				 * 
				 * @RequestParam("cookingNo") int cookingNo , Model model , HttpServletRequest
				 * request) { HttpSession session = request.getSession(); Integer userId =
				 * (Integer) session.getAttribute("userId"); if(userId == null) { return
				 * "redirect:/user/sign_in_view"; } if
				 * ((RecipeCourse)session.getAttribute("recipeCourse"+ cookingNo) != null) {
				 * //순서에 해당하는 조리과정을 등록하고 있었다면 등록하던 것을 보여준다. RecipeCourse recipeCourse =
				 * (RecipeCourse) session.getAttribute("recipeCourse"+ cookingNo);
				 * model.addAttribute("recipeCourse", recipeCourse); }
				 * model.addAttribute("cookingNo", cookingNo); model.addAttribute("viewName",
				 * "recipe/insert_detail"); return "template/layout"; }
				 * 
				 * //저장 전 모든 내용을 보여주는 뷰
				 * 
				 * @RequestMapping("/recipe/insert_confirm_view") public String
				 * recipeInsertConfirm( Model model , HttpServletRequest request ) { HttpSession
				 * session = request.getSession(); Integer userId = (Integer)
				 * session.getAttribute("userId"); if(userId == null) { return
				 * "redirect:/user/sign_in_view"; }
				 * 
				 * //recipe 썸네일 세션에서 받아오기 Recipe recipe = (Recipe)
				 * session.getAttribute("recipe"); //레시피 과정 세션에서 받아오기 List<RecipeCourse>
				 * recipeCourseList = new ArrayList<>(); int i = 1; while((RecipeCourse)
				 * session.getAttribute("recipeCourse" + i) != null) { RecipeCourse item =
				 * (RecipeCourse) session.getAttribute("recipeCourse" + i);
				 * recipeCourseList.add(item); i++; }
				 * 
				 * model.addAttribute("recipe", recipe); model.addAttribute("recipeCourseList",
				 * recipeCourseList); model.addAttribute("viewName", "recipe/insert_confirm");
				 * 
				 * return "template/layout"; }
				 * 
				 * 
				 * @RequestMapping("/recipe/insert_confirm_view_2") public String
				 * recipeInsertConfirm2( Model model , HttpServletRequest request ) {
				 * HttpSession session = request.getSession(); Integer userId = (Integer)
				 * session.getAttribute("userId"); if(userId == null) { return
				 * "redirect:/user/sign_in_view"; } int recipeId = 5007; // Recipe recipe =
				 * recipeBO.getRecipeById(recipeId);
				 * 
				 * //레시피 과정 세션에서 받아오기 List<RecipeCourse> recipeCourseList =
				 * recipeCourseBO.getRecipeCourseByRecipeId(recipeId);
				 * 
				 * model.addAttribute("recipeCourseList", recipeCourseList);
				 * model.addAttribute("viewName", "recipe/insert_confirm");
				 * 
				 * return "template/layout"; }
				 */

}