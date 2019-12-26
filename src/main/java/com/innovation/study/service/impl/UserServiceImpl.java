package com.innovation.study.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innovation.study.dao.UserDAO;
import com.innovation.study.domain.SearchCriteria;
import com.innovation.study.domain.UserVO;
import com.innovation.study.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Override
	public List<UserVO> getUserList() throws SQLException {
		return userDAO.selectUserList();
	}
	
	@Override
	public List<UserVO> getUserListSearch(SearchCriteria cri) throws SQLException {
		return userDAO.selectUserListSearch(cri);
	}

	@Override
	public UserVO getUserById(String userId) throws SQLException {
		return userDAO.selectUserById(userId);
	}
	
	@Override
	public UserVO getUserByPhone(String userPhone) throws SQLException {
		return userDAO.selectUserByPhone(userPhone);
	}

	@Override
	public void insertUser(UserVO user) throws SQLException {
		userDAO.insertUser(user);
	}

	@Override
	public void modifyUser(UserVO user) throws SQLException {
		userDAO.updateUser(user);
	}

	@Override
	public void removeUser(String userId) throws SQLException {
		userDAO.deleteUser(userId);
	}

	@Override
	public int getLoginResult(UserVO user) throws SQLException {
		UserVO loginUser = userDAO.selectUserById(user.getUserId());
		if (loginUser == null)
			return -1; // 아이디 존재 x
		else {
			//String pwd = UserSha256.encrypt(user.getUserPw());
			String pwd = user.getUserPw();
			if (loginUser.getUserPw().equals(pwd)) {
				return 1; // 로그인 성공
			} else
				return 0; // 비밀번호 일치 x
		}
	}

	@Override
	public UserVO getUserFind(String type, UserVO user) throws SQLException {
		UserVO vo = null;
		if(type.equals("id")) {
			vo = userDAO.selectUserFindId(user);
		} else if(type.equals("pw")) {
			vo = userDAO.selectUserFindPw(user);
		}
		return vo;
	}

	@Override
	public int getUserListSearchCount(SearchCriteria cri) throws SQLException {
		return userDAO.selectUserListSearchCount(cri);
	}

	@Override
	public void modifyUserLoginCount(UserVO user) throws SQLException {
		userDAO.updateUserLoginCount(user);
	}

}
