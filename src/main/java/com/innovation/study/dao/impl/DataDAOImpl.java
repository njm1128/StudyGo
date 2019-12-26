package com.innovation.study.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.innovation.study.dao.DataDAO;
import com.innovation.study.domain.DataVO;
import com.innovation.study.domain.SearchCriteria;

@Repository
public class DataDAOImpl implements DataDAO {

	private static final String NAMESPACE = "Data-Mapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<DataVO> selectDataList() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectDataList");
	}
	
	@Override
	public List<DataVO> selectDataListByHit() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectDataListByHit");
	}
	
	@Override
	public List<DataVO> selectDataListByArea(String dataArea) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectDataListByArea", dataArea);
	}
	
	@Override
	public List<DataVO> selectDataListBySearch(String dataArea, int dataCate) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataArea", dataArea);
		params.put("dataCate", dataCate);
		return sqlSession.selectList(NAMESPACE + ".selectDataListBySearch", params);
	}
	
	@Override
	public List<DataVO> selectDataListByKeyword(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset, limit);
		return sqlSession.selectList(NAMESPACE + ".selectDataListByKeyword", cri, rowBounds);
	}

	@Override
	public DataVO selectDataByNo(int dataNo) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectDataByNo", dataNo);
	}

	@Override
	public void updateDataHit(int dataNo) throws SQLException {
		sqlSession.update("updateDataHit", dataNo);
	}

	@Override
	public int selectDataListByKeywordCount(SearchCriteria cri) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectDataListByKeywordCount", cri);
	}

}
