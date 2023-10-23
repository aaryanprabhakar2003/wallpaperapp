//
//  wallpaperappApp.swift
//  wallpaperapp
//
//  Created by Aaryan Prabhakar on 23/10/23.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth



@main
struct wallpaperappApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkMonitor)
        }
    }
}
