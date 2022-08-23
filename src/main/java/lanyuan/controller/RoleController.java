package lanyuan.controller;

import com.github.pagehelper.PageInfo;
import lanyuan.pojo.Role;
import lanyuan.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    RoleService rs;

    @RequestMapping("/toList")
    public String toList() {
        return "/role/list";
    }

    @RequestMapping("/show")
    public String show(@RequestParam(defaultValue = "1") Integer pageNum, String search, Map map, HttpSession session) {
        if (search == null) {
            search = (String) session.getAttribute("search");
        } else {
            session.setAttribute("search", search);
        }
        PageInfo<Role> p = rs.show(pageNum, 4, search);

        map.put("pr", p);
        return "/role/list";
    }

    @RequestMapping("/delete")
    public String delete(Integer[] ids) {
        if (ids != null) {
            rs.delete(ids);
        }
        return "redirect:/role/show";
    }

    @RequestMapping("/toAdd")
    public String toAdd() {
        return "/role/add";
    }

    @RequestMapping("/add")
    public String add(Role role) {
        int add = rs.add(role);
        return "redirect:/role/show";
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(Integer id, Map map) {
        Role role = rs.selectById(id);
        System.out.println(role.getReloname() + "==========");
        map.put("role", role);
        return "/role/eidt";
    }

    @RequestMapping("/update")
    public String update(Role role) {
        int update = rs.update(role);
        return "redirect:/role/show";
    }

    @RequestMapping("/disable")
    public String disable(String ids, Role role) {
        if (ids != "") {
            String[] split = ids.split(",");
            rs.disable(split, role);
        }

        return "redirect:/role/show";
    }

    @RequestMapping("/opens")
    public String open(String ids, Role role) {

        if (ids != "") {
            String[] split = ids.split(",");
            rs.open(split, role);
        }
        return "redirect:/role/show";
    }
}
