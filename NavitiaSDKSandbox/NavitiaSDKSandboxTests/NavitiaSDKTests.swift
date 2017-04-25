import XCTest
@testable import NavitiaSDKSandbox

class NavitiaSDKTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testShouldInstantiateGivenValidConfiguration() {
        let navitiaSDK: NavitiaSDK = NavitiaSDK(configuration: NavitiaConfiguration(token: "takotak"))

        Assert.that(navitiaSDK).isNotNull()
        Assert.that(navitiaSDK.configuration).isNotNull()
        Assert.that(navitiaSDK.configuration.token).isEqualTo("takotak")
        Assert.that(navitiaSDK.features).isNotNull()
        Assert.that(navitiaSDK.features.autoComplete).isNotNull()
        Assert.that(navitiaSDK.endPoints).isNotNull()
        Assert.that(navitiaSDK.endPoints.places).isNotNull()
    }

    func testShouldRetrieveEndpointPlacesResultsGivenValidConfiguration() {
        let navitiaSDK: NavitiaSDK = NavitiaSDK(configuration: NavitiaConfiguration(token: "9e304161-bb97-4210-b13d-c71eaf58961c"))

        let expectation = self.expectation(description: "AutoComplete request completed")
        var result: String = ""
        navitiaSDK
                .endPoints.places
                .newRequestBuilder().withQ("gare").withCount(10)
                .rawGet(callback: {
                    (currentAutocompleteResults: [String: AnyObject]) -> Void in
                    result = (currentAutocompleteResults["places"] as! [[String: AnyObject]])[0]["name"] as! String
                    expectation.fulfill()
                })

        waitForExpectations(timeout: 2)
        Assert.that(result).isEqualTo("Garein")
    }

    func testShouldRetrieveFeatureAutoCompleteResultsGivenValidConfiguration() {
        let navitiaSDK: NavitiaSDK = NavitiaSDK(configuration: NavitiaConfiguration(token: "9e304161-bb97-4210-b13d-c71eaf58961c"))

        let expectation = self.expectation(description: "AutoComplete request completed")
        var result: String = ""
        navitiaSDK
                .features.autoComplete
                .newRequestBuilder().withQ("gare").withCount(10)
                .rawGet(callback: {
                    (currentAutocompleteResults: [String: AnyObject]) -> Void in
                    result = (currentAutocompleteResults["places"] as! [[String: AnyObject]])[0]["name"] as! String
                    expectation.fulfill()
                })

        waitForExpectations(timeout: 2)
        Assert.that(result).isEqualTo("Garein")
    }

    func testShouldFormatUrlGivenQueryParametersForEndpointPlaces() {
        let navitiaSDK: NavitiaSDK = NavitiaSDK(configuration: NavitiaConfiguration(token: "9e304161-bb97-4210-b13d-c71eaf58961c"))

        let url: String = navitiaSDK
                .endPoints.places
                .newRequestBuilder().withQ("gare").withCount(10).getUrl()

        Assert.that(url).isEqualTo("https://api.navitia.io/v1/places?q=gare&count=10")
    }

    func testShouldFormatUrlGivenQueryParametersForFeatureAutoComplete() {
        let navitiaSDK: NavitiaSDK = NavitiaSDK(configuration: NavitiaConfiguration(token: "9e304161-bb97-4210-b13d-c71eaf58961c"))

        let url: String = navitiaSDK
                .features.autoComplete
                .newRequestBuilder().withQ("gare").withCount(10).getUrl()

        Assert.that(url).isEqualTo("https://api.navitia.io/v1/places?q=gare&count=10")
    }
}