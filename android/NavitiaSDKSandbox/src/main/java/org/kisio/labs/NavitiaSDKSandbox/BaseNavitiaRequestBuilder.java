package org.kisio.labs.NavitiaSDKSandbox;

import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public abstract class BaseNavitiaRequestBuilder {
    private NavitiaConfiguration navitiaConfiguration;
    private String resourceUri;
    private Hashtable<String, String> queryParameters;

    protected BaseNavitiaRequestBuilder(NavitiaConfiguration navitiaConfiguration, String resourceUri) {
        this.navitiaConfiguration = navitiaConfiguration;
        this.resourceUri = resourceUri;
        this.queryParameters = new Hashtable<String, String>();
    }

    public void addQueryParameter(String key, String value) {
        this.queryParameters.put(key, value);
    }

    public String getUrl() {
        List<String> queryParametersResult = new ArrayList<String>();
        for (String key : this.queryParameters.keySet()) {
            queryParametersResult.add(key + "=" + this.queryParameters.get(key));
        }

        return this.navitiaConfiguration.getBaseUrl()
                + this.resourceUri
                + "?" + queryParametersResult.stream().collect(Collectors.joining("&"));
    }

    interface BaseRequestCallback { void callback(JSONObject jsonObject); }
    public void rawGet(BaseRequestCallback baseRequestCallback) throws IOException, ParseException {
        OkHttpClient client = new OkHttpClient();
        Request request = new Request.Builder()
                .url(this.getUrl())
                .addHeader("Authorization", this.navitiaConfiguration.getToken())
                .build();
        Response response = client.newCall(request).execute();
        String jsonResponse = response.body().string();
        JSONParser parser = new JSONParser();

        JSONObject jsonObject = (JSONObject) parser.parse(jsonResponse);

        baseRequestCallback.callback(jsonObject);
    }
}
