package com.polubinskas.ajaxtest.service;

import com.polubinskas.ajaxtest.models.AjaxResponse;
import com.polubinskas.ajaxtest.models.ProductDoc;
import com.polubinskas.ajaxtest.models.UserDoc;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by HP on 08.12.2016.
 */

@Component
public class ShopService {
    @Autowired private MongoTemplate mongoTemplate;

    public List<UserDoc> findAllUsers() {
        return mongoTemplate.findAll(UserDoc.class);
    }

    public AjaxResponse<ProductDoc> findAllProductsByOwner(ObjectId ownerId) {
        Criteria criteria = Criteria.where("owner").is(ownerId);
        Query query = new Query(criteria);
        AjaxResponse<ProductDoc> response = new AjaxResponse<ProductDoc>();
        response.setCount(mongoTemplate.count(query, ProductDoc.class));
        response.setItems(mongoTemplate.find(query, ProductDoc.class));
        return response;
    }
}
