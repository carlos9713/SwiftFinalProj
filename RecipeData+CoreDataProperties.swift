//
//  RecipeData+CoreDataProperties.swift
//  CookBook
//
//  Created by Bharat Kakadiya on 09/05/21.
//
//

import Foundation
import CoreData


extension RecipeData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeData> {
        return NSFetchRequest<RecipeData>(entityName: "RecipeData")
    }

    @NSManaged public var title: String?
    @NSManaged public var recipeImage: Data?
    @NSManaged public var recipe: String?
    @NSManaged public var suggestion: String?
    @NSManaged public var feedback: String?

}

extension RecipeData : Identifiable {

}
