//
//  NetworkAbleProtocol.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import Foundation
import Combine

protocol NetworkAbleProtocol {
    
    func getDataFromApi<T:Decodable>(urlRequest: URLRequest, type: T.Type) -> AnyPublisher<T,Error> where T : Decodable
    
}
