package dao;

import entity.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategoryDAO {

    //分页查询
    List<Category> selectAll(@Param("page") Integer page, @Param("rows") Integer rows, @Param("cname") String cname);
    //查询总条数
    Integer selectCount(@Param("cname") String cname);
    //根据父id 查询
    List<Category> selectByFid(@Param("parentId") Integer parentId);
}
