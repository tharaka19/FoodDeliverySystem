package com.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.User;
import com.Repository.Dao.UserDao;
import com.Service.Bd.UserBd;

@Service("userBd")
public class UserService implements UserBd{

	@Autowired
	private UserDao userRepository;

	public UserDao getUserRepository() {
		return userRepository;
	}

	public void setUserRepository(UserDao userRepository) {
		this.userRepository = userRepository;
	}

	/**
	 * update user details
	 */
	@Override
	public void update(User user) {
		userRepository.update(user);
	}
	
}
