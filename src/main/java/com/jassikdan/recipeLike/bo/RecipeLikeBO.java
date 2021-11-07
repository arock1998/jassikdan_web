package com.jassikdan.recipeLike.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jassikdan.recipeLike.dao.RecipeLikeDAO;

@Service
public class RecipeLikeBO {
	
	@Autowired
	private RecipeLikeDAO recipeLikeDAO;
	
	//좋아요 개수
	public int countRecipeLike(int recipeId) {
		return recipeLikeDAO.countRecipeLike(recipeId);
	}
	
	//좋아요 여부
	public boolean isUserLikedRecipe(int userId, int recipeId) {
		int count = recipeLikeDAO.isUserLikedRecipe(userId, recipeId);
		return count > 0 ? true : false;
	}
	
	//좋아요 등록
	public void insertRecipeLike(int userId, int recipeId){
		recipeLikeDAO.insertRecipeLike(userId, recipeId);
	}
	
	//좋아요 해제
	public void deleteRecipeLike(int userId, int recipeId){
		recipeLikeDAO.deleteRecipeLike(userId, recipeId);
	}

}
