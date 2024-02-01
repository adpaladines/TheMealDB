//
//  NetworkManager.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import Foundation
import Combine

class NetworkManager: NetworkAbleProtocol {
    
    func getFakeData(urlRequest: URLRequest) -> AnyPublisher<Data, Error>? {
        guard let myData = "New Data from login".data(using: .utf8) else {
            return Fail(error: NSError(domain: "Error", code: 9)).eraseToAnyPublisher()
        }
        return Just(myData)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func getDataFromApi<T>(urlRequest: URLRequest, type: T.Type) -> AnyPublisher<T, Error> where T: Decodable {
        
        let customConfiguration = URLSessionConfiguration.default
        
        //Ignores any locally cached data. Always tries to fetch fresh data from the server.
        customConfiguration.requestCachePolicy = .reloadIgnoringLocalCacheData

        //Specifies the timeout duration for individual network requests, in seconds.
        customConfiguration.timeoutIntervalForRequest = 20
        
        //Sets the maximum duration for the entire resource transfer process, including both the request and response phases, in seconds.
        customConfiguration.timeoutIntervalForResource = 30

        // Optimizatiopn for responsiveness. Suitable for small amounts of data.
        customConfiguration.networkServiceType = .responsiveData

        // Allow cellular access for this session
        customConfiguration.allowsCellularAccess = true

        // Create a URLSession with the custom configuration
        let customSession = URLSession(configuration: customConfiguration)
        
        return customSession.dataTaskPublisher(for: urlRequest)
            .tryMap({ (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                    if (response as? HTTPURLResponse)?.statusCode == 404 {
                        throw NetworkError.dataNotFoundError
                    }else {
                        throw NetworkError.responseError
                    }
                }
                return data
            })
            .decode(type: type.self, decoder: JSONDecoder()) // - Parsing
            .eraseToAnyPublisher()
    }

}
