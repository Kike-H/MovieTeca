//
//  MovieTecaApp.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 24/07/22.
//

import SwiftUI

@main
struct MovieTecaApp: App {
    @StateObject var csManager = ColorSchemeManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    csManager.applyColorScheme()
                }
        }
    }
}
