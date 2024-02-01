//
//  LoadingView.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            Circle() // Animated circle
                .trim(from: 0, to: 0.7)
                .stroke(Color.primaryColorApp, lineWidth: 8)
                .frame(width: 50, height: 50)
                .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                .onAppear {
                    withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                        self.isAnimating = true
                    }
                }
                .onDisappear {
                    self.isAnimating = false
                }
            Text("Loading...")
                .font(.headline)
                .foregroundColor(Color.primaryColorApp)
                .padding(.top, 10)
        }
    }
}

#Preview {
    LoadingView()
}
