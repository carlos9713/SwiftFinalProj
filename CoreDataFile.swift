//
//  CoreDataFile.swift
//  CookBook
//
//  Created by Bharat Kakadiya on 09/05/21.
//

import Foundation
import CoreData
import UIKit

class CoreDataModel{
    
    private static var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var users: [RecipeData]?
    public func addUser(foodTitle : String , foodImage: Data , foodRecipe : String , suggestion : String , feedback: String) -> Bool
    {
        do {
            let newUser = RecipeData(context: CoreDataModel.context)
            newUser.title = foodTitle
            newUser.recipeImage = foodImage
            newUser.recipe = foodRecipe
            newUser.suggestion = suggestion
            newUser.feedback = feedback
            
            try CoreDataModel.context.save()
        } catch  {
            
        }
        return true
    }
    
}
