package org.kisio.labs.NavitiaSDKSandbox;

import org.kisio.labs.NavitiaSDKSandbox.Places.EndpointPlaces;

/**
 * Created by cchak on 27/04/2017.
 */
public class NavitiaEndpoints {
    private NavitiaConfiguration navitiaConfiguration;
    private EndpointPlaces places;

    public NavitiaConfiguration getNavitiaConfiguration() {
        return navitiaConfiguration;
    }

    public EndpointPlaces getPlaces() {
        return places;
    }

    public NavitiaEndpoints(NavitiaConfiguration navitiaConfiguration) {
        this.navitiaConfiguration = navitiaConfiguration;
        this.places = new EndpointPlaces();
    }
}
