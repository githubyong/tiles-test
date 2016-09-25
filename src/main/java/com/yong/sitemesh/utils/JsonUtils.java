package com.yong.sitemesh.utils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yong.sitemesh.web.spring.CustomJsonMapper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.IOException;

/**
 * Created by zhaoy on 2015/10/8.
 */
public class JsonUtils {
    private static Logger log = LogManager.getLogger(JsonUtils.class);

    private static ObjectMapper mapper = new CustomJsonMapper();

    public static <T> T parse(String json, Class<T> clazz) {
        if (isJsonEmpty(json))
            return null;

        try {
            return mapper.readValue(json, clazz);
        } catch (IOException e) {
            log.warn("parse json string error:" + json, e);
            return null;
        }
    }

    public static <T> T parse(String json, TypeReference<T> valueTypeRef) {
        if (isJsonEmpty(json))
            return null;

        try {
            return mapper.readValue(json, valueTypeRef);
        } catch (IOException e) {
            log.warn("parse json string error:" + json, e);
            return null;
        }
    }

    public static String print(Object object) {
        try {
            return mapper.writeValueAsString(object);
        } catch (IOException e) {
            log.warn("write to json string error:" + object, e);
            return null;
        }
    }

    public static String printPretty(Object object) {
        try {
            return mapper.writerWithDefaultPrettyPrinter().writeValueAsString(object);
        } catch (IOException e) {
            log.warn("write to json string error:" + object, e);
            return null;
        }
    }

    private static boolean isJsonEmpty(String json) {
        if (json == null)
            return true;
        return false;
    }

}
