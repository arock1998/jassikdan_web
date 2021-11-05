package com.jassikdan.ingrdIhave.bo;

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
}
