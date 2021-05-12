//
//  ViewController.swift
//  CookBook
//
//  Created by Bharat Kakadiya on 09/05/21.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet var signUp: UIButton!
    @IBOutlet var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        signUp.layer.cornerRadius = signUp.frame.size.height / 2
//        signUp.layer.borderWidth = 2
//        signUp.layer.borderColor = UIColor.gray.cgColor
//        
        login.layer.cornerRadius = login.frame.size.height / 2
        login.layer.borderWidth = 2
        login.layer.borderColor = UIColor.gray.cgColor
        
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

   
    
   
    @IBAction func login(_ sender: UIButton) {
        
        let aVc = storyboard?.instantiateViewController(identifier: "FoodListViewController") as! FoodListViewController
        navigationController?.pushViewController(aVc, animated: true)
    }
}

