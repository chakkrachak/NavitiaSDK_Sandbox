//
// Created by Chakkra CHAK on 20/04/2017.
// Copyright (c) 2017 Chakkra CHAK. All rights reserved.
//

import Foundation

public class NavitiaSDK {
    let configuration:NavitiaConfiguration
    let endPoints:NavitiaEndpoints
    let features:NavitiaFeatures

    public init(configuration:NavitiaConfiguration) {
        self.configuration = configuration
        self.endPoints = NavitiaEndpoints(navitiaConfiguration: self.configuration)
        self.features = NavitiaFeatures(navitiaConfiguration: self.configuration)
    }
}