package org.fridge.service;

import org.fridge.model.common.ApiResponse;
import org.fridge.model.common.Responses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
    RedisTemplate<String, String> redisTemplate;

    @Autowired
    public void setRedisTemplate(RedisTemplate<String, String> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    public ApiResponse<Object> addMessage(String key, String message) {
        redisTemplate.opsForList().rightPush(key, message);
        return Responses.ok("添加成功");
    }

    public ApiResponse<Object> getMessage(String key) {
        String output = redisTemplate.opsForList().leftPop(key);
        if (output != null) {
            return Responses.ok("获取成功", output);
        } else {
            return Responses.fail("队列为空");
        }
    }
}
