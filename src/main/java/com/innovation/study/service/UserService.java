package com.innovation.study.service;

import java.sql.SQLException;
import java.util.List;

import com.innovation.study.domain.SearchCriteria;
import com.innovation.study.domain.UserVO;

public interface UserService {

	List<UserVO> getUserList() throws SQLException;
	
	List<UserVO> getUserListSearch(SearchCriteria cri) throws SQLException;
	
	UserVO getUserById(String userId) throws SQLException;
	
	UserVO getUserByPhone(String userPhone) throws SQLException;
	
	UserVO getUserFind(String type, UserVO user) throws SQLException;
	
	void insertUser(UserVO user) throws SQLException;
	
	void modifyUser(UserVO user) throws SQLException;
	
	void removeUser(String userId) throws SQLException;
	
	int getLoginResult(UserVO user) throws SQLException;
	
	int getUserListSearchCount(SearchCriteria cri) throws SQLException;
	
	void modifyUserLoginCount(UserVO user) throws SQLException;
}
