package org.fridge.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import okhttp3.*;
import org.fridge.model.common.ApiResponse;
import org.fridge.model.common.Responses;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Service
public class SpeakService {
    @Value(value = "${ruyi.app_key}")
    String app_key;

    @Value(value = "${tuling.key}")
    String tuling_key;

    public ApiResponse<Object> ruyiRobot(String input, String uid) {
        String url = "http://api.ruyi.ai/v1/message";
        Map<String, Object> map = new HashMap<>();
        map.put("q", input);
        map.put("app_key", app_key);
        map.put("user_id", uid);
        OkHttpClient okHttpClient = new OkHttpClient();
        RequestBody formBody = RequestBody.create(new Gson().toJson(map), MediaType.parse("application/json; charset=UTF-8"));
        Request request = new Request.Builder().url(url).post(formBody).build();
        Response response;
        try {
            response = okHttpClient.newCall(request).execute();
            JSONObject result = JSON.parseObject(Objects.requireNonNull(response.body()).string());
            return Responses.ok(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Responses.fail();
    }

    public ApiResponse<Object> tulingRobot(String input) {
        String url = "http://api.tianapi.com/txapi/tuling/index";
        Map<String, Object> map = new HashMap<>();
        map.put("question", input);
        map.put("key", tuling_key);
        OkHttpClient okHttpClient = new OkHttpClient();
        RequestBody formBody = RequestBody.create(new Gson().toJson(map), MediaType.parse("application/json; charset=UTF-8"));
        Request request = new Request.Builder().url(url).post(formBody).build();
        Response response;
        try {
            response = okHttpClient.newCall(request).execute();
            JSONObject result = JSON.parseObject(Objects.requireNonNull(response.body()).string());
            return Responses.ok(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Responses.fail();
    }




}
