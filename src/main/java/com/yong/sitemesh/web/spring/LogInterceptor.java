package com.yong.sitemesh.web.spring;

import com.yong.sitemesh.utils.JsonUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.MessageFormat;
import java.util.Map;

/**
 * Created by zhaoy on 2016/1/7.
 */
public class LogInterceptor extends HandlerInterceptorAdapter {
    private static final Logger log = LogManager.getLogger(LogInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        String method = request.getMethod();
        Map parameterMap = request.getParameterMap();
        String seqno = String.valueOf(System.nanoTime());//纳秒的流水号
        log.info(MessageFormat.format(" request ====> url:{0} {1}, method: {2}, args:{3} ", seqno, url, method, JsonUtils.print(parameterMap)));
        request.setAttribute("__seq_no", seqno);
        return true;
    }
}
