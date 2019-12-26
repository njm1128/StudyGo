package com.innovation.study.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innovation.study.dao.DataDAO;
import com.innovation.study.domain.DataVO;
import com.innovation.study.domain.SearchCriteria;
import com.innovation.study.service.DataService;

@Service
public class DataServiceImpl implements DataService {

	@Autowired
	private DataDAO dataDAO;
	
	@Override
	public List<DataVO> getDataList() throws SQLException {
		return dataDAO.selectDataList();
	}
	
	@Override
	public List<DataVO> getDataListByHit() throws SQLException {
		return dataDAO.selectDataListByHit();
	}
	
	@Override
	public List<DataVO> getDataListBySearch(String dataArea, int dataCate) throws SQLException {
		if(dataCate == 0) {
			return dataDAO.selectDataListByArea(dataArea);
		} else {
			return dataDAO.selectDataListBySearch(dataArea, dataCate);
		}
	}
	
	@Override
	public List<DataVO> getDataListByKeyword(SearchCriteria cri) throws SQLException {
		return dataDAO.selectDataListByKeyword(cri);
	}

	@Override
	public DataVO getDataById(int dataNo) throws SQLException {
		return dataDAO.selectDataByNo(dataNo);
	}

	@Override
	public void modifyDataHit(int dataNo) throws SQLException {
		dataDAO.updateDataHit(dataNo);
	}

	@Override
	public int getDataListByKeywordCount(SearchCriteria cri) throws SQLException {
		return dataDAO.selectDataListByKeywordCount(cri);
	}

}
