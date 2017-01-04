package com.polubinskas.ajaxtest.product.service;

import com.polubinskas.ajaxtest.product.models.ProductDoc;
import com.polubinskas.ajaxtest.user.models.UserDoc;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by HP on 28.12.2016.
 */

@Component
public class ProductService {
    @Autowired private MongoTemplate mongoTemplate;

    public List<ProductDoc> findAll() {
        return mongoTemplate.findAll(ProductDoc.class);
    }

    public ProductDoc findById(ObjectId productId) {
        return mongoTemplate.findById(productId, ProductDoc.class);
    }

    public void save(ProductDoc productDoc) {
        mongoTemplate.save(productDoc);
    }

    public void remove(ObjectId productId) {
        ProductDoc productDoc = mongoTemplate.findById(productId, ProductDoc.class);
        mongoTemplate.remove(productDoc);

    }

    public List<ProductDoc> find(Query query) {
        return mongoTemplate.find(query, ProductDoc.class);
    }

    public Long count(Query query) {
        return mongoTemplate.count(query, ProductDoc.class);
    }
}
