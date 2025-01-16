//
//  SukumiApp.swift
//  Sukumi
//
//  Created by HKinfoway Tech. on 15/01/25.
//

import SwiftUI

@main
struct SukumiApp: App {
    @StateObject private var gameSettings = GameSettings()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(gameSettings)
        }
    }
}
