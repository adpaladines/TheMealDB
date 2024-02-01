//
//  MealDetailsMediaView.swift
//  TheMealDB
//
//  Created by andres paladines on 2/1/24.
//

import SwiftUI
import Kingfisher

struct MealDetailsMediaView: View {
    
    var imageUrl: String?
    var videoUrl: String?
    
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
            .shadow(color: .black.opacity(0.3), radius: 5)
            .padding(.top)
    }
    
    var body: some View {
//        ScrollView(.horizontal, showsIndicators: true) {
        TabView() {
//            HStack {
                if let url = URL(string: (imageUrl ?? "") ), !hasError {
                    ZStack(alignment: .center) {
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
                            
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .frame(width: 300, height: 250)
                        .cornerRadius(cornerRadius)
                        .shadow(color: .black.opacity(0.3), radius: 5)
                        .padding()
                        
                }else  {
                    presentPlaceHolder()
                }
                
                YouTubeView(completeUrl: videoUrl, videoId: nil)
                    .frame(width: 300, height: 250)
                    .cornerRadius(cornerRadius)
                    .padding()
//            }
        }
        .frame(height: 250)
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .tabViewStyle(.page(indexDisplayMode: .always))
//        }
        
    }
}

#Preview {
    MealDetailsMediaView(imageUrl: "https://www.themealdb.com/images/media/meals/1520081754.jpg")
}
