package org.kisio.labs.NavitiaSDKSandbox;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.junit.Test;
import org.kisio.labs.NavitiaSDKSandbox.Places.EndpointResponsePlaces;

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
                .rawGet(
                        (JSONObject jsonObject) -> {
                            result[0] = (String) ((JSONObject) ((JSONArray) jsonObject.get("places")).get(0)).get("name");
                        },
                        (ResourceRequestError resourceRequestError) -> {
                        }
                );

        assertEquals("Garein", result[0]);
    }

    @Test
    public void shouldLaunchErrorGivenInvalidConfiguration() throws Exception {
        NavitiaSDK navitiaSDK = new NavitiaSDK(new NavitiaConfiguration(""));

        final String[] resultError = new String[1];
        navitiaSDK.getEndpoints().getPlaces()
                .newRequestBuilder().withQ("gare").withCount(10)
                .rawGet(
                        (JSONObject jsonObject) -> {
                        },
                        (ResourceRequestError resourceRequestError) -> {
                            resultError[0] = "TOTO";
                        });

        assertEquals("Garein", resultError[0]);
    }

    @Test
    public void shouldRetrieveEndpointPlacesObjectResultsGivenValidConfiguration() throws Exception {
        NavitiaSDK navitiaSDK = new NavitiaSDK(new NavitiaConfiguration("9e304161-bb97-4210-b13d-c71eaf58961c"));

        final String[] result = new String[1];
        navitiaSDK.getEndpoints().getPlaces()
                .newRequestBuilder().withQ("gare").withCount(10)
                .get(
                        (EndpointResponsePlaces endpointResponsePlaces) -> {
                            result[0] = endpointResponsePlaces.getPlaces().get(0).getName();
                        },
                        (ResourceRequestError resourceRequestError) -> {
                        }
                );

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