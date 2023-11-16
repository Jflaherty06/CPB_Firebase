//
//  CPBFirebaseApp.swift
//  CPBFirebase
//
//  Created by Jak Flaherty on 11/14/23.
//

import SwiftUI
import FirebaseCore

@main
struct CPBFirebaseApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
