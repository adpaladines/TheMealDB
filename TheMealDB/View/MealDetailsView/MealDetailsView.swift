//
//  MealDetailsView.swift
//  TheMealDB
//
//  Created by andres paladines on 2/1/24.
//

import SwiftUI

struct MealDetailsIngredientsView: View {
    
    var selectedMeal: Meal
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(selectedMeal.arrayIngredientsAndMeasures, id: \.self) { ingredient in
                if let ingredient = ingredient.first {
                    HStack {
                        Text(ingredient.key)
                            .font(.body)
                            .fontWeight(.medium)
                        Spacer()
                        Text(ingredient.value)
                            .font(.body)
                            .fontWeight(.regular)
                    }
                }else {
                    HStack {
                        Text("Ingredients")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                        Text("Measure")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                }
                
            }
        }
    }
}

struct MealDetailsIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailsIngredientsView(selectedMeal: Meal())
    }
}

struct MealDetailsView: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    
    @StateObject var mealDetailsViewModel = MealDetailsViewModel(networkManager: NetworkManager())

    @State private var hideNavigationbar: Bool = true
    
    var body: some View {
        
        VStack(alignment: .leading) {
            MealDetailsHeaderView(title: coordinator.selectedPreviewMeal?.strMeal)
            
            ScrollView {
                HStack {
                    VStack(spacing: 4) {
                        Text("Media")
                            .font(.title)
                            .padding(.top)
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 48, height: 3)
                            .foregroundColor(.green)
                        
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                
                MealDetailsMediaView(
                    imageUrl: mealDetailsViewModel.selectedMeal?.strMealThumb,
                    videoUrl: mealDetailsViewModel.selectedMeal?.strYoutube
                )

                if let meal = mealDetailsViewModel.selectedMeal {
                    MealDetailsIngredientsView(selectedMeal: meal)
                    .padding()
                }
                
                HStack {
                    VStack(spacing: 4) {
                        Text("Instructions")
                            .font(.title)
                            .padding(.top)
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 48, height: 3)
                            .foregroundColor(.green)
                        
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                Text((mealDetailsViewModel.selectedMeal?.strInstructions ?? "").replacingOccurrences(of: "\n", with: "\n\n"))
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
            }
            .padding(.horizontal)
            .onAppear {
                mealDetailsViewModel.fetchMealById(coordinator.selectedPreviewMeal?.idMeal)
            }
            .navigationBarHidden(hideNavigationbar)
        }
    }
}

#Preview {
    MealDetailsView()
}
