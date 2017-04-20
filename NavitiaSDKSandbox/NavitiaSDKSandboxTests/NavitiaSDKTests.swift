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

    func testShouldInstantiateGivenNotEmptyToken() {
        let navitiaSDK:NavitiaSDK = NavitiaSDK(configuration: NavitiaConfiguration(token: "takotak"))

        Assert.that(navitiaSDK).isNotNull()
        Assert.that(navitiaSDK.configuration).isNotNull()
        Assert.that(navitiaSDK.configuration.token).isEqualTo("takotak")
    }
}
