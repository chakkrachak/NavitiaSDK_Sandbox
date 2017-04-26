package org.kisio.labs.NavitiaSDKSandbox;

public class NavitiaSDK {
    private NavitiaConfiguration configuration;

    public NavitiaConfiguration getConfiguration() {
        return configuration;
    }

    public void setConfiguration(NavitiaConfiguration configuration) {
        this.configuration = configuration;
    }

    public NavitiaSDK(NavitiaConfiguration configuration) {
        this.configuration = configuration;
    }
}
