package com.jassikdan.sharp.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jassikdan.sharp.dao.SharpDAO;
import com.jassikdan.sharp.model.Sharp;

@Service
public class SharpBO {
 
	@Autowired
	private SharpDAO sharpDAO;
	
	//아이디로 샾키워드 리스트 가져오기
	public List<Sharp> getSharpListByUserId(int userId) {
		return sharpDAO.selectSharpListByUserId(userId);
	}
	
	//해시태그 추가
	public void insertSharp(int userId, String keyword) {
		sharpDAO.insertSharp(userId, keyword);
	}
	
	//해시태그 삭제
	public void deleteSharpById(int sharpId) {
		sharpDAO.deleteSharpById(sharpId);
	}
}
