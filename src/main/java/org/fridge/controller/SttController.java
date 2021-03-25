package org.fridge.controller;

import com.baidu.speech.restapi.common.DemoException;
import org.fridge.model.common.ApiResponse;
import org.fridge.model.common.Responses;
import org.fridge.util.Stt;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
public class SttController {

    @PostMapping(value = "stt")
    public ApiResponse<Object> speechToText(@RequestParam("file") MultipartFile file) throws IOException, DemoException {
        if (file.isEmpty()) {
            return Responses.fail("文件为空");
        }
        String text = Stt.stt(file);
        return Responses.ok(text);
    }

}
