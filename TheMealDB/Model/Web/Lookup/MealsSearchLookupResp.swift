//
//  MealsSearchLookupResp.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import Foundation

struct MealsSearchLookupResp: Codable, Identifiable {
    let meals: [Meal]

    var id: Int {
        let someDate = Date()
        let timeInterval = someDate.timeIntervalSince1970
        let myInt = Int(timeInterval)
        return myInt
    }
}
