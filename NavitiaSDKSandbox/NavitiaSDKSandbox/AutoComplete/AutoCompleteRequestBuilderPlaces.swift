//
// Created by Chakkra CHAK on 20/04/2017.
// Copyright (c) 2017 Chakkra CHAK. All rights reserved.
//

import Foundation

public class AutoCompleteRequestBuilderPlaces : BaseNavitiaRequestBuilder, ProtocolNavitiaRequestBuilder {
    // <Generated>
    public required init(navitiaConfiguration: NavitiaConfiguration) {
        super.init(navitiaConfiguration: navitiaConfiguration, resourceUri: "/places")
    }
    // </ Generated>

    // <Generated>
    public func get(callback: @escaping ([String:AnyObject]) -> (Void)) {
        return self.genericGet(callback: callback)
    }
    // </ Generated>
}
