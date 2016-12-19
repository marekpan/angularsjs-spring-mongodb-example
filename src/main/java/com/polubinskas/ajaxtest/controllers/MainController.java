package com.polubinskas.ajaxtest.controllers;

import com.polubinskas.ajaxtest.models.ProductDoc;
import com.polubinskas.ajaxtest.models.UserDoc;
import com.polubinskas.ajaxtest.routes.AppRoutes;
import com.polubinskas.ajaxtest.service.ShopService;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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

    @RequestMapping(value = AppRoutes.PRODUCT_CREATE, method = RequestMethod.GET)
    public String create() {
        return "addProduct";
    }

    @RequestMapping(value = AppRoutes.PRODUCT_CREATE, method = RequestMethod.POST)
    public String create(@ModelAttribute ProductDoc productDoc,
                         @RequestParam String ownerId) {
        productDoc.setOwner(new ObjectId(ownerId));
        shopService.saveProduct(productDoc);
        return "redirect:/";
    }

    @RequestMapping(value = AppRoutes.PRODUCT_EDIT, method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam String productId) {
        ProductDoc product = shopService.findProductById(new ObjectId(productId));
        return new ModelAndView("edit", "product", product);
    }

    @RequestMapping(value = AppRoutes.PRODUCT_EDIT, method = RequestMethod.POST)
    public String edit(@ModelAttribute ProductDoc productDoc,
                       @RequestParam String ownerId) {
        productDoc.setOwner(new ObjectId(ownerId));
        shopService.saveProduct(productDoc);
        return "redirect:/";
    }
}
