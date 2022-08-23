package lanyuan.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lanyuan.mapper.RoleMapper;
import lanyuan.pojo.Role;
import lanyuan.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleMapper mapper;

    @Override
    public PageInfo<Role> show(Integer pageNum, Integer pageSize, String search) {
        PageHelper.startPage(pageNum, pageSize);
        Role role = new Role();
        role.setReloname(search);
        return new PageInfo<>(mapper.show(role));
    }

    @Override
    public int delete(Integer[] id) {
        int a = 0;
        for (Integer integer : id) {
            a += mapper.deleteByPrimaryKey(integer);
        }
        if (a > 0) {
            return a;
        }
        return -1;
    }

    @Override
    public int disable(String[] id, Role role) {
        int i1 = 0;
        for (String i : id) {
            role.setId(Integer.parseInt(i));
            role.setStatus("1");
            i1 = mapper.updateByPrimaryKeySelective(role);
        }
        return i1;
    }

    @Override
    public int open(String[] id, Role role) {
        int i1 = 0;
        for (String i : id) {
            role.setId(Integer.parseInt(i));
            role.setStatus("0");
            i1 = mapper.updateByPrimaryKeySelective(role);
        }
        return i1;
    }

    @Override
    public int add(Role role) {
        return mapper.insertSelective(role);
    }

    @Override
    public int update(Role role) {
        return mapper.updateByPrimaryKeySelective(role);
    }

    @Override
    public Role selectById(Integer id) {
        return mapper.selectById(id);
    }

    @Override
    public List<Role> queryAll() {
        return mapper.queryAll();
    }

}
