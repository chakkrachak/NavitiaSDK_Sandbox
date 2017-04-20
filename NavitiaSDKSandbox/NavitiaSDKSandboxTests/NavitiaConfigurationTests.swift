//
//  NavitiaConfigurationTests.swift
//  NavitiaSDKSandboxTests
//
//  Created by Chakkra CHAK on 20/04/2017.
//  Copyright © 2017 Chakkra CHAK. All rights reserved.
//

import XCTest
@testable import NavitiaSDKSandbox

class NavitiaConfigurationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldInstantiateGivenNotEmptyToken() {
        let navitiaConfiguration:NavitiaConfiguration = NavitiaConfiguration(token: "toktok")

        Assert.that(navitiaConfiguration.baseUrl).isEqualTo("https://api.navitia.io/v1")
        Assert.that(navitiaConfiguration.token).isEqualTo("toktok")
    }
}
