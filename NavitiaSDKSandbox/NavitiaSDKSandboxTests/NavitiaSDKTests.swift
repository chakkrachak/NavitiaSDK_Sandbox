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
        let navitiaSDK:NavitiaSDK = NavitiaSDK(configuration: NavitiaConfiguration(token: "takotak"))

        Assert.that(navitiaSDK).isNotNull()
        Assert.that(navitiaSDK.configuration).isNotNull()
        Assert.that(navitiaSDK.configuration.token).isEqualTo("takotak")
        Assert.that(navitiaSDK.autoComplete).isNotNull()
        Assert.that(navitiaSDK.autoComplete.places).isNotNull()
    }

    func testShouldRetrieveAutoCompleteResultsGivenValidConfiguration() {
        let navitiaSDK:NavitiaSDK = NavitiaSDK(configuration: NavitiaConfiguration(token: "9e304161-bb97-4210-b13d-c71eaf58961c"))

        let expectation = self.expectation(description: "AutoComplete request completed")
        var result:String = ""
        navitiaSDK.autoComplete.places.newRequestBuilder().withQuery("gare").withCount(10).get(callback: {
            (currentAutocompleteResults: [String:AnyObject]) -> Void in
            result = (currentAutocompleteResults["places"] as! [[String: AnyObject]])[0]["name"] as! String
            expectation.fulfill()
        })

        waitForExpectations(timeout: 2)
        Assert.that(result).isEqualTo("Garein")
    }

    func testShouldFormatUrlGivenQueryParameters() {
        let navitiaSDK:NavitiaSDK = NavitiaSDK(configuration: NavitiaConfiguration(token: "9e304161-bb97-4210-b13d-c71eaf58961c"))

        let url:String = navitiaSDK.autoComplete.places.newRequestBuilder().withQuery("gare").withCount(10).getUrl()

        Assert.that(url).isEqualTo("https://api.navitia.io/v1/places?q=gare&count=10")
    }
}
