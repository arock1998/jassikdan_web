package com.jassikdan.mypage.bo;

import java.util.ArrayList;
import java.util.Date;
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
import com.jassikdan.recipeIngrd.bo.RecipeIngrdBO;
import com.jassikdan.recipeIngrd.model.RecipeIngrd;
import com.jassikdan.recipeLike.bo.RecipeLikeBO;
import com.jassikdan.sharp.bo.SharpBO;
import com.jassikdan.sharp.model.Sharp;

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
	@Autowired
	private RecipeIngrdBO recipeIngrdBO;
	@Autowired
	private SharpBO sharpBO;
	
	//재료 아이콘 생성하기
	public List<IngrdIconView> generateIngrdIhaveIconViewListById(int userId){
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

	
	//timeline에서 보여줄 ContentView
	public List<ContentView> generateAllContentView(int userId) {
		List<ContentView> contentList = new ArrayList<>();
		List<Recipe> recipeList = recipeBO.getAllRecipe();

		for (Recipe recipe : recipeList) {
			ContentView content = new ContentView();
			int recipeId = recipe.getId();
			int recipeScore = 0;

			content.setRecipe(recipe);
			content.setLikeYn(recipeLikeBO.isUserLikedRecipe(userId, recipeId));
			content.setCountLike(recipeLikeBO.countRecipeLike(recipeId));
			List<String> recipeSharpList = new ArrayList<>();

			// 데이터 상으로는 한식, 중국, 일본, 이탈리아, 서양, 퓨전, 동남아시아로 나뉘어져 있다.
			String nation = recipe.getNation();
			recipeSharpList.add(nation);
			for(RecipeIngrd item :recipeIngrdBO.getRecipeIngrdById(recipeId)) {
				recipeSharpList.add(item.getIngrdName());
			}
			content.setSharp(recipeSharpList);
			
			List <Sharp> searchSharpList = sharpBO.getSharpListByUserId(userId);

			// 관련있는 것에 점수 부여
			for (String sharpStr : recipeSharpList) {
				if(sharpStr != "") {
					for (Sharp searchSharp : searchSharpList) {
						if (sharpStr.contains(searchSharp.getKeyword()) || searchSharp.getKeyword().contains(sharpStr)) {
							recipeScore += 1;
						}
					}
				}
			}
			content.setScore(recipeScore);
			
			// 점수가 높을수록 앞으로 보낸다
			if (recipeScore >= 1) {
				int index = 0;
				for (ContentView item : contentList) {
					if (recipeScore < item.getScore()) {
						index++; // 인덱스
					} else {
						contentList.add(index, content);
						break;
					}
				}
			} else {
				contentList.add(content);
			}
		}
		return contentList;
	}
	
	//레시피 선택으로 냉장고속 재료 사용
	public void useRecipe(int userId, int recipeId) {
		
		List<RecipeIngrd> recipeIngrdList = recipeIngrdBO.getRecipeIngrdById(recipeId);
		List<IngrdIhave> ingrdIhaveList = ingrdIhaveBO.getIngrdIhaveByUserId(userId);
		
		for(RecipeIngrd recipeIngrd : recipeIngrdList) {
			for(IngrdIhave ingrdIhave : ingrdIhaveList) {
				
				//만약 레시피에 사용되는 재료가 냉장고 속에 있다면
				if(ingrdIhave.getIngrdId() == recipeIngrd.getIngrdId()) {
					
					//같은 재료가 두번 등록되어있을 수 있으므로 제약조건을 하나 더 걸어주자
					Date createdAt = ingrdIhave.getCreatedAt();
					int ingrdId = ingrdIhave.getIngrdId();
					
					//사용하고 남는 재료량
					int remain = ingrdIhave.getIngrdId() - recipeIngrd.getIngrdId();
					if(remain < 0) {
						remain = 0;
					} 
					ingrdIhaveBO.updateAmountByUserIdAndRecipeId(userId, ingrdId, remain, createdAt);
				}
			}
		}
	}
}
