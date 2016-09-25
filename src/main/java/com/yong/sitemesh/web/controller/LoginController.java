package com.yong.sitemesh.web.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 14-2-15
 * <p>Version: 1.0
 */
@Controller
public class LoginController {
    private static Logger logger = LogManager.getLogger(LoginController.class);

    @RequestMapping(value = "/login")
    public String showLoginForm(HttpServletRequest req, Model model) {
        //如果已经登录，先退出一下
        return "login";
    }
}
