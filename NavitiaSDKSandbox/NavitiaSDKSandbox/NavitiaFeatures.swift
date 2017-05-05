//
// Created by Chakkra CHAK on 25/04/2017.
// Copyright (c) 2017 Chakkra CHAK. All rights reserved.
//

import Foundation

open class NavitiaFeatures {
    let navitiaConfiguration:NavitiaConfiguration
    // <Generated>
    open let autoComplete: EndpointPlaces
    // </ Generated>

    public init(navitiaConfiguration:NavitiaConfiguration) {
        self.navitiaConfiguration = navitiaConfiguration
        // <Generated>
        self.autoComplete = EndpointPlaces(navitiaConfiguration: self.navitiaConfiguration)
        // </ Generated>
    }
}
