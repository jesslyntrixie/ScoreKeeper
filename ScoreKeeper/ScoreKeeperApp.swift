//
//  ScoreKeeperApp.swift
//  ScoreKeeper
//
//  Created by Jesslyn Trixie Edvilie on 11/04/26.
//

import SwiftUI
import SwiftData

@main
struct ScoreKeeperApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
