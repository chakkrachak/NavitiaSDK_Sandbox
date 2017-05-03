package org.kisio.labs.NavitiaSDKSandbox.Places;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.kisio.labs.NavitiaSDKSandbox.BaseNavitiaRequestBuilder;
import org.kisio.labs.NavitiaSDKSandbox.NavitiaConfiguration;

import java.io.IOException;

public class EndpointRequestBuilderPlaces extends BaseNavitiaRequestBuilder {
    public EndpointRequestBuilderPlaces(NavitiaConfiguration navitiaConfiguration) {
        super(navitiaConfiguration, "/places");
    }

    public EndpointRequestBuilderPlaces withQ(String q) {
        this.addQueryParameter("q", q);
        return this;
    }

    public EndpointRequestBuilderPlaces withCount(int count) {
        this.addQueryParameter("count", String.valueOf(count));
        return this;
    }
}
