package com.jassikdan.sharp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jassikdan.sharp.model.Sharp;

@Repository
public interface SharpDAO {
	
	//아이디로 샾키워드 리스트 가져오기
	public List<Sharp> selectSharpListByUserId(int userId);
	
	//해시태그 추가
	public void insertSharp(
			@Param("userId") int userId
			, @Param("keyword") String keyword);
	
	//해시태그 삭제
	public void deleteSharpById(int sharpId);
	
}
