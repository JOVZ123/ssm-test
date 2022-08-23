package lanyuan.service;

import com.github.pagehelper.PageInfo;
import lanyuan.pojo.Role;

import java.util.List;


public interface RoleService {
    PageInfo<Role> show(Integer pageNum, Integer pageSize, String search);

    int delete(Integer[] id);

    int add(Role role);

    int update(Role role);

    Role selectById(Integer id);

    List<Role> queryAll();

    int disable(String[] id, Role role);

    int open(String[] id, Role role);
}
