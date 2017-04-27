package org.kisio.labs.NavitiaSDKSandbox;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.stream.Collectors;

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
}
