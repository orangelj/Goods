package service.impl;

import dao.AdminDAO;
import entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.AdminService;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDAO adminDAO;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Admin login(Admin admin) {
        return adminDAO.select(admin);
    }

    @Override
    public void register(Admin admin) {
        adminDAO.insert(admin);
    }
}
