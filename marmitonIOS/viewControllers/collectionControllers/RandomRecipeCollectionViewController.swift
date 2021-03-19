//
//  RecipeCollectionViewController.swift
//  marmitonIOS
//
//  Created by Anthony BAC on 17/03/2021.
//  Copyright © 2021 Group2. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class RecipeCollectionViewController: UICollectionViewController {
    var titre: String?
    var image:URL?
    var tab = ["Test", "Micro", "1 2", "3 4", "Encoretilfaluquejelesus", "Théo est en retard", "Etienne", "jambonneau", "xcode c'est de la merde", "Ta faute", "LOUL", "Il pleut putain", "Maitre Gimp", "Photoshiotte", "caca", "en effet"]

    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()


        self.getRandomRecipe { (data, error) in
            
   
            self.titre=data["title"] as! String
            
            if let img = data["image"] as? String {
                self.image =  URL(string:img)!
                print("DDAAAAATTTAAAAA")
                print(img)
            } else {
                self.image = URL(string:"https://spoonacular.com/recipeImages/638819-556x370.jpg")!
            }
            
            
            DispatchQueue.main.async{
                self.collectionView.reloadData()
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    func getRandomRecipe(completionHandler: @escaping (_ data: [String: AnyObject], _ error: Error?) -> Void) {
         
        let url = URL(string: "https://api.spoonacular.com/recipes/random/?apiKey=3506c2c0754a411eac810f09d947e250&number=6")!
                
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
                                
                               
                                
                                completionHandler(stuff, error)
                                
                                
                                //print(tosend)
                            }
                        }
                        
                    }
                }
                task.resume()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return tab.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RecipeNumber2CollectionViewCell
    
        // Configure the cell
        cell.backgroundColor = UIColor.red
        cell.label.text = titre
    
        if let url = self.image {
            if let data=try? Data(contentsOf: url){
                if let img = UIImage(data:data){
                    cell.imageView.image=img
                }
            }
        }
            
            return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
