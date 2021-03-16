package org.fridge.service;

import com.alibaba.fastjson.JSON;

import com.google.gson.Gson;
import net.sf.json.JSONObject;
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
    @Value(value = "${robot.ruyi.app_key}")
    String app_key;

    @Value(value = "${robot.tuling.key}")
    String tuling_key;

    public ApiResponse<Object> ruyiRobot(String input, String uid) {
        String service = "calorie";
        JSONObject resultJson = new JSONObject();

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
            String result = Objects.requireNonNull(response.body()).string();
            JSONObject jsonObject = JSONObject.fromObject(result);
            String text = jsonObject.getJSONObject("result").getJSONArray("intents").getJSONObject(0).getJSONArray("outputs").getJSONObject(0).getJSONObject("property").get("text").toString();
            //System.out.println(text);
            resultJson.put("service",service);
            resultJson.put("result",text);
            return Responses.ok(resultJson);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Responses.fail();
    }

    public ApiResponse<Object> tulingRobot(String input) {
        String service = "speak";
        JSONObject resultJson = new JSONObject();

        if(input.contains("天气") || input.contains("气温") || input.contains("温度") || input.contains("度") ){
            service = "weather";
        }

        String url = "http://api.tianapi.com/txapi/tuling/index";
        OkHttpClient okHttpClient = new OkHttpClient();
        RequestBody formBody = new FormBody.Builder()
                .add("question", input)
                .add("key", tuling_key)
                .build();
        Request request = new Request.Builder().url(url).post(formBody).build();
        Response response;
        try {
            response = okHttpClient.newCall(request).execute();
            if (response.isSuccessful()) {
                com.alibaba.fastjson.JSONObject result = JSON.parseObject(Objects.requireNonNull(response.body()).string());
                String text = result.getJSONArray("newslist").getJSONObject(0).get("reply").toString();
                resultJson.put("service",service);
                resultJson.put("result",text);
                return Responses.ok(resultJson);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Responses.fail();
    }

}
