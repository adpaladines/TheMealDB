//
//  TheMealDBApp.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import SwiftUI

@main
struct TheMealDBApp: App {
    
    var body: some Scene {
        WindowGroup {
            if UIDevice.current.isJailBroken {
                JailbreakCheckView(isJailbroken: true)
            }else {
                NavigationView {
                    AppCoordinator().start()
                }
                .navigationBarHidden(true)
            }
        }
    }
}
