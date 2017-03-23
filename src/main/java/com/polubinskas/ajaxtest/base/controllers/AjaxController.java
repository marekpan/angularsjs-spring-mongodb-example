package com.polubinskas.ajaxtest.base.controllers;

import com.polubinskas.ajaxtest.base.models.AjaxResponse;
import com.polubinskas.ajaxtest.product.models.ProductDoc;
import com.polubinskas.ajaxtest.product.routes.ProductRoutes;
import com.polubinskas.ajaxtest.product.service.ProductApiService;
import com.polubinskas.ajaxtest.product.service.ProductService;
import com.polubinskas.ajaxtest.user.models.UserDoc;
import com.polubinskas.ajaxtest.user.routes.UserRoutes;
import com.polubinskas.ajaxtest.user.services.UserApiService;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Created by HP on 08.12.2016.
 */

@RestController
public class AjaxController {
    @Autowired UserApiService userApiService;
    @Autowired ProductService productService;
    @Autowired ProductApiService productApiService;

    @RequestMapping(value = UserRoutes.USERS_ALL, method = RequestMethod.GET)
    public AjaxResponse<UserDoc> allUsers() {
        return userApiService.all();
    }

    @RequestMapping(value = {ProductRoutes.PRODUCT_CREATE, ProductRoutes.PRODUCT_EDIT}, method = RequestMethod.POST)
    public void createOrEdit(@ModelAttribute ProductDoc productDoc,
                         @RequestParam String ownerId) {
        productDoc.setOwner(new ObjectId(ownerId));
        productService.save(productDoc);
    }

    @RequestMapping(value = ProductRoutes.PRODUCT_DELETE, method = RequestMethod.POST)
    public void delete(@RequestParam String productId) {
        productService.remove(new ObjectId(productId));
    }

    @RequestMapping(value = ProductRoutes.PRODUCT_ALL, method = RequestMethod.GET)
    public AjaxResponse<ProductDoc> productsByUser(@RequestParam(required = true) String userId) {
        return productApiService.findAllByOwner(new ObjectId(userId));
    }
}
