package com.jassikdan.recipeLike.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RecipeLikeDAO {
	
	//좋아요 개수
	public int countRecipeLike(int recipeId);
	
	//좋아요 여부
	public int isUserLikedRecipe(
			@Param("userId") int userId
			, @Param("recipeId")  int recipeId);
	
	//좋아요 등록
	public void insertRecipeLike(
			@Param("userId") int userId
			, @Param("recipeId")  int recipeId);
	
	//좋아요 해제
	public void deleteRecipeLike(
			@Param("userId") int userId
			, @Param("recipeId")  int recipeId);
	
	
}
