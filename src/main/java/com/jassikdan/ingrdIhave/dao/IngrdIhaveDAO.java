package com.jassikdan.ingrdIhave.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jassikdan.ingrdIhave.model.IngrdIhave;

@Repository
public interface IngrdIhaveDAO {
	
	//userId로 냉장고 속 재료 리스트 가져오기
	public List<IngrdIhave> selectIngrdIhaveByUserId(int userId);
		
	
	
	
}
