//
//  Arbuz_HWApp.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI

@main
struct Arbuz_HWApp: App {
    let parserViewModel = ParserViewModel()
    @AppStorage("isOnboarding") private var isOnboarding = true
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
                    .environmentObject(parserViewModel)
            } else {
                BottomNavigationBar()
                    .environmentObject(parserViewModel)
            }
        }
        
    }
}
