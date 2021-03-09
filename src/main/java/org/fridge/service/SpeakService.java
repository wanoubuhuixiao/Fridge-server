package org.fridge.service;

import com.google.gson.Gson;
import okhttp3.*;
import org.fridge.model.common.ApiResponse;
import org.fridge.model.common.Responses;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Service
public class SpeakService {
    @Value(value = "${ruyi.app_key}")
    String app_key;

    public ApiResponse<Object> speak(String input, String uid) {
        String url = "http://api.ruyi.ai/v1/message";
        Map<String, Object> map = new HashMap<>();
        map.put("q", input);
        map.put("app_key", app_key);
        map.put("user_id", uid);
        OkHttpClient okHttpClient = new OkHttpClient();
        RequestBody formBody = RequestBody.create(MediaType.parse("application/json; charset=UTF-8"), new Gson().toJson(map));
        Request request = new Request.Builder().url(url).post(formBody).build();
        Response response = null;
        try {
            response = okHttpClient.newCall(request).execute();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Responses.ok(response.body());
    }
}
