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
    public func rawGet(callback: @escaping ([String:AnyObject]) -> (Void)) {
        return self.genericGet(callback: callback)
    }
    // </ Generated>

    // <Generated>
    public func withQuery(_ q: String) -> AutoCompleteRequestBuilderPlaces {
        queryParameters["q"] = q
        return self
    }
    // </ Generated>

    // <Generated>
    public func withCount(_ count: Int) -> AutoCompleteRequestBuilderPlaces {
        queryParameters["count"] = count.description
        return self
    }
    // </ Generated>
}
