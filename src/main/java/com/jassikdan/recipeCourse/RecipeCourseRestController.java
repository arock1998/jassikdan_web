package com.jassikdan.recipeCourse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jassikdan.common.FileManagerService;
import com.jassikdan.recipe.bo.RecipeBO;
import com.jassikdan.recipe.model.Recipe;
import com.jassikdan.recipeCourse.bo.RecipeCourseBO;
import com.jassikdan.recipeCourse.model.RecipeCourse;

@RestController
public class RecipeCourseRestController {
	
	private FileManagerService fileManagerSerice = new FileManagerService();
	@Autowired
	private RecipeBO recipeBO;
	@Autowired
	private RecipeCourseBO recipeCourseBO;

	// 여기 보지 말고 recipeRestController 볼 것 여기 모두 삭제될 수 도 있다.
	
	
	//레시피 썸네일 세션에 저장
	public Map<String, Object> recipeInsert(
			@RequestParam("name") String name
			, @RequestParam("description") String description
			, @RequestParam(value="image", required=false) MultipartFile image
			, @RequestParam("nation") String nation
			, HttpServletRequest request){
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		long currentTimeMillis = System.currentTimeMillis();
		session.setAttribute("currentTimeMillis", currentTimeMillis);
		//id 가져와서 재료등록
		//id 가져와서 세션에 저장
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		//저장된 recipe를 세션에 저장해둔다.
		
		Recipe recipe = new Recipe();
		recipe.setUserId(userId);
		recipe.setName(name);
		recipe.setDescription(description);
		recipe.setNation(nation);
		String filePath = "";
		try {
			filePath = fileManagerSerice.saveRecipe(userId, currentTimeMillis, image);
		} catch (IOException e) {
			e.printStackTrace();
		}
		recipe.setImage(filePath);
		session.setAttribute("recipe", recipe);
		
		result.put("result", "success");
		return result;
	}
	
	//view에서 get으로 받은 cookingNo를 받아서 순서대로 저장하자
	@PostMapping("/recipe/insert_detail")
	public Map<String, Object> recipeInsertDetail(
			@RequestParam("cookingNo") int cookingNo
			, @RequestParam("description") String description
			, @RequestParam("image") MultipartFile image
			, HttpServletRequest request){
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		
		RecipeCourse recipeCourse = new RecipeCourse();
		recipeCourse.setCookingNo(cookingNo);
		recipeCourse.setDescription(description);
		long currentTimeMillis = (long)session.getAttribute("currentTimeMillis");	//이게 null인경우가 생긴다
		String filePath = "";
		try {
			filePath = fileManagerSerice.saveRecipe(userId, currentTimeMillis, image);
		} catch (IOException e) {
			e.printStackTrace();
		}
		recipeCourse.setImage(filePath);
		
		//순서대로 저장
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
		recipeBO.insertRecipe(recipe);
		//BO 불러서 recipe 저장 그리고 생성된 키도 불러온다.
		int recipeId = recipe.getId();
		
		int i = 1;
		while(session.getAttribute("cookingNo"+ i) != null) {
			RecipeCourse recipeCourse = 
					(RecipeCourse) session.getAttribute("cookingNo" + i);
			recipeCourse.setRecipeId(recipeId);
			recipeCourseBO.insertRecipeCourse(recipeCourse);
			i++;
		}
		
		//TODO: 사용된 재료 저장
		result.put("result", "success");
		return result;
	}
	
	
}
