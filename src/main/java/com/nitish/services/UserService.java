package com.nitish.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nitish.dao.UserModelDao;
import com.nitish.model.UserModel;

@Service
public class UserService {
	
	@Autowired
	private UserModelDao userDao;
	
	public int createUser(UserModel user) {
		System.out.println("inside createUser service");
		return this.userDao.saveUser(user);
	}
	
	public boolean findUser(UserModel user) {
		System.out.println(" inside login services ");
		return this.userDao.getUser(user);
	}

}
