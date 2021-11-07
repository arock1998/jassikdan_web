package com.jassikdan.mypage.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jassikdan.ingrd.bo.IngrdBO;
import com.jassikdan.ingrd.model.Ingrd;
import com.jassikdan.ingrdIhave.bo.IngrdIhaveBO;
import com.jassikdan.ingrdIhave.model.IngrdIhave;
import com.jassikdan.mypage.model.ContentView;
import com.jassikdan.mypage.model.IngrdIconView;
import com.jassikdan.recipe.bo.RecipeBO;
import com.jassikdan.recipe.model.Recipe;
import com.jassikdan.recipeLike.bo.RecipeLikeBO;

@Service
public class ContentBO {
	
	@Autowired
	private IngrdIhaveBO ingrdIhaveBO;
	@Autowired
	private IngrdBO ingrdBO;
	
	@Autowired
	private RecipeBO recipeBO;
	@Autowired
	private RecipeLikeBO recipeLikeBO;
	
	//재료 아이콘 생성하기
	public List<IngrdIconView> generateIngrdIconViewListById(int userId){
		List<IngrdIconView> ingrdList = new ArrayList<>();
		List<IngrdIhave> ingrdIhaveList = ingrdIhaveBO.getIngrdIhaveByUserId(userId);
		
		for(IngrdIhave item : ingrdIhaveList) {
			IngrdIconView ingrdIconView = new IngrdIconView();
			int ingrdId = item.getIngrdId();
			ingrdIconView.setId(item.getId());
			ingrdIconView.setIngrdId(ingrdId);
			ingrdIconView.setAmount(item.getAmount());
			//ingrdIconView.setExpirationDate(null);
			
			Ingrd ingrd = ingrdBO.getIngrdById(ingrdId);
			ingrdIconView.setName(ingrd.getName());
			ingrdIconView.setNameEng(ingrd.getNameEng());
			ingrdIconView.setSort(ingrd.getSort());
			
			ingrdList.add(ingrdIconView);
		}
		return ingrdList;
	}
	
	//모든 개본 재료 정보 가져오기
	public List<Ingrd> getIngrdAll(){
		return ingrdBO.getIngrdAll();
	}
	
	//내가 등록한 레세피 보여주기
	public List<ContentView> generateContentViewListById(int userId){
		List<ContentView> contentList = new ArrayList<>();
		List<Recipe> recipeList = recipeBO.getRecipeListByUserId(userId);
		
		for(Recipe item : recipeList) {
			ContentView content = new ContentView();
			int recipeId = item.getId();
			content.setRecipe(item);
			contentList.add(content);
			content.setLikeYn(recipeLikeBO.isUserLikedRecipe(userId, recipeId));
			content.setCountLike(recipeLikeBO.countRecipeLike(recipeId));
		}
		return contentList;
	}


}
