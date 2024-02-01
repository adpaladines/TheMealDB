//
//  Api.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import Foundation

struct UrlManager {

    private static let baseUrl = "https://www.themealdb.com/"

    private static let api = "api/json/v1/1/"

    //getting image path from name adding underscores.
    static func image(_ name: String) -> String? {
        guard let urlName = name
            .replacingOccurrences(of: " ", with: "_")
            .lowercased()
            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        else {
            return nil
        }
        return "images/ingredients/\(urlName).png"
    }

    static func api(_ pathString: PathUrl? = nil) -> String {
        guard let newPath = pathString else {
            return baseUrl + api
        }

        let path = baseUrl + api + newPath.getString()
        return path
    }

//    static func fake(_ file: FakeFile) -> String {
//        file.rawValue
//    }
    
}
