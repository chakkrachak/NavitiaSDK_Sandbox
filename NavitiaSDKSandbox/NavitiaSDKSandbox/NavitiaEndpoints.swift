//
// Created by Chakkra CHAK on 25/04/2017.
// Copyright (c) 2017 Chakkra CHAK. All rights reserved.
//

import Foundation

open class NavitiaEndpoints {
    let navitiaConfiguration:NavitiaConfiguration
    // <Generated>
    open let places: EndpointPlaces
    // </ Generated>

    public init(navitiaConfiguration:NavitiaConfiguration) {
        self.navitiaConfiguration = navitiaConfiguration
        // <Generated>
        self.places = EndpointPlaces(navitiaConfiguration: self.navitiaConfiguration)
        // </ Generated>
    }
}
