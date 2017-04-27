package org.kisio.labs.NavitiaSDKSandbox;

import org.kisio.labs.NavitiaSDKSandbox.Places.EndpointPlaces;

public class NavitiaEndpoints {
    private NavitiaConfiguration navitiaConfiguration;
    private EndpointPlaces places;

    public EndpointPlaces getPlaces() {
        return places;
    }

    public NavitiaEndpoints(NavitiaConfiguration navitiaConfiguration) {
        this.navitiaConfiguration = navitiaConfiguration;
        this.places = new EndpointPlaces(this.navitiaConfiguration);
    }
}
