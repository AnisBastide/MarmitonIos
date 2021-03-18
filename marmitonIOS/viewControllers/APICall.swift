//
//  APICall.swift
//  marmitonIOS
//
//  Created by amine amara on 18/03/2021.
//  Copyright © 2021 Group2. All rights reserved.
//

import Foundation

public class APICall {
    
    
    

    static func callAPI() {
        let url = URL(string: "https://api.spoonacular.com/recipes/random/?apiKey=d10d3dc0e119465f94422d73fcdb77cd")!
                
                let config = URLSessionConfiguration.default
                let sessions = URLSession(configuration: config)
               
                let task = sessions.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    } else {
                        if let json = try? JSONSerialization.jsonObject(with: data!) {
                            
                            if let data = json as? [String: AnyObject],
                               let recipes = data["recipes"] as? [AnyObject],
                               let stuff = recipes[0] as? [String: AnyObject] {
                                var tosend = ["title": stuff["title"], "image": stuff["image"], "id" : stuff["id"]]
                                print(tosend)
                            }
                        }
                    }
                }
                task.resume()
    }
}
