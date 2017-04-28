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
        assertNotNull(navitiaSDK.getEndpoints());
        assertNotNull(navitiaSDK.getEndpoints().getPlaces());
        assertNotNull(navitiaSDK.getFeatures());
        assertNotNull(navitiaSDK.getFeatures().getAutoComplete());
    }

    @Test
    public void shouldRetrieveEndpointPlacesResultsGivenValidConfiguration() throws Exception {
        NavitiaSDK navitiaSDK = new NavitiaSDK(new NavitiaConfiguration("9e304161-bb97-4210-b13d-c71eaf58961c"));

        final String[] result = new String[1];
        navitiaSDK.getEndpoints().getPlaces()
                .newRequestBuilder().withQ("gare").withCount(10)
                .rawGet((String response) -> {
                    result[0] = response;
                });

        assertEquals("Garein", result[0]);
    }

    @Test
    public void shouldFormatUrlGivenQueryParametersForEndpointPlaces() throws Exception {
        NavitiaSDK navitiaSDK = new NavitiaSDK(new NavitiaConfiguration("9e304161-bb97-4210-b13d-c71eaf58961c"));

        String url = navitiaSDK.getEndpoints().getPlaces()
                .newRequestBuilder()
                .withQ("gare")
                .withCount(10)
                .getUrl();

        assertEquals("https://api.navitia.io/v1/places?count=10&q=gare", url);
    }
}