package org.kisio.labs.NavitiaSDKSandbox.Places;

import org.kisio.labs.NavitiaSDKSandbox.BaseNavitiaRequestBuilder;
import org.kisio.labs.NavitiaSDKSandbox.NavitiaConfiguration;

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
