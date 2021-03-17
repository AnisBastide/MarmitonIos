//
//  ApiRequest.swift
//  marmitonIos
//
//  Created by Anis Bastide on 17/03/2021.
//

import Foundation
public class ApiRequest{

    static func getData(){
        let headers = [
            "content-type": "application/xml",
            "x-rapidapi-key": "4f30b1a0aemsh862140ecea01fe2p128074jsn91c74301d4b9",
            "x-rapidapi-host": "mycookbook-io1.p.rapidapi.com"
        ]

        let postData = NSData(data: "https://www.jamieoliver.com/recipes/vegetables-recipes/superfood-salad/".data(using: String.Encoding.utf8)!)
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://mycookbook-io1.p.rapidapi.com/recipes/rapidapi")! as URL,cachePolicy:.useProtocolCachePolicy,timeoutInterval: 10.0)
        
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

}
