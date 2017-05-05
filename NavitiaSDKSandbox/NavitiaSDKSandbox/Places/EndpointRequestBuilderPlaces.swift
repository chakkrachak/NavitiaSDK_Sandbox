//
// Created by Chakkra CHAK on 20/04/2017.
// Copyright (c) 2017 Chakkra CHAK. All rights reserved.
//

import Foundation

open class EndpointRequestBuilderPlaces: BaseNavitiaRequestBuilder {
    // <Generated>
    public required init(navitiaConfiguration: NavitiaConfiguration) {
        super.init(navitiaConfiguration: navitiaConfiguration, resourceUri: "/places")
    }
    // </ Generated>

    // <Generated>
    public func get(callback: @escaping (EndpointResponsePlaces) -> (Void)) {
        return self.genericGet(processResponseHandler: { (data: Data) -> EndpointResponsePlaces in
            let json: [String: AnyObject] = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]

            return EndpointResponsePlaces(json: json)!
        }, callback: callback)
    }
    // </ Generated>

    // <Generated>
    open func withQ(_ q: String) -> EndpointRequestBuilderPlaces {
        addQueryParameter(key: "q", value: q)
        return self
    }
    // </ Generated>

    // <Generated>
    open func withCount(_ count: Int) -> EndpointRequestBuilderPlaces {
        addQueryParameter(key: "count", value: count.description)
        return self
    }
    // </ Generated>
}
