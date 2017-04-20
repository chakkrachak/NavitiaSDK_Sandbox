//
// Created by Chakkra CHAK on 20/04/2017.
// Copyright (c) 2017 Chakkra CHAK. All rights reserved.
//

import Foundation

public class AutoCompleteFeatureResourcePlaces {
    let navitiaConfiguration: NavitiaConfiguration

    public class AutoCompleteRequestBuilderPlaces {
        let navitiaConfiguration: NavitiaConfiguration

        public init(navitiaConfiguration: NavitiaConfiguration) {
            self.navitiaConfiguration = navitiaConfiguration
        }

        public func get() -> String {
            return self.navitiaConfiguration.token
        }
    }

    public init(navitiaConfiguration: NavitiaConfiguration) {
        self.navitiaConfiguration = navitiaConfiguration
    }

    public func newRequestBuilder() -> AutoCompleteRequestBuilderPlaces {
        return AutoCompleteRequestBuilderPlaces(navitiaConfiguration: self.navitiaConfiguration)
    }
}