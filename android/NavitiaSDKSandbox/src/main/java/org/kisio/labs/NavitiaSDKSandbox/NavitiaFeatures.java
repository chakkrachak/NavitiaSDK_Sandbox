package org.kisio.labs.NavitiaSDKSandbox;

import org.kisio.labs.NavitiaSDKSandbox.Places.EndpointPlaces;

/**
 * Created by cchak on 27/04/2017.
 */
public class NavitiaFeatures {
    private NavitiaConfiguration navitiaConfiguration;
    private EndpointPlaces autoComplete;

    public NavitiaConfiguration getNavitiaConfiguration() {
        return navitiaConfiguration;
    }

    public EndpointPlaces getAutoComplete() {
        return autoComplete;
    }

    public NavitiaFeatures(NavitiaConfiguration navitiaConfiguration) {
        this.navitiaConfiguration = navitiaConfiguration;
        this.autoComplete = new EndpointPlaces();
    }
}
