//
// Created by Chakkra CHAK on 25/04/2017.
// Copyright (c) 2017 Chakkra CHAK. All rights reserved.
//

import Foundation

public class NavitiaFeatures {
    let navitiaConfiguration:NavitiaConfiguration
    public let autoComplete: EndpointPlaces

    public init(navitiaConfiguration:NavitiaConfiguration) {
        self.navitiaConfiguration = navitiaConfiguration
        self.autoComplete = EndpointPlaces(navitiaConfiguration: self.navitiaConfiguration)
    }
}