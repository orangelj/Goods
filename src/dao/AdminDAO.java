package dao;

import entity.Admin;

public interface AdminDAO {

    //插入
    void insert(Admin admin);
    //查询
    Admin select(Admin admin);
}
