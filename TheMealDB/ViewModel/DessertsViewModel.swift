//
//  DessertsViewModel.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import Foundation
import Combine

class DessertsViewModel: ObservableObject {
    
    @Published var customError: NetworkError?
    @Published var isLoading: Bool = false
    
    @Published var mealPreviewsList: [MealPreview] = []
    @Published var mealPreviewsListFiltered: [MealPreview] = []
    
    private let networkManager: NetworkAbleProtocol
    private var cancellables = Set<AnyCancellable>()

    init(networkManager: NetworkAbleProtocol) {
        self.networkManager = networkManager
    }
    
    func getMealsBy(_ category: String = "Dessert") {
        isLoading = true
        let urlString = UrlManager.api(.filterCategory(str: category))

        guard let url = URL(string: urlString) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        self.networkManager.getDataFromApi(urlRequest: urlRequest, type: MealsFilterResponse.self)
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
            }, receiveValue: { [weak self] mealPreviewsResponse in
                guard let self_ = self else {
                    print("SELF FAILED!")
                    return
                }
                var newCat = mealPreviewsResponse
                newCat.strCategory = category
                self_.mealPreviewsList = newCat.meals
                self_.mealPreviewsListFiltered = newCat.meals
            })
            .store(in: &cancellables)
    }
    
}
