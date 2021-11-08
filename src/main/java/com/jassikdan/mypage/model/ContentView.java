package com.jassikdan.mypage.model;

import java.util.List;

import com.jassikdan.recipe.model.Recipe;

public class ContentView {
	private Recipe recipe;
	private boolean likeYn;
	private int countLike;
	private List<String> sharp;
	private int score;

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
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public List<String> getSharp() {
		return sharp;
	}
	public void setSharp(List<String> sharp) {
		this.sharp = sharp;
	}
}
