package service;

import entity.Admin;

public interface AdminService {

    //登录
    Admin login(Admin admin);
    //注册
    void register(Admin admin);
}
