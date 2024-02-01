//
//  DessertsView.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import SwiftUI

struct DessertsView: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    
    @StateObject var viewModel = DessertsViewModel(networkManager: NetworkManager())
    
    var category: String = "Dessert"
    
    var body: some View {
        VStack(alignment: .center) {
            if viewModel.isLoading {
                LoadingView()
            }
            
            if viewModel.mealPreviewsList.isEmpty && !viewModel.isLoading {
                HStack {
                    Text("No recipe(s) found.")
                        .font(Font.system(.body))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 1)
                        .padding(.horizontal, 8)
                        .background(.green)
                        .cornerRadius(Constants.UI.cornerRadius, corners: .topRight)
                        .cornerRadius(Constants.UI.cornerRadius, corners: .bottomLeft)
                        .padding(.top)
                }
                .padding(.top, 0)
                .padding(.horizontal, 0)
            }
            
            if viewModel.mealPreviewsList.isNotEmpty {
                Text("Dessert")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                GridMealsView(
                    mealPreviewsList: viewModel.mealPreviewsList,
                    isLoading: .constant(false)
                )
            }
        }
        .padding(.horizontal)
        .onAppear {
            if viewModel.mealPreviewsList.isEmpty {
                viewModel.getMealsBy(category)
            }
        }
        .refreshable {
            viewModel.getMealsBy(category)
        }
        .background(
            NavigationLink(
                destination: MealDetailsView().environmentObject(coordinator),
                isActive: $coordinator.isPresentingMealDetailsView,
                label: EmptyView.init
            )
        )
    }
}

#Preview {
    DessertsView()
}
