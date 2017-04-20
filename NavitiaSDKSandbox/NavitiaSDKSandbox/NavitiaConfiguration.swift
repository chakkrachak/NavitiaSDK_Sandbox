//
// Created by Chakkra CHAK on 20/04/2017.
// Copyright (c) 2017 Chakkra CHAK. All rights reserved.
//

import Foundation

class NavitiaConfiguration {
    let token:String
    let baseUrl:String = "https://api.navitia.io/v1"

    init(token: String) {
        self.token = token
    }
}