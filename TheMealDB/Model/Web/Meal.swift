//
//  Meal.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import Foundation

struct Meal: Codable, Identifiable {
    let idMeal, strMeal: String
    let strDrinkAlternate: String?
    let strCategory, strArea, strInstructions: String
    let strMealThumb: String
    let strTags: String?
    let strYoutube: String?
    let strIngredient1, strIngredient2, strIngredient3, strIngredient4: String?
    let strIngredient5, strIngredient6, strIngredient7, strIngredient8: String?
    let strIngredient9, strIngredient10, strIngredient11, strIngredient12: String?
    let strIngredient13, strIngredient14, strIngredient15: String?
    let strIngredient16, strIngredient17, strIngredient18, strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1, strMeasure2, strMeasure3, strMeasure4: String?
    let strMeasure5, strMeasure6, strMeasure7, strMeasure8: String?
    let strMeasure9, strMeasure10, strMeasure11, strMeasure12: String?
    let strMeasure13, strMeasure14, strMeasure15: String?
    let strMeasure16, strMeasure17, strMeasure18, strMeasure19: String?
    let strMeasure20, strSource, strImageSource, strCreativeCommonsConfirmed: String?
    let dateModified: String?
    
    var id: String {
        UUID().uuidString
    }
    
    var strMealThumbPreview: String {
        strMealThumb+"/preview"
    }
    
    var arrayIngredientsAndMeasures: [[String: String]] {
        // Create a mirror of the `self` instance to reflect its properties
        let mirror = Mirror(reflecting: self)
        // Initialize arrays to store ingredients and measures
        var data: [[String:String]] = []
        var ingredientsArrayInt_: [Int:String] = [:]
        var measuresArrayInt_: [Int:String] = [:]
        
        // Iterate through each property of the `Meal` instance
        for (label, value) in mirror.children {
            // Check if the property name and value are not nil
            if let name = label, let value = value as? String {
                // Create a regular expression to match the numeric suffix in the property name
                let regex = try! NSRegularExpression(pattern: "\\d+$")
                // Find matches in the property name
                let matches = regex.matches(in: name, range: NSRange(name.startIndex..., in: name))
                // If a match is found, extract the numeric suffix and convert it to an integer
                if let match = matches.first {
                    let numberRange = Range(match.range, in: name)!
                    let number = Int(name[numberRange])!
                    // If the property represents an ingredient and its value is not empty, store it
                    if name.contains("strIngredient"), !value.isEmpty {
                        ingredientsArrayInt_[number] = value
                    }
                    // If the property represents a measure and its value is not empty, store it
                    if name.contains("strMeasure"), !value.isEmpty {
                        measuresArrayInt_[number] = value
                    }
                }
            }
        }
        
        // Combine the ingredients and measures into an array of dictionaries
        for (index, ingredient) in ingredientsArrayInt_ {
            var element = [String: String]()
            element[ingredient] = measuresArrayInt_[index]
            data.append(element)
        }
        // Finally, return the array of ingredient and measure dictionaries
        return data
    }
    
    init() {
        self.idMeal = ""
        self.strMeal = ""
        self.strDrinkAlternate = ""
        self.strCategory = ""
        self.strArea = ""
        self.strInstructions = ""
        self.strMealThumb = ""
        self.strTags = ""
        self.strYoutube = ""
        self.strIngredient1 = ""
        self.strIngredient2 = ""
        self.strIngredient3 = ""
        self.strIngredient4 = ""
        self.strIngredient5 = ""
        self.strIngredient6 = ""
        self.strIngredient7 = ""
        self.strIngredient8 = ""
        self.strIngredient9 = ""
        self.strIngredient10 = ""
        self.strIngredient11 = ""
        self.strIngredient12 = ""
        self.strIngredient13 = ""
        self.strIngredient14 = ""
        self.strIngredient15 = ""
        self.strIngredient16 = ""
        self.strIngredient17 = ""
        self.strIngredient18 = ""
        self.strIngredient19 = ""
        self.strIngredient20 = ""
        self.strMeasure1 = ""
        self.strMeasure2 = ""
        self.strMeasure3 = ""
        self.strMeasure4 = ""
        self.strMeasure5 = ""
        self.strMeasure6 = ""
        self.strMeasure7 = ""
        self.strMeasure8 = ""
        self.strMeasure9 = ""
        self.strMeasure10 = ""
        self.strMeasure11 = ""
        self.strMeasure12 = ""
        self.strMeasure13 = ""
        self.strMeasure14 = ""
        self.strMeasure15 = ""
        self.strMeasure16 = ""
        self.strMeasure17 = ""
        self.strMeasure18 = ""
        self.strMeasure19 = ""
        self.strMeasure20 = ""
        self.strSource = ""
        self.strImageSource = ""
        self.strCreativeCommonsConfirmed = ""
        self.dateModified = ""
    }    
}
