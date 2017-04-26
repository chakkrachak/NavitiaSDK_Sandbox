package org.kisio.labs.NavitiaSDKSandbox;

import org.junit.Test;

import static org.junit.Assert.*;

public class NavitiaSDKTest {
    @Test
    public void shouldInstantiateGivenValidConfiguration() throws Exception {
        NavitiaSDK navitiaSDK = new NavitiaSDK(new NavitiaConfiguration("takotak"));

        assertNotNull(navitiaSDK);
        assertNotNull(navitiaSDK.getConfiguration());
        assertEquals("takotak", navitiaSDK.getConfiguration().getToken());
    }
}