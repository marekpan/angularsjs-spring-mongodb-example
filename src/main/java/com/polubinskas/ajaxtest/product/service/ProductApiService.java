package com.polubinskas.ajaxtest.product.service;

import com.polubinskas.ajaxtest.base.models.AjaxResponse;
import com.polubinskas.ajaxtest.product.models.ProductDoc;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Component;

/**
 * Created by HP on 28.12.2016.
 */

@Component
public class ProductApiService {
    @Autowired ProductService productService;

    public AjaxResponse<ProductDoc> findByOwner(ObjectId ownerId) {
        Criteria criteria = Criteria.where("owner").is(ownerId);
        Query query = new Query(criteria);
        AjaxResponse<ProductDoc> response = new AjaxResponse<ProductDoc>();
        response.setCount(productService.count(query));
        response.setItems(productService.find(query));
        return response;
    }
}
