//
//  MealPreview.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import Foundation

struct MealPreview: Codable, Identifiable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String

    var id: String {
        idMeal
    }

    var strMealThumbPreview: String {
        strMealThumb+"/preview"
    }
    

    init(strMeal: String, strMealThumb: String, idMeal: String) {
        self.strMeal = strMeal
        self.strMealThumb = strMealThumb
        self.idMeal = idMeal
    }
    
//    init() {
//        self.strMeal = ""
//        self.strMealThumb = ""
//        self.idMeal = ""
//    }
}
