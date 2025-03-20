//
//  Day60_ChallengeApp.swift
//  Day60_Challenge
//
//  Created by Hadi Al zayer on 25/08/1446 AH.
//

import SwiftUI
import SwiftData

@main
struct Day60_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
        .modelContainer(for: User.self)
        
        
    }
}
