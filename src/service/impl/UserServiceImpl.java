package service.impl;

import dao.UserDAO;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.UserService;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<User> selectAll(Integer page, Integer rows, String username) {
        Integer page1 = (page-1)*rows+1;
        Integer rows1 = page*rows;
        return userDAO.selectAll(page1, rows1, username);
    }

    @Override
    public void insert(User user) {
        userDAO.insert(user);
    }

    @Override
    public void update(User user) {
        userDAO.update(user);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Integer selectCount(String username) {
        return  userDAO.selectCount(username);
    }

    @Override
    public void deleteByIds(int[] ids) {
        userDAO.deleteByIds(ids);
    }
}
