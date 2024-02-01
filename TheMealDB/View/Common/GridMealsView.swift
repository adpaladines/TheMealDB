//
//  GridMealsView.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import SwiftUI

struct GridMealsView: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    
    @Binding var isLoading: Bool
    
    var mealPreviewsList: [MealPreview]
    var category: String

    init(mealPreviewsList: [MealPreview], category: String = "Dessert", isLoading: Binding<Bool>) {
        self.mealPreviewsList = mealPreviewsList
        self.category = category
        _isLoading = isLoading
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 16) {
                if isLoading {
                    LoadingView()
                }else {
                    ForEach(mealPreviewsList) { meal in
                        MealPreviewCellView(mealPreview: meal, category: category)
                            .environmentObject(coordinator)
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.2), radius: 10)
                            .frame(
                                width: 320,
                                alignment: .center
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    GridMealsView(
        mealPreviewsList: [],
        category: "Dessert",
        isLoading: .constant(false)
    )
    .environmentObject(AppCoordinator())
}
