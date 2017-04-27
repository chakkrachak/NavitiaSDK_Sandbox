//
// Created by Chakkra CHAK on 21/04/2017.
// Copyright (c) 2017 Chakkra CHAK. All rights reserved.
//

import Foundation

public class BaseNavitiaRequestBuilder {
    var navitiaConfiguration: NavitiaConfiguration
    var resourceUri: String
    private var queryParameters: [String: String]

    public init(navitiaConfiguration: NavitiaConfiguration, resourceUri: String) {
        self.navitiaConfiguration = navitiaConfiguration
        self.resourceUri = resourceUri
        self.queryParameters = [:]
    }

    public func addQueryParameter(key: String, value: String) {
        queryParameters[key] = value
    }

    public func getUrl() -> String {
        var queryParametersResult: [String] = []
        for (key, value) in self.queryParameters {
            queryParametersResult.append(key + "=" + value)
        }

        var urlResult: String = self.navitiaConfiguration.baseUrl
                + self.resourceUri
                + "?" + queryParametersResult.joined(separator: "&")

        return urlResult
    }

    public func rawGet(callback: @escaping ([String: AnyObject]) -> (Void)) {
        return self.genericGet(
                processResponseHandler: { (data: Data) -> [String: AnyObject] in
                    return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
                },
                callback: callback)
    }

    func genericGet<T>(processResponseHandler: @escaping (Data) throws -> T, callback: @escaping (T) -> (Void)) {
        let requestURL: NSURL = NSURL(string: getUrl().addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
        urlRequest.addValue(self.navitiaConfiguration.token, forHTTPHeaderField: "Authorization")
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in

            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode

            if (statusCode == 200) {
                do {
                    let responseJson: T = try processResponseHandler(data!)

                    DispatchQueue.main.async {
                        callback(responseJson)
                    }
                } catch {
                    print("Error with Json: \(error)")
                }
            } else {
                print(statusCode)
            }
        }

        task.resume()
    }
}