//
//  LoveMemoApp.swift
//  LoveMemo
//
//  Created by zluof on 2024/11/8.
//

import SwiftUI

@main
struct LoveMemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
