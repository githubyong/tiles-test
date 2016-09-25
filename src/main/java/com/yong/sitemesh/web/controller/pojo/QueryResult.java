package com.yong.sitemesh.web.controller.pojo;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yong on 2016/9/26.
 */
public class QueryResult<E> {
    private int total;
    private List<E> rows;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<E> getRows() {
        if(rows == null){
            rows = new ArrayList<>();
        }
        return rows;
    }

    public void setRows(List<E> rows) {
        this.rows = rows;
    }
}
