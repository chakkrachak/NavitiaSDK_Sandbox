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

        let result:String = navitiaSDK.autoComplete.places.newRequestBuilder().get()

        Assert.that(result).isEqualTo("9e304161-bb97-4210-b13d-c71eaf58961c")
    }
}
