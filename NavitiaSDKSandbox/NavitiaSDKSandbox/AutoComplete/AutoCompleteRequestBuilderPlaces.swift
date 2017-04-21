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

            let json:[String:AnyObject]
            if (statusCode == 200) {
                do {
                    json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String:AnyObject]
                } catch {
                    print("Error with Json: \(error)")
                }
            }
            else {
                print(statusCode)
            }
            DispatchQueue.main.async {
                callback("9e304161-bb97-4210-b13d-c71eaf58961c")
            }
        }

        task.resume()
    }
}