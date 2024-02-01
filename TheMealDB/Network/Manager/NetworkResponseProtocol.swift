//
//  NetworkResponseProtocol.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import Foundation

protocol NetworkResponseProtocol {
    func didReceiveError(error: Error)
    func didReceivedDataFromAPI<T: Decodable>(data: T)
}
