//
//  RecipeTableViewCell.swift
//  CookBook
//
//  Created by Bharat Kakadiya on 09/05/21.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet var foodName: UILabel!
    @IBOutlet var recipeTitle: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var foodImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func setUserData(fName: String ,rTitle: String , fImage : UIImage , time: String)
    {
        foodName.text = fName
        recipeTitle.text = rTitle
        foodImage.image = fImage
        self.time.text = time
    }
    
    @IBAction func like(_ sender: UIButton) {
        
            UIView.animate(withDuration: 0.5,delay: 0.1,options: .curveLinear, animations: {
                sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                sender.isSelected = !sender.isSelected
                
            }){(success) in
                
                UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {sender.transform = .identity}, completion: nil)
            }
      
    }
}
