package org.example.utils;

import com.google.gson.Gson;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Map;

public class JsonUtils {
    public static Map<String, Object> parseJson(String fileName) throws Exception {
        Gson gson = new Gson();
        Reader reader = new InputStreamReader(
                 JsonUtils.class.getClassLoader().getResourceAsStream(fileName), "UTF-8");
        Map<String, Object> data = gson.fromJson(reader, Map.class);
        reader.close();
        return data;
    }
}