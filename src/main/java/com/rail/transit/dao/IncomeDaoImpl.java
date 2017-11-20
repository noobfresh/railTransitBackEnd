package com.rail.transit.dao;

import com.rail.transit.entity.*;
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

    /**
    * 各线路不同票种的出行数量比例和对应票价收入
     */
    public List<NumberPercentIncomeByTicketType> get2(final String keyId){
        List<NumberPercentIncomeByTicketType> result = redisTemplate.execute(new RedisCallback<List<NumberPercentIncomeByTicketType>>() {
            public List<NumberPercentIncomeByTicketType> doInRedis(RedisConnection connection) throws DataAccessException {
                List<NumberPercentIncomeByTicketType> ans = new ArrayList<NumberPercentIncomeByTicketType>();
                RedisSerializer<String> serializer = getRedisSerializer();
                byte[] key = serializer.serialize(keyId);
                List<byte[]> list = connection.lRange(key, 0, -1);
                for(byte[] a: list){
                    byte[] key2 = serializer.serialize("number_percent_income_by_" + serializer.deserialize(a));
                    List<byte[]> temp = connection.lRange(key2, 0, -1);
                    NumberPercentIncomeByTicketType num = new NumberPercentIncomeByTicketType();
                    num.setIncome(serializer.deserialize(temp.get(0)));
                    num.setPercent(serializer.deserialize(temp.get(1)));
                    num.setNumber(serializer.deserialize(temp.get(2)));
                    num.setTicket_t(serializer.deserialize(temp.get(3)));
                    num.setLine(serializer.deserialize(temp.get(4)));
                    ans.add(num);
                }
                return ans;
            }
        });
        return result;
    }

    /**各线路优惠票卡出行总人数、总计优惠票额
     *
     * @param keyId
     * @return
     */
    public List<PeopleTotaolSaveMoney> get3(final String keyId){
        List<PeopleTotaolSaveMoney> result = redisTemplate.execute(new RedisCallback<List<PeopleTotaolSaveMoney>>() {
            public List<PeopleTotaolSaveMoney> doInRedis(RedisConnection connection) throws DataAccessException {
                List<PeopleTotaolSaveMoney> ans = new ArrayList<PeopleTotaolSaveMoney>();
                RedisSerializer<String> serializer = getRedisSerializer();
                byte[] key = serializer.serialize(keyId);
                List<byte[]> list = connection.lRange(key, 0, -1);
                for(byte[] a: list){
                    byte[] key2 = serializer.serialize("people_totaolsavedmoney_" + serializer.deserialize(a));
                    List<byte[]> temp = connection.lRange(key2, 0, -1);
                    PeopleTotaolSaveMoney num = new PeopleTotaolSaveMoney();
                    num.setTotaolSaveMoney(serializer.deserialize(temp.get(0)));
                    num.setPeople(serializer.deserialize(temp.get(1)));
                    num.setLine(serializer.deserialize(temp.get(2)));
                    ans.add(num);
                }
                return ans;
            }
        });
        return result;
    }

    /**
     *
     * @param keyId
     * @return
     */
    public List<PeopleTotaolSavedMoneyLineTicketType> get4(final String keyId){
        List<PeopleTotaolSavedMoneyLineTicketType> result = redisTemplate.execute(new RedisCallback<List<PeopleTotaolSavedMoneyLineTicketType>>() {
            public List<PeopleTotaolSavedMoneyLineTicketType> doInRedis(RedisConnection connection) throws DataAccessException {
                List<PeopleTotaolSavedMoneyLineTicketType> ans = new ArrayList<PeopleTotaolSavedMoneyLineTicketType>();
                RedisSerializer<String> serializer = getRedisSerializer();
                byte[] key = serializer.serialize(keyId);
                List<byte[]> list = connection.lRange(key, 0, -1);
                for(byte[] a: list){
                    byte[] key2 = serializer.serialize("people_totaolsavedmoney_" + serializer.deserialize(a));
                    List<byte[]> temp = connection.lRange(key2, 0, -1);
                    PeopleTotaolSavedMoneyLineTicketType num = new PeopleTotaolSavedMoneyLineTicketType();
                    num.setTotaolSavedMoney(serializer.deserialize(temp.get(0)));
                    num.setPeople(serializer.deserialize(temp.get(1)));
                    num.setTicketType(serializer.deserialize(temp.get(2)));
                    num.setLine(serializer.deserialize(temp.get(3)));
                    ans.add(num);
                }
                return ans;
            }
        });
        return result;
    }

    /**
     * 车站使用优惠票卡出行总人数、总计优惠票额
     * @param keyId
     * @return
     */
    public List<PeopleTotaolSavedMoneStations> get5(final String keyId){
        List<PeopleTotaolSavedMoneStations> result = redisTemplate.execute(new RedisCallback<List<PeopleTotaolSavedMoneStations>>() {
            public List<PeopleTotaolSavedMoneStations> doInRedis(RedisConnection connection) throws DataAccessException {
                List<PeopleTotaolSavedMoneStations> ans = new ArrayList<PeopleTotaolSavedMoneStations>();
                RedisSerializer<String> serializer = getRedisSerializer();
                byte[] key = serializer.serialize(keyId);
                List<byte[]> list = connection.lRange(key, 0, -1);
                for(byte[] a: list){
                    byte[] key2 = serializer.serialize("people_totaolsavedmoney_" + serializer.deserialize(a));
                    List<byte[]> temp = connection.lRange(key2, 0, -1);
                    PeopleTotaolSavedMoneStations num = new PeopleTotaolSavedMoneStations();
                    num.setTotaolSavedMoney(serializer.deserialize(temp.get(0)));
                    num.setPeople(serializer.deserialize(temp.get(1)));
                    num.setStation1(serializer.deserialize(temp.get(2)));
                    ans.add(num);
                }
                return ans;
            }
        });
        return result;
    }

    /**
     * 车站不同优惠卡类型出行人数、优惠的票额
     * @param keyId
     * @return
     */
    public List<PeopleTotaolSavedMoneyStationTicketType> get6(final String keyId){
        List<PeopleTotaolSavedMoneyStationTicketType> result = redisTemplate.execute(new RedisCallback<List<PeopleTotaolSavedMoneyStationTicketType>>() {
            public List<PeopleTotaolSavedMoneyStationTicketType> doInRedis(RedisConnection connection) throws DataAccessException {
                List<PeopleTotaolSavedMoneyStationTicketType> ans = new ArrayList<PeopleTotaolSavedMoneyStationTicketType>();
                RedisSerializer<String> serializer = getRedisSerializer();
                byte[] key = serializer.serialize(keyId);
                List<byte[]> list = connection.lRange(key, 0, -1);
                for(byte[] a: list){
                    byte[] key2 = serializer.serialize("people_totaolsavedmoney_" + serializer.deserialize(a));
                    List<byte[]> temp = connection.lRange(key2, 0, -1);
                    PeopleTotaolSavedMoneyStationTicketType num = new PeopleTotaolSavedMoneyStationTicketType();
                    num.setTotaolSavedMoney(serializer.deserialize(temp.get(0)));
                    num.setPeople(serializer.deserialize(temp.get(1)));
                    num.setTicketType(serializer.deserialize(temp.get(2)));
                    num.setStation1(serializer.deserialize(temp.get(3)));
                    ans.add(num);
                }
                return ans;
            }
        });
        return result;
    }
}
