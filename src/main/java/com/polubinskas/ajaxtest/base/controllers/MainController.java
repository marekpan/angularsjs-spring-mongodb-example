package com.polubinskas.ajaxtest.base.controllers;

import com.polubinskas.ajaxtest.product.routes.ProductRoutes;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Created by HP on 08.12.2016.
 */
@Controller
public class MainController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main() {
        return "main";
    }

    @RequestMapping(value= ProductRoutes.PRODUCT_CREATE, method = RequestMethod.GET)
    public String createProduct() {
        return "addProduct";
    }

    @RequestMapping(value = ProductRoutes.PRODUCT_EDIT, method = RequestMethod.GET)
    public String editProduct() {
        return "editProduct";
    }
}
