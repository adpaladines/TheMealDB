//
//  MealsFilterResponse.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.

///Just: https://themealdb.com/api/json/v1/1/filter.php?c=Dessert

import Foundation

struct MealsFilterResponse: Codable, Identifiable {
    let meals: [MealPreview]
    var strCategory: String?

    var id: String {
        UUID().uuidString
    }
}


