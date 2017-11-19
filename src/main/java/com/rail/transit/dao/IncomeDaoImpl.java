package com.rail.transit.dao;

import com.rail.transit.entity.Income;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by PYF on 2017/11/6.
 */
@Repository
public class IncomeDaoImpl extends AbstractBaseRedisDao<String, Income> implements IIncomeDao {

    public boolean add(final Income income) {
        boolean result = redisTemplate.execute(new RedisCallback<Boolean>() {
            public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
                RedisSerializer<String> serializer = getRedisSerializer();
                byte[] key = serializer.serialize(String.valueOf(income.getTotalIncome()));
                byte[] value = serializer.serialize(String.valueOf(income.getTotalIncome()));
                return connection.setNX(key, value);
            }
        });
        return result;
    }

    public boolean add(final List<Income> incomes) {
        if(incomes == null || incomes.size() == 0)
            return false;
        boolean result = redisTemplate.execute(new RedisCallback<Boolean>() {
            public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
                RedisSerializer<String> serializer = getRedisSerializer();
                for(Income income: incomes){
                    byte[] key = serializer.serialize(String.valueOf(income.getTotalIncome()));
                    byte[] value = serializer.serialize(String.valueOf(income.getTotalIncome()));
                    connection.setNX(key, value);
                }
                return true;
            }
        }, false, true);
        return false;
    }

    public void delete(String key) {
        List<String> list = new ArrayList<String>();
        list.add(key);
        redisTemplate.delete(list);
    }

    public void delete(List<String> keys) {
        redisTemplate.delete(keys);
    }

    public boolean update(final Income income) {
        //一般首先要检验键值是否存在
        //这里先pass
        boolean result = redisTemplate.execute(new RedisCallback<Boolean>() {
            public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
                RedisSerializer<String> serializer = getRedisSerializer();
                byte[] key = serializer.serialize(String.valueOf(income.getTotalIncome()));
                byte[] value = serializer.serialize(String.valueOf(income.getTotalIncome()));
                connection.set(key, value);
                return true;
            }
        });
        return result;
    }

    public Income get(final String keyId) {
        Income result = redisTemplate.execute(new RedisCallback<Income>() {
            public Income doInRedis(RedisConnection connection) throws DataAccessException {
                RedisSerializer<String> serializer = getRedisSerializer();
                byte[] key = serializer.serialize(String.valueOf(keyId));
                byte[] value = connection.get(key);
                //此处有个非空值判断，未写
                return new Income(serializer.deserialize(value));
            }
        });
        return result;
    }

    public Map<String, String> get1(final String keyId) {
        Map<String, String> result = redisTemplate.execute(new RedisCallback<Map<String, String>>() {
            public Map<String, String> doInRedis(RedisConnection connection) throws DataAccessException {
                Map<String, String> map = new HashMap<String, String>();
                RedisSerializer<String> serializer = getRedisSerializer();
                byte[] key = serializer.serialize(keyId);
                Map<byte[], byte[]> byteMap = connection.hGetAll(key);
                for(Map.Entry<byte[], byte[]> entry : byteMap.entrySet()){
                    map.put(serializer.deserialize(entry.getKey()), serializer.deserialize(entry.getValue()));
                }
                return map;
            }
        });
        return result;
    }

    public Map<String, String> get2(final String keyId){
        Map<String, String> result = redisTemplate.execute(new RedisCallback<Map<String, String>>() {
            public Map<String, String> doInRedis(RedisConnection connection) throws DataAccessException {
                Map<String, String> map = new HashMap<String, String>();
                RedisSerializer<String> serializer = getRedisSerializer();
                byte[] key = serializer.serialize(keyId);
//                Map<byte[], byte[]> byteMap = connection.hGetAll(key);
                List<byte[]> list = connection.lRange(key, 0, 3);
                for(byte[] a: list){
                    System.out.println(serializer.deserialize(a));
                }
                return map;
            }
        });
        return result;
    }
}
