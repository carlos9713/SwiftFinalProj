

import UIKit

class FoodListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var cellClicked1 : ((Int) -> Void)?
    
    let foodNameArray = ["FRIES MCDONALD'S", "WAFFLE FRIES CHICK-FIL-A" , "DOUBLE-DOUBLE IN-N-OUT"  ]
    
    
    let recipe = ["Step 1 : Peel potatoes and julienne the peeled potatoes into shoestring french fries. They should be 1/4-inch by 1/4-inch thick and about 4 inches to 6 inches long, Step 2 : In a large bowl combine corn syrup and water, being sure to mix throughly until the corn syrup is evenly distributed. Add the french fries to the sugar water solution. Refrigerate for about 30 minutes. Step 3 : While the french fries are soaking, in a heavy bottomed stock pot or deep fryer, heat peanut oil in a deep fryer until it reaches 375ºF. Step 4 : Remove french fries from sugar water and pat dry. Carefully add them to the oil and partially fry them for 1 to 1 1/2 minutes. They should just start to turn a light golden brown. Remove them from the fryer and place on a paper towel-lined plate. Place them in the refrigerator for 10 to 15 minutes. Step 5 : While they're cooling, add the beef fat to the peanut oil. Heat the oil to 400ºF. Remove the french fries from the freezer and carefully add them back to the beef fat oil. Fry for 5 to 7 minutes or until they are golden brown. Drain the french fries and place in a large bowl. Step 6 : Sprinkle generously with salt and toss the fries until they are coated. Serve immediately." , "Our waffle fries recipe is as simple as they come. They require only three ingredients and a little bit of patience. But we guarantee an end result that will be absolutely worth the effort. To get that criss cut fries look, we recommend using a mandolin or a waffle fry cutter to cut the potatoes. You can check out our CAQ section down below to learn more about how to cut them!These waffle fries are double fried and then served with a sprinkling of salt. The add on step of double frying makes the fries crisper than your normal fry and packs a lot of flavors. We’re sure the kids will have fun munching on these waffle potato fries, and so will you!Change up your usual french fries and potato wedges for these crispy waffle fries! Dip them in some ketchup or even this Savory Burger King Onion Ring Sauce. These criss cut fries like Chick-fil-A’s are such a fun snack to enjoy with friends and family, especially on a good cookout. If you’re looking for more potato dishes, these baked potatoes are excellent to have with your main course.Take a chance on our waffle fries recipe by trying them today!", "Measure out 16 (2-ounce) patties of meat and flatten each patty to a thickness of approximately 1/4 inch. Season each side of the patty with a pinch of salt and set aside while you heat the griddle. Toast the buns, cut-side down, on the griddle just until the cut sides begin to toast, about 30 seconds. Remove from heat and set aside.Heat a griddle pan over medium heat until hot. Cook the burgers on one side until the patties start to brown, 45 seconds to 1 minute. Flip the burgers, adding a slice of cheese to the browned tops of each one. Continue to cook until the burgers are cooked and the cheese is beginning to melt, about 1 minute more. Remove from heat.To assemble the burgers, slather about 1 tablespoon sauce on the toasted top and bottom of each bun. On the bottom of each bun, layer two lettuce leaves, a slice of tomato, one cheeseburger patty, a few onion rings, another cheeseburger patty and the top burger bun. Repeat with the remaining ingredients to form eight burgers. Serve immediately."]
    
    let foodRecipeArray = ["Tastes like McDonald’s fries is the highest compliment you can give a french fry. Also, no other fast-food item has a Kanye West poem written about it. “I don't trust no food that smells that good, man,” he says of the fries in “McDonald’s Man,let's Make McDonald's Fries" , "The World where Scott tells Ramona that, were he to have his way, he’d eat garlic bread forever without ever having to stop? I could probably do that with Chick-fil-A waffle fries. Except then I'd get fat. Fries make you fat" , "There's one small change that can take the Double-Double from “best burger ever” to “literal perfection between two buns.” Ask for grilled onions—instead of the sliced onion—the next time you order one. It gets you halfway to Animal Style for free."]
    
    let imageArray = [UIImage(named: "fries"),UIImage(named: "waffle"),UIImage(named: "double")]
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "RecipeTableViewCell", bundle: .main), forCellReuseIdentifier: "RecipeTableViewCell")
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }


}
extension FoodListViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCell", for: indexPath)
        as! RecipeTableViewCell
        
        cellClicked1 = { index in
            
            let aVc =  self.storyboard?.instantiateViewController(identifier: "RecipeViewController") as! RecipeViewController
            
            aVc.foodTit = self.foodNameArray[index]
            aVc.foodImg = self.imageArray[index]
            aVc.foodDesc = self.recipe[index]
            
            self.navigationController?.pushViewController(aVc, animated: true)
            tableView.reloadData()
        }
      
        cell.setUserData(fName: foodNameArray[indexPath.row], rTitle: foodRecipeArray[indexPath.row], fImage: imageArray[indexPath.row]! , time: "Added 3h Ago")
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        cellClicked1!(indexPath.row)
    }
 
}
