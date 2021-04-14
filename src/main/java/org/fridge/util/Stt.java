package org.fridge.util;

import com.baidu.speech.restapi.asrdemo.Base64Util;
import com.baidu.speech.restapi.common.ConnUtil;
import com.baidu.speech.restapi.common.DemoException;
import com.baidu.speech.restapi.common.TokenHolder;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Objects;

@Component
public class Stt {

    // 文件格式, 支持pcm/wav/amr 格式，极速版额外支持m4a 格式
    //private final String FORMAT = FILENAME.substring(FILENAME.length() - 3);
    // 采样率固定值
    private final int RATE = 8000;
    private final String CUID = "1234567JAVA";
    private final String URL;

    private final int DEV_PID;

    //private int LM_ID;//测试自训练平台需要打开此注释

    //  普通版 参数
    {
        URL = "http://vop.baidu.com/server_api"; // 可以改为https
        //  1537 表示识别普通话，使用输入法模型。 其它语种参见文档
        DEV_PID = 1537;
    }

    // 自训练平台 参数
    /*{
        //自训练平台模型上线后，您会看见 第二步：“”获取专属模型参数pid:8001，modelid:1234”，按照这个信息获取 dev_pid=8001，lm_id=1234
        DEV_PID = 8001;
        LM_ID = 1234；
    }*/

    /* 极速版 参数
    {
        URL =   "http://vop.baidu.com/pro_api"; // 可以改为https
        DEV_PID = 80001;
        SCOPE = "brain_enhanced_asr";
    }
    */

    /* 忽略scope检查，非常旧的应用可能没有
    {
        SCOPE = null;
    }
    */

    /**
     * 关键方法
     */
    public static String stt(MultipartFile file) throws IOException, DemoException {
        Stt demo = new Stt();
        // 填写下面信息
        String result = demo.run(file);
        System.out.println("识别结束：结果是：");
        System.out.println(result);

        net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(result);
        String text = jsonObject.getJSONArray("result").get(0).toString();
        System.out.println("text = " + text);

        return text;

        // 如果显示乱码，请打开result.txt查看
//        File file = new File("result.txt");
//        FileWriter fo = new FileWriter(file);
//        fo.write(result);
//        fo.close();
//        System.out.println("Result also wrote into " + file.getAbsolutePath());
    }


    public String run(MultipartFile file) throws IOException, DemoException {
        //  填写网页上申请的appkey 如 $apiKey="g8eBUMSokVB1BHGmgxxxxxx"
        String APP_KEY = "kB1OWB3ZsVL3Elt6TjB1aPBw";
        // 填写网页上申请的APP SECRET 如 $SECRET_KEY="94dc99566550d87f8fa8ece112xxxxx"
        String SECRET_KEY = "l1y5gAEhZGxBS4FCKiqykgz4I9apDIXn";
        String SCOPE = "audio_voice_assistant_get";
        TokenHolder holder = new TokenHolder(APP_KEY, SECRET_KEY, SCOPE);
        holder.resfresh();
        String token = holder.getToken();
        // 默认以json方式上传音频文件
        return runJsonPostMethod(token, file);
    }

    private String runRawPostMethod(String token, MultipartFile file) throws IOException, DemoException {
        String url2 = URL + "?cuid=" + ConnUtil.urlEncode(CUID) + "&dev_pid=" + DEV_PID + "&token=" + token;
        //测试自训练平台需要打开以下信息
        //String url2 = URL + "?cuid=" + ConnUtil.urlEncode(CUID) + "&dev_pid=" + DEV_PID + "&lm_id="+ LM_ID + "&token=" + token;
        String FORMAT = Objects.requireNonNull(file.getOriginalFilename()).substring(file.getOriginalFilename().length() - 3);
        String contentTypeStr = "audio/" + FORMAT + "; rate=" + RATE;
        //System.out.println(url2);
        byte[] content = getFileContent(file);
        HttpURLConnection conn = (HttpURLConnection) new URL(url2).openConnection();
        conn.setConnectTimeout(5000);
        conn.setRequestProperty("Content-Type", contentTypeStr);
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.getOutputStream().write(content);
        conn.getOutputStream().close();
        System.out.println("url is " + url2);
        System.out.println("header is  " + "Content-Type :" + contentTypeStr);
        return ConnUtil.getResponseString(conn);
    }

    public String runJsonPostMethod(String token, MultipartFile file) throws DemoException, IOException {

        byte[] content = getFileContent(file);
        String speech = base64Encode(content);

        JSONObject params = new JSONObject();
        params.put("dev_pid", DEV_PID);
        //params.put("lm_id",LM_ID);//测试自训练平台需要打开注释
        String FORMAT = Objects.requireNonNull(file.getOriginalFilename()).substring(file.getOriginalFilename().length() - 3);
        params.put("format", FORMAT);
        params.put("rate", RATE);
        params.put("token", token);
        params.put("cuid", CUID);
        params.put("channel", "1");
        params.put("len", content.length);
        params.put("speech", speech);

        // System.out.println(params.toString());
        HttpURLConnection conn = (HttpURLConnection) new URL(URL).openConnection();
        conn.setConnectTimeout(5000);
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
        conn.setDoOutput(true);
        conn.getOutputStream().write(params.toString().getBytes());
        conn.getOutputStream().close();
        String result = ConnUtil.getResponseString(conn);


        params.put("speech", "base64Encode(getFileContent(FILENAME))");
        System.out.println("url is : " + URL);
        System.out.println("params is :" + params.toString());


        return result;
    }

    private byte[] getFileContent(MultipartFile file) throws IOException {
//        File file = new File(filename);
//        if (!file.canRead()) {
//            System.err.println("文件不存在或者不可读: " + file.getAbsolutePath());
//            throw new DemoException("file cannot read: " + file.getAbsolutePath());
//        }
        FileInputStream is = null;
        try {
            is = (FileInputStream) file.getInputStream();
            return ConnUtil.getInputStreamContent(is);
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }

    private String base64Encode(byte[] content) {

        char[] chars = Base64Util.encode(content); // 1.7 及以下，不推荐，请自行跟换相关库

        return new String(chars);
    }

}
