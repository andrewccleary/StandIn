//
//  StandInApp.swift
//  StandIn
//
//  Created by Andrew Cleary on 5/5/21.
//

import SwiftUI

@main
struct StandInApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
