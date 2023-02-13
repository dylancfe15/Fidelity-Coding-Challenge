//
//  Fidelity_Coding_ChallengeApp.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/12/23.
//

import SwiftUI

@main
struct Fidelity_Coding_ChallengeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
