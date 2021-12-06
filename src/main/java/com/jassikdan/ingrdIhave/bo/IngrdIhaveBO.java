package com.jassikdan.ingrdIhave.bo;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jassikdan.ingrdIhave.dao.IngrdIhaveDAO;
import com.jassikdan.ingrdIhave.model.IngrdIhave;

@Service
public class IngrdIhaveBO {

	@Autowired
	private IngrdIhaveDAO ingrdIhaveDAO;
	
	//userId로 냉장고 속 재료 리스트 가져오기
	public List<IngrdIhave> getIngrdIhaveByUserId(int userId){
		return ingrdIhaveDAO.selectIngrdIhaveByUserId(userId);
	}

	//구매한 재료 등록하기
	public void insertIngrdIhave(int userId, int ingrdId) {
		ingrdIhaveDAO.insertIngrdIhave(userId, ingrdId);
	}
	
	//구매한 재료 삭제
	public void deleteIngrdIhaveById(int userId, int id) {
		ingrdIhaveDAO.deleteIngrdIhaveById(userId, id);
	}
	
	//재료사용
	public void updateAmountByUserIdAndRecipeId(int userId, int ingrdId, int remain, Date createdAt) {
		ingrdIhaveDAO.updateAmountByUserIdAndRecipeId(userId, ingrdId, remain, createdAt);
	}
	
}
