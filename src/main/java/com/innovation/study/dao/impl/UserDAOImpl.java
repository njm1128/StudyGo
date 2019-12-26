package com.innovation.study.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.innovation.study.dao.UserDAO;
import com.innovation.study.domain.SearchCriteria;
import com.innovation.study.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	private static final String NAMESPACE = "User-Mapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<UserVO> selectUserList() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectUserList");
	}
	
	@Override
	public List<UserVO> selectUserListSearch(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(NAMESPACE + ".selectUserListSearch", cri, rowBounds);
	}

	@Override
	public UserVO selectUserById(String userId) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectUserById", userId);
	}
	
	@Override
	public UserVO selectUserByPhone(String userPhone) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectUserByPhone", userPhone);
	}
	
	@Override
	public UserVO selectUserFindId(UserVO user) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectUserFindId", user);
	}

	@Override
	public UserVO selectUserFindPw(UserVO user) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectUserFindId", user);
	}

	@Override
	public void insertUser(UserVO user) throws SQLException {
		sqlSession.insert(NAMESPACE + ".insertUser", user);
	}

	@Override
	public void updateUser(UserVO user) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateUser", user);
	}

	@Override
	public void deleteUser(String userId) throws SQLException {
		sqlSession.delete(NAMESPACE + ".deleteUser", userId);
	}

	@Override
	public int selectUserListSearchCount(SearchCriteria cri) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectUserListSearchCount", cri);
	}

	@Override
	public void updateUserLoginCount(UserVO user) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateUserLoginCount", user);
	}

}
