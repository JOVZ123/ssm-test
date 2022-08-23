package lanyuan.mapper;

import lanyuan.pojo.Role;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    List<Role> selectByRoleId(Integer userid);

    List<Role> show(Role role);

    Role selectById(Integer id);

    List<Role> queryAll();
}