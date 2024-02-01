//
//  AppCoordinator.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import Foundation
import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var selectedItem: Meal?
    @Published var isPresentingMealDetailsView = false
    @Published var selectedPreviewMeal: MealPreview?

    func start() -> some View {
        let viewModel = DessertsViewModel(networkManager: NetworkManager())
        let view = DessertsView(viewModel: viewModel)
            .environmentObject(self)
        return view
    }

    func navigateToMealDetailsViewFor(_ selectedPreviewMeal: MealPreview) {
        self.isPresentingMealDetailsView = true
        self.selectedPreviewMeal = selectedPreviewMeal
    }
    
}
