package com.jassikdan.ingrd.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jassikdan.ingrd.dao.IngrdDAO;
import com.jassikdan.ingrd.model.Ingrd;

@Service
public class IngrdBO {
	
	@Autowired
	private IngrdDAO ingrdDAO;
	
	//재료 아이디로 재료 정보 가져오기
	public Ingrd getIngrdById(int ingrdId) {
		return ingrdDAO.selectIngrdById(ingrdId);
	}
	
	//모든 개본 재료 정보 가져오기
	public List<Ingrd> getIngrdAll(){
		return ingrdDAO.selectIngrdAll();
	}


}
