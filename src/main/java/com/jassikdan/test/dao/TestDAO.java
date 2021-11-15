package com.jassikdan.test.dao;

import java.util.List;

import org.apache.ibatis.io.ResolverUtil.Test;
import org.springframework.stereotype.Repository;

@Repository
public interface TestDAO {

	public List<Test> selectData();
	
}
