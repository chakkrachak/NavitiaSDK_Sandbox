//
// Created by Chakkra CHAK on 21/04/2017.
// Copyright (c) 2017 Chakkra CHAK. All rights reserved.
//

import Foundation

protocol ProtocolNavitiaRequestBuilder {
    init(navitiaConfiguration: NavitiaConfiguration);
    func rawGet(callback: @escaping ([String:AnyObject]) -> (Void));
    func getUrl() -> String;
}