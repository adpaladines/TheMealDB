//
//  MealDetailsHeaderView.swift
//  TheMealDB
//
//  Created by andres paladines on 2/1/24.
//

import SwiftUI

struct MealDetailsHeaderView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var coordinator: AppCoordinator
        
    var title: String?
    
    var letftButtonHidden: Bool = false
    var rightButtonHidden: Bool = false
    
    @State var isAlertPresent: Bool = false
    
    init(title: String? = nil) {
        self.title = title
    }
    
    var body: some View {
        VStack {
            HStack {
                if !letftButtonHidden {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .padding()
                            .imageScale(.large)
                            .frame(width: 36, height: 36)
                    }
                    .foregroundColor(Color(uiColor: .darkGray))
                }
                Spacer()
                
            }
            Text(title ?? "Meal without name")
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(1)
            
        }
        .padding([.horizontal])
    }
}



#Preview {
    MealDetailsHeaderView(title: "Beef with salt")
        .environmentObject(AppCoordinator())
}
