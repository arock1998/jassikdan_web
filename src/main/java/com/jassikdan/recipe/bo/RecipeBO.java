package com.jassikdan.recipe.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jassikdan.recipe.dao.RecipeDAO;
import com.jassikdan.recipe.model.Recipe;

@Service
public class RecipeBO {
	
	@Autowired
	private RecipeDAO recipeDAO;
	
	//내가 만든 레시피 보여주기
	public List<Recipe> getRecipeListByUserId(int userId){
		return recipeDAO.selectRecipeListByUserId(userId);
	}
	
	//모든 레시피를 가져오기
	public List<Recipe> getAllRecipe(){
		return recipeDAO.selectAllRecipe();
	}
	
	//레시피 첫화면 등록
	public void insertRecipe(Recipe recipe) {
		recipeDAO.insertRecipe(recipe);
	}
	
	
}
