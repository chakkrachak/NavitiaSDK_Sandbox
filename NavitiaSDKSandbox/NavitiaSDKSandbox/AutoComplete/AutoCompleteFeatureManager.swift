//
// Created by Chakkra CHAK on 20/04/2017.
// Copyright (c) 2017 Chakkra CHAK. All rights reserved.
//

import Foundation

public class AutoCompleteFeatureManager {
    let navitiaConfiguration:NavitiaConfiguration
    let places:AutoCompleteFeatureResourcePlaces

    public init(navitiaConfiguration:NavitiaConfiguration) {
        self.navitiaConfiguration = navitiaConfiguration
        self.places = AutoCompleteFeatureResourcePlaces(navitiaConfiguration: self.navitiaConfiguration)
    }
}