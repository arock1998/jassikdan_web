package com.jassikdan.recipe;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jassikdan.common.FileManagerService;
import com.jassikdan.recipe.bo.RecipeBO;
import com.jassikdan.recipe.model.Recipe;
import com.jassikdan.recipeCourse.bo.RecipeCourseBO;
import com.jassikdan.recipeIngrd.bo.RecipeIngrdBO;

@RestController
public class RecipeRestController {

	@Autowired
	private FileManagerService fileManagerService;
	@Autowired
	private RecipeBO recipeBO;
	@Autowired
	private RecipeCourseBO recipeCourseBO;
	@Autowired
	private RecipeIngrdBO recipeIngrdBO;
	
	//레시피 저장, 레시피 과정 저장, 레시피 재료 저장
	@PostMapping("/recipe/insert")
	public Map<String, Object> recipeInsert(
			@RequestParam("recipeName") String recipeName
			, @RequestParam("recipeDescription") String recipeDescription
			, @RequestParam("recipeImage") MultipartFile recipeImage
			, @RequestParam("recipeNation") String recipeNation
			, HttpServletRequest request
			) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		long currentTimeMillis = System.currentTimeMillis();
		String image = "";
		try {
			image = fileManagerService.saveRecipe(userId, currentTimeMillis, recipeImage);
		} catch (IOException e) {
			e.printStackTrace();
		}
		Recipe newRecipe = new Recipe();
		newRecipe.setName(recipeName);
		newRecipe.setDescription(recipeDescription);
		newRecipe.setImage(recipeNation);
		newRecipe.setImage(image);
		recipeBO.insertRecipe(newRecipe);//useGeneratedKey
		int recipeId = newRecipe.getId();
		
		result.put("result", "success");
		result.put("recipeId", recipeId);
		return result;
	}
	
	
	
}
