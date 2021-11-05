package com.jassikdan.test.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jassikdan.test.model.Test;

@Repository
public interface TestDAO {
	
	public List<Test> selectData();
}
