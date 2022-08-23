package lanyuan.controller;

import com.github.pagehelper.PageInfo;
import lanyuan.pojo.Role;
import lanyuan.pojo.User;
import lanyuan.service.RoleService;
import lanyuan.service.UserService;
import lanyuan.util.CodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService us;
    @Autowired
    RoleService rs;

    @RequestMapping("/login")
    public String login(User user, HttpSession session, String code, Map map) {
        String ran = (String) session.getAttribute("randomCode");
        if (ran.equalsIgnoreCase(code)) {
            User login = us.login(user);
            if (login != null) {
                map.put("user", login);
                return "/home";
            }
        }
        return "/login";
    }
    @RequestMapping("/register")
    public String register(User user, HttpSession session, String code, Map map) {
        String ran = (String) session.getAttribute("randomCode");
        if (ran.equalsIgnoreCase(code)) {
            int add = us.add(user);
            if (add>0) {
                return "/login";
            }
        }
        return "/register";
    }

    @RequestMapping("/getCode")
    public void getCode(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CodeUtil.processRequest(req, resp);
    }

    @RequestMapping("/show")
    public String show(@RequestParam(defaultValue = "1") Integer pageNum, Map map, HttpSession session, String search) {
        if (search == null) {
            search = (String) session.getAttribute("search");
        } else {
            session.setAttribute("search", search);
        }
        PageInfo<User> p = us.show(pageNum, 4, search);
        map.put("p", p);
        return "/admin/list";
    }

    @RequestMapping("/toAdd")
    public String toAdd() {
        return "/admin/add";
    }

    @RequestMapping("/add")
    public String add(User user) {
        us.add(user);
        return "redirect:/user/show";
    }

    @RequestMapping("/logout")
    public String exit(HttpSession session) {
        session.invalidate();
        return "redirect:/toLogin";
    }

    @RequestMapping("/delete")
    public String delete(Integer[] ids) {
        if (ids != null) {
            us.delete(ids);
        }
        return "redirect:/user/show";
    }

    @RequestMapping("/toUpdate")
    public String selectById(Integer id, Map map) {
        User selectById = us.selectById(id);
        map.put("selectById", selectById);
        List<Role> roleList = rs.queryAll();
        map.put("roleList", roleList);
        return "/admin/eidt";
    }

    @RequestMapping("/update")
    public String update(User user) {
        int update = us.update(user);
        if (update > 0) {
            return "redirect:/user/show";
        }
        return "/admin/edit";

    }

    @RequestMapping("toList")
    public String toList() {
        return "/admin/list";
    }

    @RequestMapping("/disable")
    public String disable(String ids, User user) {
        if (ids != "") {
            String[] split = ids.split(",");
            us.disable(split, user);
        }
        return "redirect:/user/show";
    }

    @RequestMapping("/opens")
    public String open(String ids, User user) {
        if (ids != "") {
            String[] split = ids.split(",");
            us.open(split, user);
        }
        return "redirect:/user/show";
    }
}
