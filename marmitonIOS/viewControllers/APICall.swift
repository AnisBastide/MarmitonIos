//
//  APICall.swift
//  marmitonIOS
//
//  Created by amine amara on 18/03/2021.
//  Copyright © 2021 Group2. All rights reserved.
//

import Foundation

public class APICall {

    static func callRandomRecipes() -> [String:AnyObject?]{
        var dataToReturn:[String:AnyObject?]? = nil
        let url = URL(string: "https://api.spoonacular.com/recipes/random/?apiKey=d10d3dc0e119465f94422d73fcdb77cd&number=6")!
                
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
                                let tosend = ["title": stuff["title"], "image": stuff["image"], "id" : stuff["id"]]
                                dataToReturn = tosend
                                print(tosend)
                            }
                        }
                        
                    }
                }
                task.resume()
        return dataToReturn ?? ["":nil]
    }
    
    static func searchByIngredients(ingredients : [String]) {
        
        var ingredientsURL = ""
        for ingredient in ingredients {
            ingredientsURL += "+" + ingredient + ","
        }
        
        var url = URL(string: "https://api.spoonacular.com/recipes/findByIngredients?ingredients="+ingredientsURL+"&number=3&apiKey=d10d3dc0e119465f94422d73fcdb77cd")!
        
        
                
        let config = URLSessionConfiguration.default
        let sessions = URLSession(configuration: config)
               
                let task = sessions.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    } else {
                        if let json = try? JSONSerialization.jsonObject(with: data!) {
                            print(json)
                            /*if let data = json as? [String: AnyObject],
                               let recipes = data["recipes"] as? [AnyObject],
                               let stuff = recipes[0] as? [String: AnyObject] {
                                let tosend = ["title": stuff["title"], "image": stuff["image"], "id" : stuff["id"]]
                                print(tosend)
                            }*/
                        }
                        
                    }
                }
                task.resume()
    }
    
    static func searchById(idRecipe: Int) {
        
        var url = URL(string: "https://api.spoonacular.com/recipes/"+String(idRecipe)+"/information?apiKey=d10d3dc0e119465f94422d73fcdb77cd")!
        
        
                
        let config = URLSessionConfiguration.default
        let sessions = URLSession(configuration: config)
               
                let task = sessions.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    } else {
                        if let json = try? JSONSerialization.jsonObject(with: data!) {
                            print(json)
                            /*if let data = json as? [String: AnyObject],
                               let recipes = data["recipes"] as? [AnyObject],
                               let stuff = recipes[0] as? [String: AnyObject] {
                                let tosend = ["title": stuff["title"], "image": stuff["image"], "id" : stuff["id"]]
                                print(tosend)
                            }*/
                        }
                        
                    }
                }
                task.resume()
    }
}
