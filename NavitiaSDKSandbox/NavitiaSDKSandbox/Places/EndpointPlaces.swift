//
// Created by Chakkra CHAK on 20/04/2017.
// Copyright (c) 2017 Chakkra CHAK. All rights reserved.
//

import Foundation

open class EndpointPlaces {
    let navitiaConfiguration: NavitiaConfiguration

    public init(navitiaConfiguration: NavitiaConfiguration) {
        self.navitiaConfiguration = navitiaConfiguration
    }

    open func newRequestBuilder() -> EndpointRequestBuilderPlaces {
        return EndpointRequestBuilderPlaces(navitiaConfiguration: self.navitiaConfiguration)
    }
}
