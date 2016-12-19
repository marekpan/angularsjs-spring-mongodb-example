package com.polubinskas.ajaxtest.controllers;

import com.polubinskas.ajaxtest.models.AjaxResponse;
import com.polubinskas.ajaxtest.models.ProductDoc;
import com.polubinskas.ajaxtest.routes.AppRoutes;
import com.polubinskas.ajaxtest.service.ShopService;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by HP on 08.12.2016.
 */

@RestController
public class AjaxController {
    @Autowired ShopService shopService;

    @RequestMapping(value = "/product/all", method = RequestMethod.GET)
    public AjaxResponse<ProductDoc> productsByUser(@RequestParam(required = true) String userId) {
        return shopService.findAllProductsByOwner(new ObjectId(userId));
    }

    @RequestMapping(value = AppRoutes.PRODUCT_DELETE, method = RequestMethod.POST)
    public void delete(@RequestParam String productId) {
        shopService.remove(new ObjectId(productId));
    }
}
