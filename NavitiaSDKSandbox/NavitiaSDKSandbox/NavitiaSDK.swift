//
// Created by Chakkra CHAK on 20/04/2017.
// Copyright (c) 2017 Chakkra CHAK. All rights reserved.
//

import Foundation

public class NavitiaSDK {
    let configuration:NavitiaConfiguration
    let autoComplete:AutoCompleteFeatureManager

    public init(configuration:NavitiaConfiguration) {
        self.configuration = configuration
        self.autoComplete = AutoCompleteFeatureManager(navitiaConfiguration: self.configuration)
    }
}