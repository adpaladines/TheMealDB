//
//  View+Extensions.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import SwiftUI

extension View {

    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
}
