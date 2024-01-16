//
//  DailyTallyApp.swift
//  DailyTally Watch App
//
//  Created by Andrew Bloese on 1/13/24.
//

import SwiftUI
import SwiftData
@main
struct DailyTally_Watch_AppApp: App {
    
    let container: ModelContainer = {
        let schema = Schema([DailyCounter.self])
        let container = try! ModelContainer(for:schema, configurations: [] )
        return container
    }()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
    
}
