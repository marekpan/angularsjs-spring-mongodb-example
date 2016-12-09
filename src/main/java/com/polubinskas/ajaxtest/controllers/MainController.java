package com.polubinskas.ajaxtest.controllers;

import com.polubinskas.ajaxtest.models.UserDoc;
import com.polubinskas.ajaxtest.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by HP on 08.12.2016.
 */
@Controller
public class MainController {
    @Autowired ShopService shopService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView main() {
        List<UserDoc> allUsers = shopService.findAllUsers();
        return new ModelAndView("main", "users", allUsers);
    }
}
