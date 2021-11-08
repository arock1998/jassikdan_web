package com.jassikdan.recipeIngrd.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jassikdan.recipeIngrd.model.RecipeIngrd;

@Repository
public interface RecipeIngrdDAO {
	
	//레시피에 대한 재료 가져오기
	public List<RecipeIngrd> selectRecipeIngrdById(int recipeId);

}
