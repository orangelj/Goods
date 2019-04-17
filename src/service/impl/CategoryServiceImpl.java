package service.impl;

import dao.CategoryDAO;
import entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.CategoryService;

import java.util.List;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryDAO categoryDAO;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Category> selectAll(Integer page, Integer rows, String cname) {
        Integer page1 = (page-1)*rows+1;
        Integer rows1 = page*rows;
        return categoryDAO.selectAll(page1,rows1,cname);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Integer selectCount(String cname) {
        return categoryDAO.selectCount(cname);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Category> selectByFid(Integer parentId) {
        return categoryDAO.selectByFid(parentId);
    }
}
