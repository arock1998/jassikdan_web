package com.jassikdan.recipeIngrd.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jassikdan.recipeIngrd.dao.RecipeIngrdDAO;
import com.jassikdan.recipeIngrd.model.RecipeIngrd;

@Service
public class RecipeIngrdBO {
	
	@Autowired
	private RecipeIngrdDAO recipeIngrdDAO;

	//레시피에 대한 재료 가져오기
	public List<RecipeIngrd> getRecipeIngrdByRecipeId(int recipeId){
		return recipeIngrdDAO.selectRecipeIngrdByRecipeId(recipeId);
	}
}
