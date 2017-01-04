package com.polubinskas.ajaxtest.base.models;

import java.util.List;

/**
 * Created by HP on 08.12.2016.
 */

public class AjaxResponse<T> {
    private Long count;
    private List<T> items;

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }
}
