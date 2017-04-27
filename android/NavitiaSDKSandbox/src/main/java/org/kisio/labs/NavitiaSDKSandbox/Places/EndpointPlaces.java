package org.kisio.labs.NavitiaSDKSandbox.Places;

import org.kisio.labs.NavitiaSDKSandbox.NavitiaConfiguration;

public class EndpointPlaces {
    private NavitiaConfiguration navitiaConfiguration;

    public EndpointPlaces(NavitiaConfiguration navitiaConfiguration) {
        this.navitiaConfiguration = navitiaConfiguration;
    }

    public EndpointRequestBuilderPlaces newRequestBuilder() {
        return new EndpointRequestBuilderPlaces(this.navitiaConfiguration);
    }
}