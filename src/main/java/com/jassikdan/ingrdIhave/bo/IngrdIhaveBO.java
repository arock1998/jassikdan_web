package com.jassikdan.ingrdIhave.bo;

import java.util.HashMap;
import java.util.List;

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
	public void insertIngrdIhaveList(List<HashMap<String,Object>> ingrdList) {
		ingrdIhaveDAO.insertIngrdIhaveList(ingrdList);
	}
}
