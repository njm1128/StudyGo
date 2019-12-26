package com.innovation.study.dao;

import java.sql.SQLException;
import java.util.List;

import com.innovation.study.domain.SearchCriteria;
import com.innovation.study.domain.UserVO;

public interface UserDAO {

	List<UserVO> selectUserList() throws SQLException;
	
	List<UserVO> selectUserListSearch(SearchCriteria cri) throws SQLException;

	UserVO selectUserById(String userId) throws SQLException;
	
	UserVO selectUserByPhone(String userPhone) throws SQLException;
	
	UserVO selectUserFindId(UserVO user) throws SQLException;
	
	UserVO selectUserFindPw(UserVO user) throws SQLException;

	void insertUser(UserVO user) throws SQLException;

	void updateUser(UserVO user) throws SQLException;

	void deleteUser(String userId) throws SQLException;
	
	int selectUserListSearchCount(SearchCriteria cri) throws SQLException;
	
	void updateUserLoginCount(UserVO user) throws SQLException;
	
}
