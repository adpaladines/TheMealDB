//
//  TheMealDBApp.swift
//  TheMealDB
//
//  Created by andres paladines on 1/31/24.
//

import SwiftUI

@main
struct TheMealDBApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
