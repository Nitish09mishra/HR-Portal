package com.nitish.dao;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.nitish.model.UserModel;



@Repository
public class UserModelDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate ;
	
	// creating usermodel in the databse table...
	@Transactional
	public int saveUser(UserModel user) {
		System.out.println("inside save user dao");
		int id= (Integer)this.hibernateTemplate.save(user);
		
		return id;
	}
	
	// get user from database...
	@SuppressWarnings("deprecation")
	@Transactional
	public boolean getUser(UserModel user) {
		
		 boolean k= hibernateTemplate.find("from UserModel where userid =" + "'" + user.getUserid() + "' and password = " +" '" + user.getPassword() + "' ").isEmpty();
		 System.out.print("logged in= " + k);
		 return k;
	}
}
