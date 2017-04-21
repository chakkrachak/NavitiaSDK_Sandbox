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
        let url:String = "https://api.navitia.io/v1/places?q=gare&"
        print(url)
        let requestURL: NSURL = NSURL(string: url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
        urlRequest.addValue(self.navitiaConfiguration.token, forHTTPHeaderField: "Authorization")
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in

            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode

            if (statusCode == 200) {
                do {
                    let json:[String:AnyObject] = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String:AnyObject]

                    DispatchQueue.main.async {
                        callback((json["places"] as! [[String: AnyObject]])[0]["name"] as! String)
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