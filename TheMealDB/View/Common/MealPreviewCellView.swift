//
//  MealPreviewCellView.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import SwiftUI
import Kingfisher

struct MealPreviewCellView: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    
    var mealPreview: MealPreview
    var category: String = ""
    var cornerRadius: Double = 12
    
    @State var isLoading = true
    @State var hasError = false
    @State var isFavorite: Bool = false
    @State var placeHolderImage: String = "meal-placeholder"
    
    @ViewBuilder
    func presentPlaceHolder() -> some View {
        Image(placeHolderImage)
            .resizable()
            .scaledToFit()
            .frame(height: 146)
            .frame(maxWidth: .infinity, alignment: .center)
            .cornerRadius(cornerRadius)
            .shadow(color: .accentColor.opacity(0.3), radius: 5)
            .padding(.top)
    }
    
    @ViewBuilder
    func presentErrorImage() -> some View {
        HStack {
            Spacer()
            Text(category.isEmpty ? "Without category": category)
                .font(Font.system(.body))
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding(.vertical, 1)
                .padding(.horizontal, 8)
                .background(.green)
                .cornerRadius(cornerRadius, corners: .topRight)
                .cornerRadius(cornerRadius, corners: .bottomLeft)
                .padding(.top)
        }
        .padding(.top, 0)
        .padding(.horizontal, 0)
    }
    
    @ViewBuilder 
    func presentImage(from url: URL) -> some View {
        KFImage.url(url)
            .onSuccess { r in
                isLoading = false
                hasError = false
            }
            .placeholder { p in
                ZStack(alignment: .center) {
                    Image(placeHolderImage)
                        .resizable()
                        .frame(width: 48, height: 48)
                }
            }
            .onFailure({ error in
                isLoading = false
                hasError = true
                placeHolderImage = "no-data-found-wide"
            })
            .resizable()
            .scaledToFill()
            .frame(height: 146)
            .frame(maxWidth: .infinity, alignment: .center)
            .cornerRadius(cornerRadius)
            .shadow(color: .primary.opacity(0.3), radius: 5)
            .padding(.top)
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                if let url = URL(string: mealPreview.strMealThumbPreview), !hasError {
                    presentImage(from: url)
                }else  {
                    presentPlaceHolder()
                }
                if !hasError {
                    presentErrorImage()
                }
            }
            .padding(.horizontal)
            HStack {
                Text(mealPreview.strMeal)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary.opacity(0.75))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.bottom)
            }
        }
        .background(Color.shadowColorApp)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black.opacity(0.07), lineWidth: 2)
        )
        .onTapGesture {
            coordinator.navigateToMealDetailsViewFor(mealPreview)
        }
    }
}

#Preview {
    MealPreviewCellView(
        mealPreview:
            MealPreview(
                strMeal: "Baked salmon",
                strMealThumb: "https://www.themealdb.com/images/media/meals/1548772327.jpg",
                idMeal: "52959"
            ),
        isFavorite: false
    )
}
