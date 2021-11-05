package com.jassikdan.ingrd.dao;

import org.springframework.stereotype.Repository;

import com.jassikdan.ingrd.model.Ingrd;

@Repository
public interface IngrdDAO {
	
	//재료 아이디로 재료 정보 가져오기
	public Ingrd selectIngrdById(int ingrdId);
}
