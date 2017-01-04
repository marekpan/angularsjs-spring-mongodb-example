package com.polubinskas.ajaxtest.user.services;

import com.polubinskas.ajaxtest.base.models.AjaxResponse;
import com.polubinskas.ajaxtest.user.models.UserDoc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Component;

/**
 * Created by HP on 28.12.2016.
 */

@Component
public class UserApiService {
    @Autowired UserService userService;

    public AjaxResponse<UserDoc> all() {
        AjaxResponse<UserDoc> response = new AjaxResponse<UserDoc>();
        response.setCount(userService.count(new Query()));
        response.setItems(userService.findAll());
        return response;
    }
}
