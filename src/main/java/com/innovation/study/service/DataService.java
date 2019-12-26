package com.innovation.study.service;

import java.sql.SQLException;
import java.util.List;

import com.innovation.study.domain.DataVO;
import com.innovation.study.domain.SearchCriteria;

public interface DataService {

	List<DataVO> getDataList() throws SQLException;
	
	List<DataVO> getDataListByHit() throws SQLException;
	
	List<DataVO> getDataListBySearch(String dataArea, int dataCate) throws SQLException;
	
	List<DataVO> getDataListByKeyword(SearchCriteria cri) throws SQLException;
	
	DataVO getDataById(int dataNo) throws SQLException;
	
	void modifyDataHit(int dataNo) throws SQLException;
	
	int getDataListByKeywordCount(SearchCriteria cri) throws SQLException;
}
