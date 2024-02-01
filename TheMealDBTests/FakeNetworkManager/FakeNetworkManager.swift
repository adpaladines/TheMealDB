//
//  FakeNetworkManager.swift
//  TheMealDBTests
//
//  Created by andres paladines on 2/1/24.
//

import Foundation
import Combine
@testable import TheMealDB

enum TestUseCase: String {
    case fullList
    case emptyList
    case wrongData
    case timeout
}

class FakeNetworkManager: NetworkAbleProtocol {

    var useCase: TestUseCase?

    func getDataFromApi<T>(urlRequest: URLRequest, type: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        if let usecase = useCase, usecase == .timeout {
            return Fail(error: NetworkError.timeOutError)
                .eraseToAnyPublisher()
        }
        let bundle = Bundle(for: FakeNetworkManager.self)
        let urlString = useCase != nil ? useCase!.rawValue : urlRequest.url?.absoluteString
        guard let url = bundle.url(forResource: urlString, withExtension: "json") else {
            return Fail(error: NetworkError.invalidUrlError)
                .eraseToAnyPublisher()
        }
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(type.self, from: data)
            return Just(response)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } catch let error {
            print(error.localizedDescription)
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
    }
}
