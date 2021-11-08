package com.jassikdan.recipeCourse.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jassikdan.recipeCourse.model.RecipeCourse;

@Repository
public interface RecipeCourseDAO {
	
	//레시피 과정정보 가져오기
	public List<RecipeCourse> selectRecipeCourseByRecipeId(int recipeId);

}
