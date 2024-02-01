//
//  PathUrl.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import Foundation

enum PathUrl {
    
    case filterCategory(str: String)
    case lookupForId(str: String)
    
    func getString() -> String {
        var newValue = "category/"
        switch self {
        case .filterCategory(let str):
            newValue = "filter.php?c=\(str)"
        case .lookupForId(let str):
            newValue = "lookup.php?i=\(str)"
        }
        
        return newValue
    }
}
