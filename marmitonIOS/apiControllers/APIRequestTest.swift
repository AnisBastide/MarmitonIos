//
//  APIRequestTest.swift
//  marmitonIOS
//
//  Created by Anthony BAC on 17/03/2021.
//  Copyright © 2021 Group2. All rights reserved.
//

import Foundation

func test() {
    let headers = [
        "content-type": "application/xml",
        "x-rapidapi-key": "2892a4ec47mshaa949b2e7c46784p11ede8jsn8e1f467c8c54",
        "x-rapidapi-host": "mycookbook-io1.p.rapidapi.com"
    ]

    let postData = NSData(data: "https://www.jamieoliver.com/recipes/vegetables-recipes/superfood-salad/".data(using: String.Encoding.utf8)!)

    let request = NSMutableURLRequest(url: NSURL(string: "https://mycookbook-io1.p.rapidapi.com/recipes/rapidapi")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    request.httpBody = postData as Data

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error)
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
        }
    })

    dataTask.resume()
}
