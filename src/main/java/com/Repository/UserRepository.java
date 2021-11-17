package com.Repository;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Entity.User;
import com.Repository.Dao.UserDao;

@Repository("userDao")
public class UserRepository implements UserDao{

	@Autowired
	HibernateTemplate hibernateTemplate;

	/**
	 * update user details
	 */
	@Transactional
	@Override
	public void update(User user) {
		hibernateTemplate.update(user);
	}
}
