package com.jassikdan.mypage.model;

import com.jassikdan.recipe.model.Recipe;

public class ContentView {
	private Recipe recipe;
	private boolean likeYn;
	private int countLike;

	public Recipe getRecipe() {
		return recipe;
	}
	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}
	public boolean isLikeYn() {
		return likeYn;
	}
	public void setLikeYn(boolean likeYn) {
		this.likeYn = likeYn;
	}
	public int getCountLike() {
		return countLike;
	}
	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}
	
	
}
