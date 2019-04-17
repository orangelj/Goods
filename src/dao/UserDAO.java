package dao;


import entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDAO {

    //查询所有 分页
    List<User> selectAll(@Param("page") Integer page, @Param("rows") Integer rows, @Param("username") String username);
    //添加
    void insert(User user);
    //修改
    void update(User user);
    //查询总页数
    Integer selectCount(@Param("username") String username);
    //批量删除
    void deleteByIds(int[] ids);
}
