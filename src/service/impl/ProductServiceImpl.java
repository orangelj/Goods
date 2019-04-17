package service.impl;

import dao.ProductDAO;
import entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.ProductService;

import java.util.List;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDAO productDAO;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Product> selectAll(Integer page, Integer rows,String pname) {
        Integer page1 = (page-1)*rows+1;
        Integer rows1 = page*rows;
       return  productDAO.selectAll(page1,rows1,pname);
    }

    @Override
    public void add(Product product) {
        productDAO.insert(product);
    }

    @Override
    public void update(Product product) {
        productDAO.update(product);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Integer total(String pname) {
       return productDAO.selectCount(pname);
    }

    @Override
    public void delete(Integer pid) {
        productDAO.delete(pid);
    }

    @Override
    public void deleteByIds(int[] ids) {
        productDAO.deleteByIds(ids);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Product selectOne(String pid) {
        return productDAO.selectOne(pid);
    }
}
