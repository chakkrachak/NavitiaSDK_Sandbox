//
// Created by Chakkra CHAK on 21/04/2017.
// Copyright (c) 2017 Chakkra CHAK. All rights reserved.
//

import Foundation

public class BaseNavitiaRequestBuilder {
    var navitiaConfiguration: NavitiaConfiguration
    var resourceUri:String

    public init(navitiaConfiguration: NavitiaConfiguration, resourceUri: String) {
        self.navitiaConfiguration = navitiaConfiguration
        self.resourceUri = resourceUri
    }

    public func url() -> String {
        return navitiaConfiguration.baseUrl
                + resourceUri
                + "?q=gare&"
    }

    func processResponse<T>(data: Data) throws -> T {
        return try JSONSerialization.jsonObject(with: data, options:.allowFragments) as! T
    }

    func genericGet<T>(callback: @escaping (T) -> (Void)) {
        let requestURL: NSURL = NSURL(string: url().addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
        urlRequest.addValue(self.navitiaConfiguration.token, forHTTPHeaderField: "Authorization")
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in

            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode

            if (statusCode == 200) {
                do {
                    let responseJson:T = try self.processResponse(data: data!)

                    DispatchQueue.main.async {
                        callback(responseJson)
                    }
                } catch {
                    print("Error with Json: \(error)")
                }
            }
            else {
                print(statusCode)
            }
        }

        task.resume()
    }
}