package service;

import entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductService {

    //查询所有 分页
    List<Product> selectAll(@Param("page") Integer page, @Param("rows") Integer rows,@Param("pname") String pname);
    //添加
    void add(Product product);
    //修改
    void update(Product product);
    //查询总页数
    Integer total(String pname);
    //删除
    void delete(Integer pid);
    //批量删除
    void deleteByIds(int[] ids);
    //根据id查单个商品
    Product selectOne(@Param("pid")String pid);
}
