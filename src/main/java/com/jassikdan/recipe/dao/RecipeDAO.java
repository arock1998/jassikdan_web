package com.jassikdan.recipe.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jassikdan.recipe.model.Recipe;

@Repository
public interface RecipeDAO {
	
	//내가 만든 레시피 보여주기
	public List<Recipe> selectRecipeListByUserId(int userId);

	//모든 레시피를 가져오기
	public List<Recipe> selectAllRecipe();
	
}
