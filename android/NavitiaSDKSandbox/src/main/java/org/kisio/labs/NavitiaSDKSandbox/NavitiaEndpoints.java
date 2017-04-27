package org.kisio.labs.NavitiaSDKSandbox;

/**
 * Created by cchak on 27/04/2017.
 */
public class NavitiaEndpoints {
    private NavitiaConfiguration navitiaConfiguration;

    public NavitiaConfiguration getNavitiaConfiguration() {
        return navitiaConfiguration;
    }

    public void setNavitiaConfiguration(NavitiaConfiguration navitiaConfiguration) {
        this.navitiaConfiguration = navitiaConfiguration;
    }

    public NavitiaEndpoints(NavitiaConfiguration navitiaConfiguration) {
        this.navitiaConfiguration = navitiaConfiguration;
    }
}
