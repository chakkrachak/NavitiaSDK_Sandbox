//
// Created by Chakkra CHAK on 20/04/2017.
// Copyright (c) 2017 Chakkra CHAK. All rights reserved.
//

import Foundation

public class EndpointRequestBuilderPlaces: BaseNavitiaRequestBuilder, ProtocolNavitiaRequestBuilder {
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
    public func withQ(_ q: String) -> EndpointRequestBuilderPlaces {
        queryParameters["q"] = q
        return self
    }
    // </ Generated>

    // <Generated>
    public func withCount(_ count: Int) -> EndpointRequestBuilderPlaces {
        queryParameters["count"] = count.description
        return self
    }
    // </ Generated>
}
