package com.rail.transit.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;

/**
 * Created by PYF on 2017/11/6.
 */
public abstract class AbstractBaseRedisDao<K,V> {

    @Autowired
    protected RedisTemplate<K, V> redisTemplate;

    public AbstractBaseRedisDao() {
    }

    public RedisTemplate<K, V> getRedisTemplate() {
        return redisTemplate;
    }

    public void setRedisTemplate(RedisTemplate<K, V> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    protected RedisSerializer<String> getRedisSerializer(){
        return redisTemplate.getStringSerializer();
    }
}
