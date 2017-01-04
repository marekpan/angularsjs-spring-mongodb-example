package com.polubinskas.ajaxtest.user.services;

import com.polubinskas.ajaxtest.user.models.UserDoc;
import org.bson.types.ObjectId;
import org.omg.PortableInterceptor.ObjectReferenceFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by HP on 28.12.2016.
 */

@Component
public class UserService {
    @Autowired private MongoTemplate mongoTemplate;

    public List<UserDoc> findAll() {
        return mongoTemplate.findAll(UserDoc.class);
    }

    public UserDoc findById(ObjectId userId) {
        return mongoTemplate.findById(userId, UserDoc.class);
    }

    public void save(UserDoc userDoc) {
        mongoTemplate.save(userDoc);
    }

    public void remove(ObjectId userId) {
        UserDoc userDoc = mongoTemplate.findById(userId, UserDoc.class);
        mongoTemplate.remove(userDoc);
    }

    public List<UserDoc> find(Query query) {
        return mongoTemplate.find(query, UserDoc.class);
    }

    public Long count(Query query) {
        return mongoTemplate.count(query, UserDoc.class);
    }
}
