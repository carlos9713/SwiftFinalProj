


import UIKit
import CoreData

class RecipeViewController: UIViewController, UITextViewDelegate {

    let coreData = CoreDataModel()
    
    var foodImg : UIImage?
    var foodTit : String?
    var foodDesc : String?
    
    @IBOutlet var suggestion: UITextField!
    @IBOutlet var feedback: UITextField!
    @IBOutlet var save: UIButton!
    @IBOutlet var foodTitle: UILabel!
    @IBOutlet var foodImage: UIImageView!
    @IBOutlet var foodRecipe: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        foodRecipe.text = foodDesc
        foodTitle.text = foodTit
        foodImage.image = foodImg

        
        save.layer.cornerRadius = save.frame.size.height / 2
        save.layer.borderWidth = 2
        save.layer.borderColor = UIColor.gray.cgColor
        

    }

  
    
    @IBAction func saveData(_ sender: UIButton) {
        
        if feedback.text!.isEmpty || suggestion.text!.isEmpty
        {
            let alert = UIAlertController(title: "Invalid", message: "Please provide both credentials ", preferredStyle: .alert)
            
            let saveAction = UIAlertAction(title: "Okay", style: .default) { (action) in
                
            }
            alert.addAction(saveAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        else {
            
            let uFeedback = feedback.text
            let uSuggestion = suggestion.text
            let uTitle = foodTitle.text
            let uRecipe = foodRecipe.text
            let uFoodImage = self.foodImage.image!.pngData()
            
            var flage : Bool?
            
            flage = coreData.addUser(foodTitle: uTitle!, foodImage: uFoodImage!, foodRecipe: uRecipe!, suggestion: uSuggestion!, feedback: uFeedback!)
            
            if(flage!)
            {
                let alert = UIAlertController(title: "Congrats", message: "Succesfully save your data ", preferredStyle: .alert)
                
                let saveAction = UIAlertAction(title: "Okay", style: .default) { (action) in
                    
                }
                alert.addAction(saveAction)
                self.present(alert, animated: true, completion: nil)
            }
            
        }
    }

}
