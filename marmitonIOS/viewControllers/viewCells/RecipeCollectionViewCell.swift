//
//  RecipeCollectionViewCell.swift
//  marmitonIOS
//
//  Created by Anthony BAC on 17/03/2021.
//  Copyright © 2021 Group2. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label : UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func clickToRecipe(_ sender:Any) {
        /*if let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(identifier: "recipe") as? UIViewController {
            self.navigationController?.pushViewController(vc, animated:true)
        }*/
    }
}
