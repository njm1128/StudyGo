package com.innovation.study.dao;

import java.sql.SQLException;
import java.util.List;

import com.innovation.study.domain.DataVO;
import com.innovation.study.domain.SearchCriteria;

public interface DataDAO {

	List<DataVO> selectDataList() throws SQLException;
	
	List<DataVO> selectDataListByHit() throws SQLException;
	
	List<DataVO> selectDataListByArea(String dataArea) throws SQLException;
	
	List<DataVO> selectDataListBySearch(String dataArea, int dataCate) throws SQLException;
	
	List<DataVO> selectDataListByKeyword(SearchCriteria cri) throws SQLException;

	DataVO selectDataByNo(int dataNo) throws SQLException;

	void updateDataHit(int dataNo) throws SQLException;
	
	int selectDataListByKeywordCount(SearchCriteria cri) throws SQLException;
}
