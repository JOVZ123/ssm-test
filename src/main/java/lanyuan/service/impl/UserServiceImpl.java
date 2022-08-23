package lanyuan.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lanyuan.mapper.UserMapper;
import lanyuan.pojo.User;
import lanyuan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper mapper;

    @Override
    public User login(User user) {
        return mapper.login(user);
    }

    @Override
    public PageInfo<User> show(Integer pageNum, Integer pageSize, String search) {
        PageHelper.startPage(pageNum, pageSize);
        User user = new User();
        user.setAccount(search);
        user.setName(search);
        user.setPhone(search);
        return new PageInfo<>(mapper.show(user));
    }

    @Override
    public int add(User user) {
        return mapper.insertSelective(user);
    }

    @Override
    public int update(User user) {
        return mapper.updateByPrimaryKeySelective(user);
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
    public User selectById(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int disable(String[] id, User user) {
        int i1 = 0;
        for (String i : id) {
            user.setId(Integer.parseInt(i));
            user.setStatus("1");
            i1 = mapper.updateByPrimaryKeySelective(user);
        }
        return i1;
    }

    @Override
    public int open(String[] id, User user) {
        int i1 = 0;
        for (String i : id) {
            user.setId(Integer.parseInt(i));
            user.setStatus("0");
            i1 = mapper.updateByPrimaryKeySelective(user);
        }
        return i1;
    }


}