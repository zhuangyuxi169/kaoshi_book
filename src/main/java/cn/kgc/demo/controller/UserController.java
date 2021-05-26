package cn.kgc.demo.controller;
import cn.kgc.demo.pojo.Users;
import cn.kgc.demo.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping(value="login")
    public String loginPage(@ModelAttribute Users user, Model model){
        return "login";
    }
    @RequestMapping(value="login",method= RequestMethod.POST)
    public String login(@ModelAttribute Users user, Model model, HttpSession session){
        Users u=userService.login(user);
        if(u!=null){
            u.setPassword("");

            session.setAttribute("user", u);
            model.addAttribute("status",0);
            model.addAttribute("user",user);
        }else{
            model.addAttribute("status",1);
        }
        return "login";
    }

    @RequestMapping(value="/register")
    public String register(HttpServletRequest request, Model model){
        return "register";
    }

    @RequestMapping(value="/register",method= RequestMethod.POST)
    public String addUser(@ModelAttribute Users user, Model model){

        List<Users> list=userService.selectUserByName(user);
        if(list.size()==0){
            if(userService.insert(user)==1){
                model.addAttribute("status",0);
            }else{
                model.addAttribute("status",1);
            }
        }else{
            model.addAttribute("status",2);
        }
        return "register";
    }

    @RequestMapping(value="logout",method= RequestMethod.GET)
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/user/login";
    }
    @ResponseBody
    @RequestMapping(value="delete",method= RequestMethod.DELETE)
    public Integer delete(HttpSession session, Model model){
        Users u = (Users) session.getAttribute("user");
       int result=0;
        if(u != null){
            result=   userService.deleteByPrimaryKey(u.getId());
            session.setAttribute("user",null);
            System.out.println("Result:"+result);
        }
        return result;
    }
}
