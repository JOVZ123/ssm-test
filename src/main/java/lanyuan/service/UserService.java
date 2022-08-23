package lanyuan.service;

import com.github.pagehelper.PageInfo;
import lanyuan.pojo.User;


public interface UserService {
    User login(User user);

    PageInfo<User> show(Integer pageNum, Integer pageSize, String search);

    int add(User user);

    int update(User user);

    int delete(Integer[] id);

    User selectById(Integer id);

    int disable(String[] id, User user);

    int open(String[] id, User user);

}
