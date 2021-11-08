package com.jassikdan.ingrdIhave.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jassikdan.ingrdIhave.model.IngrdIhave;

@Repository
public interface IngrdIhaveDAO {
	
	//userId로 냉장고 속 재료 리스트 가져오기
	public List<IngrdIhave> selectIngrdIhaveByUserId(int userId);
	
	//구매한 재료 등록하기
	public void insertIngrdIhaveList(List<HashMap<String,Object>> ingrdList);
		
	//구매한 재료 삭제
	public void deleteIngrdIhaveById(
			@Param("userId") int userId
			, @Param("id") int id);
	
	//재료사용
	public void updateAmountByUserIdAndRecipeId(
			@Param("userId") int userId
			, @Param("ingrdId") int ingrdId
			, @Param("remain") int remain
			, @Param("createdAt") Date createdAt);
}
