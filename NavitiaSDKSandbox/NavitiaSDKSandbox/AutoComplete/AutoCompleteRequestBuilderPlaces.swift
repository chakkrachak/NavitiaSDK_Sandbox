//
// Created by Chakkra CHAK on 20/04/2017.
// Copyright (c) 2017 Chakkra CHAK. All rights reserved.
//

import Foundation

public class AutoCompleteRequestBuilderPlaces {
    let navitiaConfiguration: NavitiaConfiguration

    public init(navitiaConfiguration: NavitiaConfiguration) {
        self.navitiaConfiguration = navitiaConfiguration
    }

    public func get(callback: @escaping (String) -> (Void)) {
        callback("9e304161-bb97-4210-b13d-c71eaf58961c")
    }
}