//
//  MealDetailsViewModel.swift
//  TheMealDB
//
//  Created by andres paladines on 2/1/24.
//

import Foundation
import Combine

class MealDetailsViewModel: ObservableObject {
    
    @Published var customError: NetworkError?
    @Published var isLoading: Bool = false
    @Published var selectedMeal: Meal?
    
    private let networkManager: NetworkAbleProtocol
    private var cancellables = Set<AnyCancellable>()

    init(networkManager: NetworkAbleProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchMealById(_ id: String?) {
        guard let id = id else {
            self.customError = .invalidUrlError
            return
        }
        let urlString = UrlManager.api(.lookupForId(str: id))
        guard let url = URL(string: urlString) else {
            self.customError = .invalidUrlError
            return
        }
        let urlRequest = URLRequest(url: url)
        self.networkManager.getDataFromApi(urlRequest: urlRequest, type: MealsSearchLookupResp.self)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isLoading = false
                case .failure(let error):
                    self.customError = NetworkError.getNetwork(error: error)
                    print(error.localizedDescription)
                    self.isLoading = false
                }
            }, receiveValue: { [weak self] value in
                if let meal = value.meals.first {
                    self?.selectedMeal = meal
                }
            })
            .store(in: &cancellables)
    }
    
}
