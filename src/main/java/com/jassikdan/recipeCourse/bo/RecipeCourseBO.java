package com.jassikdan.recipeCourse.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jassikdan.recipeCourse.dao.RecipeCourseDAO;
import com.jassikdan.recipeCourse.model.RecipeCourse;

@Service
public class RecipeCourseBO {

	@Autowired
	private RecipeCourseDAO recipeCourseDAO;
	
	//레시피 과정정보 가져오기
	public List<RecipeCourse> getRecipeCourseByRecipeId(int recipeId){
		return recipeCourseDAO.selectRecipeCourseByRecipeId(recipeId);
	}
	
	//레시피 과정정보 등록하기
	public void insertRecipeCourse(RecipeCourse recipeCourse) {
		recipeCourseDAO.insertRecipeCourse(recipeCourse);
	}
}
