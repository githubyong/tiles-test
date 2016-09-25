package com.yong.sitemesh.service;

import com.yong.sitemesh.model.User;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;

@Service
public class UserService {

    private Random ran = new Random();
    private AtomicInteger idGenertor = new AtomicInteger();
    public static String base = "abcdefghijklmnopqrstuvwxyz0123456789";
    private static final String[] email_suffix = "@gmail.com,@yahoo.com,@msn.com,@hotmail.com,@aol.com,@ask.com,@live.com,@qq.com,@0355.net,@163.com,@163.net,@263.net,@3721.net,@yeah.net,@googlemail.com,@126.com,@sina.com,@sohu.com,@yahoo.com.cn".split(",");

    private User randomUser() {
        User u = new User();
        u.setId(idGenertor.incrementAndGet());
        u.setName(getName());
        u.setAge(ran.nextInt(30) + 10);
        u.setEmail(getEmail());
        u.setTel(getTel());
        return u;
    }

    private String getName() {
        String word = base.substring(0, 26);
        int length = 3 + ran.nextInt(10);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            sb.append(word.charAt(ran.nextInt(26)));
        }
        return sb.toString();
    }

    private String getEmail() {
        int length = 2 + ran.nextInt(3);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            sb.append(base.charAt(ran.nextInt(base.length())));
        }
        sb.append(email_suffix[ran.nextInt(email_suffix.length)]);
        return sb.toString();
    }

    private String getTel() {
        return String.format("%s%04d", 138000, ran.nextInt(9999));
    }

    public List<User> randomList(int n) {
        idGenertor.set(0);
        List<User> list = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            list.add(randomUser());
        }
        return list;
    }
}
