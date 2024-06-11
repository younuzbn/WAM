//
//  WAMApp.swift
//  WAM
//
//  Created by Younuz Bin Noushad on 07/05/24.
//

import SwiftUI
import Firebase

@main
struct WAMApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
