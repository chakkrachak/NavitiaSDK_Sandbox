package org.kisio.labs.NavitiaSDKSandbox.Places;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.kisio.labs.NavitiaSDKSandbox.BaseNavitiaRequestBuilder;
import org.kisio.labs.NavitiaSDKSandbox.NavitiaConfiguration;
import org.kisio.labs.NavitiaSDKSandbox.ResourceRequestError;

import java.io.IOException;

public class EndpointRequestBuilderPlaces extends BaseNavitiaRequestBuilder {
    public EndpointRequestBuilderPlaces(NavitiaConfiguration navitiaConfiguration) {
        super(navitiaConfiguration, "/places", EndpointResponsePlaces.class);
    }

    public EndpointRequestBuilderPlaces withQ(String q) {
        this.addQueryParameter("q", q);
        return this;
    }

    public EndpointRequestBuilderPlaces withCount(int count) {
        this.addQueryParameter("count", String.valueOf(count));
        return this;
    }

    public interface PlacesRequestCallback {
        void callback(EndpointResponsePlaces endpointResponsePlaces);
    }

    public void get(PlacesRequestCallback placesRequestCallback, ErrorRequestCallback errorRequestCallback) throws IOException, ParseException {
        get(
                (ModelRequestCallback<EndpointResponsePlaces>) endpointResponsePlaces -> placesRequestCallback.callback(endpointResponsePlaces),
                resourceRequestError -> errorRequestCallback.callback(resourceRequestError)
        );
    }
}
