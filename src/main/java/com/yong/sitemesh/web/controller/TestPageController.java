package com.yong.sitemesh.web.controller;

import com.yong.sitemesh.model.User;
import com.yong.sitemesh.service.UserService;
import com.yong.sitemesh.web.controller.pojo.QueryResult;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@org.springframework.stereotype.Controller
@RequestMapping("/test")
public class TestPageController {
    @RequestMapping(value = "/{page}", method = RequestMethod.GET)
    public String testPage(ModelMap model, @PathVariable("page") String page) {
        model.addAttribute("message", "Hello world!");
        return "test/" + page;
    }


    @RequestMapping(value = "/post2page1", method = RequestMethod.POST)
    public String post2page1(ModelMap model) {
        model.addAttribute("message", "这是由page2 提交的post");
        System.out.println("test post to page1.....");
        return "test/page1";
    }

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, String> testHello(ModelMap model) {
        Map<String, String> map = new HashMap<>();
        map.put("k1", "v1");
        map.put("hello", "tiles");
        map.put("note", "json 不需要页面框架!");
        return map;
    }

    @Resource
    private UserService menuService;

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    @ResponseBody
    public QueryResult<User> menus(HttpServletRequest request, int count) {
        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int rows = request.getParameter("rows") != null ? Integer.parseInt(request.getParameter("rows")) : 20;
        System.out.println("rows = " + rows + " page = " + page);
        QueryResult<User> users = new QueryResult<>();
        users.setTotal(count);
        users.setRows(menuService.randomList(rows * page <= count ? rows : count - rows * (page - 1)));
        return users;
    }
}