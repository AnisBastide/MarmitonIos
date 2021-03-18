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
<<<<<<< HEAD
    var titre: String?
    var image:String?
=======
    @IBOutlet weak var imageView: UIImageView!
    
>>>>>>> TableViewControllerTest
    var tab = ["Test", "Micro", "1 2", "3 4", "Encoretilfaluquejelesus", "Théo est en retard", "Etienne", "jambonneau", "xcode c'est de la merde", "Ta faute", "LOUL", "Il pleut putain", "Maitre Gimp", "Photoshiotte", "caca", "en effet"]

    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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

    public func getRandomRecipe(){
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
                                self.titre=tosend["title"] as! String
                                self.image = tosend["image"] as! String
                                DispatchQueue.main.async{
                                    self.collectionView.reloadData()
                                }
                                
                                print(tosend)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RecipeCollectionViewCell
    
        // Configure the cell
        cell.backgroundColor = UIColor.red
        getRandomRecipe()
        cell.label.text = titre

        let urlTest = URL(string: "https://spoonacular.com/recipeImages/638819-556x370.jpg")
        
        if let data = try? Data(contentsOf: urlTest!) {
            print("test ", data)
            print("test2 ", urlTest!)

            if let image = UIImage(data: data) {
                print("Toast", image == nil)
                imageView.image = image
            }
            //imageView.image = UIImage(data: data)
        }
        
        
        cell.label.text = tab[indexPath.row]

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
