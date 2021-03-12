package org.fridge.service;

import org.fridge.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
public class LoginService {
    UserMapper userMapper;
    RedisTemplate<String, String> redisTemplate;

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Autowired
    public void setRedisTemplate(RedisTemplate<String, String> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    public String getCaptcha(Long uid) {
        StringBuilder captcha = new StringBuilder(6);
        Random random = new Random(System.currentTimeMillis());
        for (int i = 0; i < 6; i++) {
            captcha.append(random.nextInt(10));
        }
        redisTemplate.opsForValue().append("Captcha_" + uid, captcha.toString());
        return captcha.toString();
    }
}
